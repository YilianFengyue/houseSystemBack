import jwt
import datetime
from flask import Blueprint, request, current_app, g # 引入 g
from sqlalchemy.exc import IntegrityError
from services.user_service import (get_user_by_id, get_user_by_name, get_all_users,
                                   get_user_by_id, get_user_by_phone)
#UserInfo
from models.user_model import UserModel
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

    if UserModel.query.filter_by(phone=phone).first():
        # 修正点：使用 message 参数
        return error_response(code=Code.GET_ERR, message="注册失败，该手机号已被注册")

    try:
        new_user = UserModel(phone=phone)
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

    if not phone or not password:
        return error_response(code=Code.BAD_REQUEST, message="手机号和密码不能为空")

    user_model = UserModel.query.filter_by(phone=phone).first()

    if user_model and user_model.check_password(password):
        token_payload = {
            'user_id': user_model.id,
            'phone': user_model.phone,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)
        }
        token = jwt.encode(token_payload, current_app.config['SECRET_KEY'], algorithm="HS256")

        # 修正点：将 token 放入 data 字典中返回，并使用 message 参数
        return success_response(code=Code.SAVE_OK, data={"token": token}, message="登录成功")
    else:
        # 修正点：使用 message 参数
        return error_response(code=Code.UNAUTHORIZED, message="登录失败，手机号或密码错误")


@user.route("/userinfo", methods=["GET"])
@token_required
def userinfo():
    current_user = g.user
    # 修正点：使用 message 参数
    return success_response(code=Code.GET_OK, data=current_user.to_dict(), message="获取用户信息成功")

# 根据用户名获取用户
@user.route("/userinfo/<string:name>", methods=["GET"])
def get_user_by_username(name):
    user = get_user_by_name(name)

    if user is None:
        return error_response(code=Code.GET_ERR, message="无该用户")

    return success_response(code=Code.GET_OK, data=user.to_dict(), message="获取成功")

# 用户信息修改接口
@user.route("/userinfo", methods=["PUT"])
@token_required
def userinfo_update():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")

    current_user = get_user_by_name(data['name'])

    # 定义允许修改的字段
    allowed_fields = ['name', 'addr', 'email', 'identityCard', 'phone']

    try:
        # 遍历请求数据中的键值对
        for key, value in data.items():
            if key in allowed_fields and hasattr(current_user, key):
                setattr(current_user, key, value)

        # 提交数据库更改
        db.session.commit()
        return success_response(code=Code.UPDATE_OK, data=current_user.to_dict(), message="用户信息更新成功")

    except IntegrityError:
        db.session.rollback()
        return error_response(code=Code.UPDATE_ERR, message="数据库唯一性约束冲突，更新失败")
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Update user info error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="服务器内部错误")

# 用户密码修改接口
@user.route("/userinfo/password", methods=["PUT"])
@token_required
def userinfo_password():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="密码不能为空")
    password = data.get('password')

    current_user = get_user_by_name(data['name'])

    try:
        # 设置新密码
        current_user.set_password(password)
        # 提交数据库更改
        db.session.commit()
        return success_response(code=Code.UPDATE_OK, message="密码更新成功")
    except IntegrityError:
        db.session.rollback()
        return error_response(code=Code.UPDATE_ERR, message="数据库唯一性约束冲突，更新失败")
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Update user password error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="服务器内部错误")

# 根据手机号返回用户
@user.route("/userinfo/phone", methods=["GET"])
@token_required
def userinfo_phone():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")

    phone = data.get('phone')
    current_user = get_user_by_phone(phone)

    if current_user is None:
        return error_response(code=Code.GET_ERR, message="不存在该用户")

    return success_response(code=Code.GET_OK, data=current_user.to_dict(), message="返回成功")

# 用户信息修改接口，修改部分内容
@user.route("/userinfos", methods=["PUT"])
# @token_required
def userinfo_update_new():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")

    current_user = get_user_by_name(data['name'])

    # 修改内容，根据用户名查询是否填写过身份证号, 或检查填写的身份证号长度
    user = current_user.to_dict()
    if user["identityCard"]:
        return error_response(code=Code.UPDATE_ERR, message="您已填写过身份证号，不可更改")
    elif len(user["identityCard"]) != 18:
        return error_response(code=Code.UPDATE_ERR, message="身份证号长度出错")

    # 定义允许修改的字段
    allowed_fields = ['name', 'addr', 'email', 'identityCard', 'phone']

    try:
        # 遍历请求数据中的键值对
        for key, value in data.items():
            if key in allowed_fields and hasattr(current_user, key):
                setattr(current_user, key, value)

        # 提交数据库更改
        db.session.commit()
        return success_response(code=Code.UPDATE_OK, data=current_user.to_dict(), message="用户信息更新成功")

    except IntegrityError:
        db.session.rollback()
        return error_response(code=Code.UPDATE_ERR, message="数据库唯一性约束冲突，更新失败")
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Update user info error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="服务器内部错误")