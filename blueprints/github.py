from flask import Blueprint, redirect, url_for, session, current_app
from flask_dance.contrib.github import make_github_blueprint, github
from sqlalchemy.exc import IntegrityError
from models.user_model import UserModel
from exts import db
from utils.response_utils import success_response, error_response, Code
import jwt
import datetime
import certifi

def create_github_bp(app):
    """延迟创建 GitHub Blueprint"""
    github_bp = make_github_blueprint(
        client_id=app.config['GITHUB_CLIENT_ID'],
        client_secret=app.config['GITHUB_CLIENT_SECRET'],
        redirect_url=app.config['GITHUB_CALLBACK_URL'],
        scope="user:email",
    )

    @github_bp.route("/github/github_login")
    def github_login():
        return redirect(url_for("github.login"))  # 直接跳转到 /github，Flask-Dance 接手

    @github_bp.route("/github/authorized")
    def github_authorized_redirect():
        return redirect(url_for("github.github_callback"))  # 这里的名字根据你的蓝图注册名修改

    @github_bp.route("/github/callback")  # ✅ 不再和 Flask-Dance 默认的冲突
    def github_callback():
        if not github.authorized:
            return "GitHub 登录失败", 401

        resp = github.get("/user")
        if not resp.ok:
            return "无法获取 GitHub 用户信息", 400

        user_data = resp.json()
        email = user_data.get("email") or f"{user_data['id']}@github.temp"

        # 创建或获取用户
        user = UserModel.query.filter_by(email=email).first()
        if not user:
            user = UserModel(email=email)
            db.session.add(user)
            db.session.commit()

        token = jwt.encode({
            "user_id": user.id,
            "email": user.email,
            "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=24)
        }, current_app.config["SECRET_KEY"], algorithm="HS256")

        return redirect(f"http://localhost:5500/?token={token}")

    return github_bp

