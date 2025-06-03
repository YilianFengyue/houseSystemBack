import jwt
import datetime
from flask import Blueprint, request, current_app, g # 引入 g
from sqlalchemy.exc import IntegrityError
from services.user_service import (get_user_by_email, get_user_by_name, get_all_users,
                                   get_user_by_id, get_user_by_phone)
from models.user_model import UserModel
from exts import db
from utils.response_utils import success_response, error_response, Code
from decorators.decorators import token_required
import random
from exts.redis import redis_store
from socket import *
import base64
import ssl
import os
import time
from blueprints.celery import send_verification_email

user = Blueprint("user", __name__, url_prefix="/user")

@user.route("/register", methods=["POST"])
def register():
    phone = request.form.get('phone')
    password = request.form.get('password')
    email = request.form.get('email')

    if not phone or not password:
        # 修正点：使用 message 参数，并传入正确的 Code
        return error_response(code=Code.BAD_REQUEST, message="手机号和密码不能为空")
    if not email:
        return error_response(code=Code.BAD_REQUEST, message="邮箱不能为空")

    if UserModel.query.filter_by(phone=phone).first():
        # 修正点：使用 message 参数
        return error_response(code=Code.GET_ERR, message="注册失败，该手机号已被注册")
    if UserModel.query.filter_by(email=email).first():
        return error_response(code=Code.GET_ERR, message="注册失败，该邮箱已被注册")

    try:
        new_user = UserModel(phone=phone)
        new_user.set_password(password)
        new_user.email = email
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

# 用户密码修改接口,通过id修改
@user.route("/userinfo/password", methods=["PUT"])
# @token_required
def userinfo_password():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="密码不能为空")

    password = data.get('password')
    current_user = get_user_by_id(data['id'])

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
@user.route("/userinfo", methods=["PUT"])
# @token_required
def userinfo_update():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")

    current_user = get_user_by_id(data['id'])

    user = current_user.to_dict()
    # 先验证身份证号相关逻辑（使用数据库中现有值）
    if user['identityCard'] is not None:
        return error_response(code=Code.UPDATE_ERR, message="您已填写过身份证号，不可更改")

    # 检查请求中的身份证号长度（如果提供了）
    if 'identityCard' in data and len(data['identityCard']) != 18:
        return error_response(code=Code.UPDATE_ERR, message="身份证号长度必须为18位")

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

# 身份选择，管理员或房东
@user.route("/userinfo/usertype", methods=["PUT"])
# @token_required
def userinfo_usertype_update():
    data = request.json

    if not data:
        return error_response(code=Code.BAD_REQUEST, message="<UNK>")

    return success_response(code=Code.UPDATE_OK, message="<UNK>")

