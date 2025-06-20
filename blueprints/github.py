from flask import Blueprint, redirect, current_app, request, jsonify, session
import requests
from models.user_model import UserModel
from exts import db
import jwt
import datetime
from blueprints.celery_bp import fetch_github_user_data

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

# 修改方法，使用celery实现
# 仍使用同步，会阻塞主线程，但耗时任务交给celery
# 其实仍建议改为异步轮询的形式
@github_bp.route("/callback")
def github_callback():
    code = request.args.get("code")
    if not code:
        return "Missing code", 400

    # 调用 Celery 异步任务获取用户信息
    result = fetch_github_user_data.apply(args=[code])  # 同步调用，但只执行网络请求部分
    data = result.get()

    if not data or "error" in data:
        return f"GitHub 登录失败: {data.get('error', '未知错误')}", 400

    email = data.get("email")
    if not email:
        return "无法获取邮箱", 400

    # 查或创建用户
    user = UserModel.query.filter_by(email=email).first()
    if not user:
        user = UserModel(email=email)
        db.session.add(user)
        db.session.commit()

    # 签发 JWT
    token = jwt.encode({
        "user_id": user.id,
        "email": user.email,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=24)
    }, current_app.config["SECRET_KEY"], algorithm="HS256")

    # 重定向到前端并携带 token
    next_url = session.pop('oauth_next', 'http://localhost:4173')
    return redirect(f"{next_url}?token={token}")