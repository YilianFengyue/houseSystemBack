from flask import Blueprint, request, jsonify
from services.user_service import (
    create_user, get_user_by_username, get_all_users, get_user_by_id,
    generate_verification_code, send_verification_email, verify_code,
    update_verification_code, get_user_status, get_user_info,
    update_user_info, delete_user_account, reset_password
)
from utils.jwt_utils import generate_token
from utils.jwt_utils import login_required
from exts import db
from models.models import UserInfo

user_bp = Blueprint("user", __name__)


# 用户注册，POST /users
@user_bp.route("/users", methods=["POST"])
def register():
    data = request.json
    username = data.get("username")
    password = data.get("password")
    identification = data.get("identification")
    phone = data.get("phone")

    if get_user_by_username(username):
        return jsonify({"code": 400, "msg": "用户已存在"}), 400

    create_user(username, password,identification,phone)
    return jsonify({"code": 201, "msg": "用户注册成功"}), 201


# 用户登录，POST /auth/login
@user_bp.route("/auth/login", methods=["POST"])
def login():
    data = request.json
    username = data.get("username")
    password = data.get("password")

    user = get_user_by_username(username)
    if user and user.password == password:
        token = generate_token(user.id, user.username)
        return jsonify({"code": 200,
                        "msg": "登录成功",
                        "data": {"id": user.id, "username": user.username,"password": user.password,"identification":user.identification, "phone":user.phone},
                        "token": token
                        })

    return jsonify({"code": 401, "msg": "用户名或密码错误"}), 401

#获取所有用户
@user_bp.route("/users", methods=["GET"])
def get_users():
    users = get_all_users()
    return jsonify({"code": 200,
                    "msg": "获取成功",
                    "data": [{"id": user.id, "username": user.username, "password": user.password} for user in users]})

@user_bp.route("/users/<int:user_id>/status", methods=["GET"])
def get_status(user_id):
    status = get_user_status(user_id)
    if status is None:
        return jsonify({"code": 404, "msg": "用户不存在"}), 404
    return jsonify({"code": 200,
                    "msg": "获取成功",
                    "data": {"status": status}})

@user_bp.route("/profile", methods=["GET"])
@login_required
def profile():
    user_info = request.user  # 从 token 中解出的信息
    return jsonify({
        "code": 200,
        "msg": "获取成功",
        "data": user_info
    })

@user_bp.route("/userInfo", methods=["GET"])
@login_required
def get_full_user_info():
    """获取用户完整信息"""
    username = request.user.get("username")
    user = get_user_info(username)
    if not user:
        return jsonify({"code": 404, "msg": "用户不存在"}), 404
    return jsonify({
        "code": 200,
        "msg": "获取成功",
        "data": {
            "id": user.id,
            "username": user.name,
            "email": user.email,
            "phone": user.phone,
            "addr": user.addr,
            "status": user.status
        }
    })

@user_bp.route("/", methods=["PUT"])
@login_required
def update_account():
    """更新用户账户信息"""
    user_id = request.user.get("id")
    data = request.json
    if not update_user_info(user_id, **data):
        return jsonify({"code": 400, "msg": "更新失败"}), 400
    return jsonify({"code": 200, "msg": "更新成功"})

@user_bp.route("/<int:user_id>", methods=["DELETE"])
@login_required
def delete_account(user_id):
    """删除用户账户"""
    if not delete_user_account(user_id):
        return jsonify({"code": 400, "msg": "删除失败"}), 400
    return jsonify({"code": 200, "msg": "删除成功"})

@user_bp.route("/reset-password", methods=["PUT"])
@login_required
def reset_user_password():
    """重置用户密码"""
    username = request.user.get("username")
    if not reset_password(username):
        return jsonify({"code": 400, "msg": "重置失败"}), 400
    return jsonify({"code": 200, "msg": "重置成功"})

@user_bp.route("/auth/send_code", methods=["POST"])
def send_code():
    """发送验证码"""
    email = request.json.get("email")
    if not email:
        return jsonify({"code": 400, "msg": "邮箱不能为空"}), 400
    
    # 生成验证码
    code = generate_verification_code()
    
    # 更新验证码信息
    if not update_verification_code(email, code):
        return jsonify({"code": 400, "msg": "邮箱未注册"}), 400
    
    # 发送邮件
    try:
        send_verification_email(email, code)
        return jsonify({"code": 200, "msg": "验证码发送成功"})
    except Exception as e:
        return jsonify({"code": 500, "msg": "验证码发送失败"}), 500

@user_bp.route("/auth/login_with_code", methods=["POST"])
def login_with_code():
    """验证码登录"""
    email = request.json.get("email")
    code = request.json.get("code")
    
    if not email or not code:
        return jsonify({"code": 400, "msg": "邮箱和验证码不能为空"}), 400
    
    # 验证验证码
    if not verify_code(email, code):
        return jsonify({"code": 401, "msg": "验证码错误或已过期"}), 401
    
    # 获取用户信息
    user = db.session.query(UserInfo).filter_by(email=email).first()
    if not user:
        return jsonify({"code": 404, "msg": "用户不存在"}), 404
    
    # 生成token
    token = generate_token(user.id, user.name)
    return jsonify({
        "code": 200,
        "msg": "登录成功",
        "data": {
            "id": user.id,
            "username": user.name,
            "email": user.email
        },
        "token": token
    })
