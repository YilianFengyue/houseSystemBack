
import jwt
import datetime
from flask import current_app, request, jsonify


def generate_token(user_id, username, expire_minutes=60):
    secret = current_app.config["JWT_SECRET_KEY"]
    payload = {
        "user_id": user_id,
        "username": username,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=expire_minutes)
    }

    return jwt.encode(payload, secret, algorithm="HS256")

def verify_token(token):
    secret = current_app.config["JWT_SECRET_KEY"]
    try:
        payload = jwt.decode(token, secret, algorithms=["HS256"])
        return payload
    except jwt.ExpiredSignatureError:
        return None
    except jwt.InvalidTokenError:
        return None

# 装饰器：保护路由
def login_required(f):
    def wrapper(*args, **kwargs):
        token = request.headers.get("Authorization")
        if not token:
            return jsonify({"code": 401, "msg": "缺少 token"}), 401
        payload = verify_token(token)
        if not payload:
            return jsonify({"code": 401, "msg": "无效或过期的 token"}), 401
        request.user = payload  # 将用户信息绑定到 request 上
        return f(*args, **kwargs)
    wrapper.__name__ = f.__name__
    return wrapper