# 新接口，根据用户邮箱发验证码，以重置密码
# @user.route("/userinfo/password", methods=["POST"])
# @token_required
# def password_reset():
#     data = request.json
#     if not data:
#         return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
#
#     email = data.get('email')
#
#     newuser = get_user_by_email(email)
#     if newuser is None:
#         return error_response(code=Code.GET_ERR, message="不存在该用户")
#
#     # 生成 6 位验证码
#     verification_code = ''.join([str(random.randint(0, 9)) for _ in range(6)])
#
#     # 将验证码存储到 Redis 中，设置过期时间为 2 分钟
#     redis_key = f'verification_code:{email}'
#     redis_store.set(redis_key, verification_code, ex=120)
#
#     # 构建完整的邮件内容，包括必要的头部信息
#     sender_email = '2298786941@qq.com'
#     recipient_email = f'{str(email)}'
#     # 你需要在 QQ 邮箱设置中开启 SMTP 服务并获取授权码
#     authorization_code = 'iymnhrycsgredhib'
#     subject = '密码重置邮件'
#     text_content = f'你好，这是您的验证码{str(verification_code)}, 请在2分钟以内填写验证码'
#
#     # 构建 MIME 格式的邮件内容
#     msg = (
#         f"From: {sender_email}\r\n"
#         f"To: {recipient_email}\r\n"
#         f"Subject: {subject}\r\n"
#         "MIME-Version: 1.0\r\n"
#         "Content-Type: multipart/mixed; boundary=boundary\r\n"
#         "\r\n"
#         "--boundary\r\n"
#         "Content-Type: text/plain; charset=UTF-8\r\n"
#         "\r\n"
#         f"{text_content}\r\n"
#         "--boundary\r\n"
#     )
#     endmsg = "\r\n.\r\n"
#     # 选择 QQ 邮箱的 SMTP 服务器
#     mailServer = ("smtp.qq.com", 587)
#
#     # 发送邮件
#     try:
#         # 创建 socket 和邮件服务器建立 TCP 连接
#         clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#         clientSocket.connect(mailServer)
#
#         recv = clientSocket.recv(1024).decode()
#         print(recv)
#         if recv[:3] != '220':
#             raise Exception("220 reply not received from server.")
#
#         # 发送 HELO 命令，打印服务器响应
#         heloCommand = 'HELO Alice\r\n'
#         clientSocket.send(heloCommand.encode())
#         recv1 = clientSocket.recv(1024).decode()
#         # print(recv1)
#         if recv1[:3] != '250':
#             raise Exception('250 reply not received from server.')
#
#         # 发送 STARTTLS 命令，开启加密连接
#         starttlsCommand = 'STARTTLS\r\n'
#         clientSocket.send(starttlsCommand.encode())
#         recv2 = clientSocket.recv(1024).decode()
#         # print(recv2)
#         if recv2[:3] != '220':
#             raise Exception('220 reply not received from server after STARTTLS.')
#
#         # 使用 ssl.SSLContext 创建安全套接字
#         context = ssl.create_default_context()
#         clientSocket = context.wrap_socket(clientSocket, server_hostname='smtp.qq.com')
#
#         # 再次发送 HELO 命令，打印服务器响应
#         clientSocket.send(heloCommand.encode())
#         recv3 = clientSocket.recv(1024).decode()
#         # print(recv3)
#         if recv3[:3] != '250':
#             raise Exception('250 reply not received from server after STARTTLS HELO.')
#
#         # 发送 AUTH LOGIN 命令
#         authCommand = 'AUTH LOGIN\r\n'
#         clientSocket.send(authCommand.encode())
#         recv_auth = clientSocket.recv(1024).decode()
#         # print(recv_auth)
#         if recv_auth[:3] != '334':
#             raise Exception('334 reply not received from server after AUTH LOGIN.')
#
#         # 对邮箱地址和授权码进行 Base64 编码
#         email_encoded = base64.b64encode(sender_email.encode()).decode()
#         password_encoded = base64.b64encode(authorization_code.encode()).decode()
#
#         # 发送编码后的邮箱地址
#         clientSocket.send((email_encoded + '\r\n').encode())
#         recv_email = clientSocket.recv(1024).decode()
#         # print(recv_email)
#         if recv_email[:3] != '334':
#             raise Exception('334 reply not received from server after sending email.')
#
#         # 发送编码后的授权码
#         clientSocket.send((password_encoded + '\r\n').encode())
#         recv_password = clientSocket.recv(1024).decode()
#         # print(recv_password)
#         if recv_password[:3] != '235':
#             raise Exception('235 reply not received from server after sending password.')
#
#         # 发送 MAIL FROM 命令，打印服务器响应
#         mailFromCommand = f'MAIL FROM: <{sender_email}>\r\n'
#         clientSocket.send(mailFromCommand.encode())
#         recv4 = clientSocket.recv(1024).decode()
#         # print(recv4)
#         if recv4[:3] != '250':
#             raise Exception('250 reply not received from server after MAIL FROM.')
#
#         # 发送 RCPT TO 命令，打印服务器响应
#         rcptToCommand = f'RCPT TO: <{recipient_email}>\r\n'
#         clientSocket.send(rcptToCommand.encode())
#         recv5 = clientSocket.recv(1024).decode()
#         # print(recv5)
#         if recv5[:3] != '250':
#             raise Exception('250 reply not received from server after RCPT TO.')
#
#         # 发送 DATA 命令，打印服务器响应
#         dataCommand = 'DATA\r\n'
#         clientSocket.send(dataCommand.encode())
#         recv6 = clientSocket.recv(1024).decode()
#         # print(recv6)
#         if recv6[:3] != '354':
#             raise Exception('354 reply not received from server after DATA.')
#
#         # 发送邮件内容
#         clientSocket.send(msg.encode())
#
#         # 消息以单个"."结束
#         clientSocket.send(endmsg.encode())
#         recv7 = clientSocket.recv(1024).decode()
#         # print(recv7)
#         if recv7[:3] != '250':
#             raise Exception('250 reply not received from server after sending message.')
#
#         # 发送 QUIT 命令，获取服务器响应
#         quitCommand = 'QUIT\r\n'
#         max_retries = 3
#         retries = 0
#         while retries < max_retries:
#             clientSocket.send(quitCommand.encode())
#             time.sleep(1)  # 增加 1 秒延迟
#             recv8 = clientSocket.recv(1024).decode()
#             # print(recv8)
#             if recv8[:3] == '221':
#                 break
#             retries += 1
#         if retries == max_retries:
#             raise Exception('221 reply not received from server after QUIT.')
#
#         return success_response(data=f"{str(verification_code)}", message="验证码发送成功", code=200)
#     except Exception as e:
#         print(f"Error occurred: {e}")
#         return error_response(message=str(e), code=500)
#     finally:
#         # 关闭连接
#         if 'clientSocket' in locals():
#             clientSocket.close()
#         return success_response(data=f"{str(verification_code)}", message="验证码发送成功", code=200)

# 修改，使用celery异步实现发送邮件验证码
@user.route("/userinfo/password", methods=["POST"])
# @token_required
def password_reset():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")

    email = data.get('email')
    newuser = get_user_by_email(email)
    if newuser is None:
        return error_response(code=Code.GET_ERR, message="不存在该用户")

    verification_code = ''.join([str(random.randint(0, 9)) for _ in range(6)])
    redis_key = f'verification_code:{email}'
    redis_store.set(redis_key, verification_code, ex=120)

    # 异步调用
    send_verification_email.delay(email, verification_code)

    return success_response(data=verification_code, message="验证码发送中，请查收邮件", code=200)

# 根据邮箱改密码
@user.route('/userinfo/password_e', methods=['PUT'])
def userinfo_password_e():
    data = request.json
    if not data:
        return error_response(code=Code.BAD_REQUEST, message="密码不能为空")

    password = data.get('password')
    email = data.get('email')

    current_user = get_user_by_email(email)

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
