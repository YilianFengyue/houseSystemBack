import jwt
import datetime
from flask import Blueprint, request, current_app, g # 引入 g
from sqlalchemy.exc import IntegrityError
from services.user_service import get_user_by_id, get_user_by_username, get_all_users, get_user_by_id, get_user_by_phone
from models.models import UserInfo
from exts import db
from utils.response_utils import success_response, error_response, Code
from decorators.decorators import token_required

user = Blueprint("user", __name__, url_prefix="/user")

@user.route("/register", methods=["POST"])
def register():
    phone = request.form.get('phone')
    password = request.form.get('password')

    if not phone or not password:
        # 修正点：使用 message 参数，并传入正确的 Code
        return error_response(code=Code.BAD_REQUEST, message="手机号和密码不能为空")

    if UserInfo.query.filter_by(phone=phone).first():
        # 修正点：使用 message 参数
        return error_response(code=Code.GET_ERR, message="注册失败，该手机号已被注册")

    try:
        new_user = UserInfo(phone=phone)
        new_user.set_password(password)
        db.session.add(new_user)
        db.session.commit()
        # 修正点：使用 message 参数
        return success_response(code=Code.SAVE_OK, message="注册成功！") # 这里 data 为 None，会自动省略
    except IntegrityError:
        db.session.rollback()
        # 修正点：使用 message 参数
        return error_response(code=Code.UPDATE_ERR, message="数据库唯一性约束冲突，该手机号可能已被注册")
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Register error: {e}")
        # 修正点：使用 message 参数
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="服务器内部错误")

@user.route("/login", methods=["POST"])
def login():
    phone = request.form.get('phone')
    password = request.form.get('password')
    print(phone, password)

    if not phone or not password:
        return error_response(code=Code.BAD_REQUEST, message="手机号和密码不能为空")

    # user_model = UserInfo.query.filter_by(phone=phone).first()
    new_user = get_user_by_phone(phone)

    if new_user:
        token_payload = {
            'user_id': new_user.id,
            'phone': new_user.phone,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)
        }
        token = jwt.encode(token_payload, current_app.config['SECRET_KEY'], algorithm="HS256")

        # 修正点：将 token 放入 data 字典中返回，并使用 message 参数
        return success_response(code=Code.SAVE_OK, data={"token": token}, message="登录成功")
        # return success_response(code=Code.SAVE_OK, message="登录成功")
    else:
        # 修正点：使用 message 参数
        return error_response(code=Code.UNAUTHORIZED, message="登录失败，手机号或密码错误")


@user.route("/userinfo", methods=["GET"])
@token_required
def userinfo():
    current_user = g.user
    # 修正点：使用 message 参数
    return success_response(code=Code.GET_OK, data=current_user.to_dict(), message="获取用户信息成功")
