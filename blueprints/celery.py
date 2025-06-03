from flask import Blueprint, current_app
from exts.celery import celery
import requests
from exts.db import db
from models.user_model import UserModel
import jwt
import datetime
celery_bp = Blueprint("celery", __name__)

@celery.task
def add(x, y):
    try:
        return x + y
    except Exception as e:
        return "错误"
@celery_bp.route('/test-celery', methods=["GET"])
def test_celery():
    result = add.delay(4, 5)
    return f"Celery task ID: {result.id}"

@celery_bp.route('/check-result/<task_id>', methods=["GET"])
def check_result(task_id):
    result = add.AsyncResult(task_id)
    if result.ready():
        return f"Task result: {result.get()}"
    else:
        return "Task is not ready yet."

# 使用celery实现github异步登录请求
@celery.task
def fetch_github_user_data(code):
    from flask import current_app
    import requests

    try:
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
            return {"error": "Failed to get access token"}

        # 获取用户基本信息
        user_response = requests.get(
            current_app.config["GITHUB_API_BASE_URL"] + "user",
            headers={"Authorization": f"token {access_token}"}
        )
        user_data = user_response.json()

        # 获取邮箱
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

        return {"email": email}

    except Exception as e:
        return {"error": str(e)}