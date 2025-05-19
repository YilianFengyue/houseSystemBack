from flask import Blueprint, request, jsonify
from services.user_service import create_user, get_user_by_username, get_all_users,get_user_by_id

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
    name = data.get("name")
    password = data.get("password")

    user = get_user_by_username(name)
    if user and user.password == password:
        # token = generate_token(user.id, user.username)
        return jsonify({"code": 200,
                        "msg": "登录成功",
                        "data": {"id": user.id, "username": user.name,"password": user.password,"identityCard":user.identityCard, "phone":user.phone},
                        # "token": token
                        })

    return jsonify({"code": 401, "msg": "用户名或密码错误"}), 401

#获取所有用户
@user_bp.route("/users", methods=["GET"])
def get_users():
    users = get_all_users()
    return jsonify({"code": 200,
                    "msg": "获取成功",
                    "data": [{"id": user.id, "username": user.username, "password": user.password} for user in users]})

@user_bp.route("/profile", methods=["GET"])
# @login_required
def profile():
    user_info = request.user  # 从 token 中解出的信息
    return jsonify({
        "code": 200,
        "msg": "获取成功",
        "data": user_info
    })
