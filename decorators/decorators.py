import jwt
from functools import wraps
from flask import request, g, current_app
from models.models import UserInfo
from utils.response_utils import error_response, Code
from services.user_service import get_user_by_id

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if request.method == 'OPTIONS':
            return f(*args, **kwargs)

        token = None
        # 前端可能把 token 放在 'Authorization' 头里，格式为 'Bearer <token>'
        if 'Authorization' in request.headers:
            # 兼容'Bearer <token>' 和直接发送 '<token>' 两种形式
            auth_header = request.headers['Authorization']
            parts = auth_header.split()
            if len(parts) == 2 and parts[0].lower() == 'bearer':
                token = parts[1]
            else:
                token = auth_header # 直接就是token

        if not token:
            return error_response(code=Code.UNAUTHORIZED, msg='Token is missing!')

        try:
            # 使用在 app 中配置的 SECRET_KEY 来解码
            data = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=["HS256"])
            # 从 token 中取出 user_id，查询用户
            # current_user = UserInfo.query.get(data['user_id'])
            current_user = get_user_by_id(data['user_id'])
            if current_user is None:
                return error_response(code=Code.NOT_FOUND, message='User not found!')
            # 将用户信息存入 g 对象，方便视图函数使用
            g.user = current_user
        except jwt.ExpiredSignatureError:
            return error_response(code=Code.UNAUTHORIZED, message='Token has expired!')
        except jwt.InvalidTokenError:
            return error_response(code=Code.UNAUTHORIZED, message='Token is invalid!')

        return f(*args, **kwargs)

    return decorated