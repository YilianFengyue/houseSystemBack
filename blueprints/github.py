from flask import Blueprint, redirect, current_app, request, jsonify, session
import requests
from models.user_model import UserModel
from exts import db
import jwt
import datetime

github_bp = Blueprint('github', __name__, url_prefix='/github')

# GitHub 登录路由（跳转到 GitHub 授权）
@github_bp.route("/login")
def github_login():
    next_url = request.args.get("next", "http://localhost:4173")  # 默认前端首页
    session['oauth_next'] = next_url  # 存入 session
    github_auth_url = (
        f"https://github.com/login/oauth/authorize?"
        f"client_id={current_app.config['GITHUB_CLIENT_ID']}&"
        f"redirect_uri={current_app.config['GITHUB_CALLBACK_URL']}&"
        f"scope=user:email"
    )
    return redirect(github_auth_url)

# GitHub 回调路由（GitHub重定向到这里）
@github_bp.route("/callback")
def github_callback():
    code = request.args.get("code")
    if not code:
        return "Missing code", 400

    # 获取 access token
    token_response = requests.post(
        current_app.config['GITHUB_ACCESS_TOKEN_URL'],
        headers={"Accept": "application/json"},
        data={
            "client_id": current_app.config['GITHUB_CLIENT_ID'],
            "client_secret": current_app.config['GITHUB_CLIENT_SECRET'],
            "code": code,
            "redirect_uri": current_app.config['GITHUB_CALLBACK_URL'],
        }
    )

    token_json = token_response.json()
    access_token = token_json.get("access_token")
    if not access_token:
        return "Failed to get access token", 400

    # 使用 token 获取用户信息
    user_response = requests.get(
        current_app.config["GITHUB_API_BASE_URL"] + "user",
        headers={"Authorization": f"token {access_token}"}
    )
    user_data = user_response.json()

    # 获取邮箱地址（如果用户未公开邮箱，需要额外请求）
    email = user_data.get("email")
    if not email:
        email_response = requests.get(
            current_app.config["GITHUB_API_BASE_URL"] + "user/emails",
            headers={"Authorization": f"token {access_token}"}
        )
        email_list = email_response.json()
        email = next((e["email"] for e in email_list if e.get("primary") and e.get("verified")), None)
        if not email:
            email = f"{user_data['id']}@github.temp"

    # 创建或获取用户
    user = UserModel.query.filter_by(email=email).first()
    if not user:
        user = UserModel(email=email)
        db.session.add(user)
        db.session.commit()

    # 签发 JWT token
    token = jwt.encode({
        "user_id": user.id,
        "email": user.email,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=24)
    }, current_app.config["SECRET_KEY"], algorithm="HS256")

    # 回传给前端
    next_url = session.pop('oauth_next', 'http://localhost:4173')
    return redirect(f"{next_url}?token={token}")

