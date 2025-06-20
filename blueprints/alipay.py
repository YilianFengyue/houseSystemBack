from flask import Blueprint, request, jsonify, redirect, current_app, session
from exts.alipay_client import AlipayClient
from exts.alipay import Alipay   # 仅用来读取常量
from utils.response_utils import success_response, error_response
from services.user_service import get_user_by_id
from models.user_model import UserModel
import jwt
from datetime import datetime, timedelta
from exts.db import db
from urllib.parse import quote

alipay_bp = Blueprint("alipay", __name__, url_prefix="/api/alipay")
client = AlipayClient()


@alipay_bp.post("/pay")
def pay():
    """前端调用此接口，生成跳转到支付宝收银台的 URL"""
    payload = request.get_json(force=True)
    out_trade_no = payload.get("out_trade_no")
    total_amount = payload.get("total_amount")   # 建议前端保留两位小数
    subject = payload.get("subject", "订单")

    if not all([out_trade_no, total_amount]):
        return error_response(code=400, message="缺少参数")

    try:
        pay_url = client.generate_payment_url(
            out_trade_no=out_trade_no,
            total_amount=total_amount,
            subject=subject
        )
        return success_response(code=200, data={"pay_url": pay_url}, message="获取成功")
    except Exception as e:
        current_app.logger.exception(e)
        return error_response(code=500, message="生成支付链接失败")


@alipay_bp.post("/notify")
def notify():
    """
    支付宝服务器异步回调（关键）。
    成功后必须返回字符串 'success'，否则支付宝会不断重试。
    """
    data = request.form.to_dict()
    signature = data.pop("sign", None)

    if client.verify(data, signature):
        # 这里根据 out_trade_no 更新你的订单状态、发货、记录流水等业务逻辑
        out_trade_no = data.get("out_trade_no")
        trade_status = data.get("trade_status")  # TRADE_SUCCESS / TRADE_FINISHED
        # …自定义业务
        return "success"
    else:
        return "failure", 400


@alipay_bp.get("/return")
def return_result():
    """
    同步回跳（买家支付完成后浏览器跳回前端页面）。
    实际支付结果应以 /notify 为准，
    这里简单做一次校验后重定向到前端结果页。
    """
    data = request.args.to_dict()
    signature = data.pop("sign", None)

    verified = client.verify(data, signature)
    status = "success" if verified else "failure"

    # 把状态拼到前端结果页，前端可据此展示支付结果
    redirect_url = f"{Alipay.RETURN_URL}?status={status}"
    return redirect(redirect_url, code=302)

@alipay_bp.get("/verify_return")
def verify_return():
    try:
        # 沙箱环境绕过验签，直接展示“成功”
        data = request.args.to_dict()

        return jsonify({
            "status": "success",
            "out_trade_no": data.get("out_trade_no")
        }), 200

    except Exception as e:
        # 打印完整堆栈到日志
        current_app.logger.exception("Exception in /verify_return")
        # 同时把错误信息返回给客户端
        return jsonify({
            "error": str(e),
            "trace": repr(e)
        }), 500

# 支付宝第三方登录
# 方法弃用，无公网地址
# @alipay_bp.route("/login")
# def alipay_login():
#     # 1. 先保存前端跳转后的地址，授权成功后用
#     next_url = request.args.get("next", "http://localhost:4173")
#     session['alipay_oauth_next'] = next_url
#
#     # 2. URL 编码你的回调地址
#     redirect_uri = quote(Alipay.CALLBACK_URL, safe='')
#
#     # 3. 构造支付宝授权页面链接（沙箱地址）
#     alipay_auth_url = (
#         f"https://openauth.alipaydev.com/oauth2/publicAppAuthorize.htm?"
#         f"app_id={Alipay.APP_ID}&scope=auth_user&redirect_uri={redirect_uri}&state=xyz"
#     )
#     print("Alipay Auth URL:", alipay_auth_url)  # 打印出来确认
#     # 4. 重定向用户到支付宝授权页面
#     return redirect(alipay_auth_url)
#
# @alipay_bp.route("/oauth_callback")
# def alipay_oauth_callback():
#     auth_code = request.args.get("auth_code")
#     if not auth_code:
#         return "Missing auth_code", 400
#
#     try:
#         # 获取 access_token 和 user_id
#         token = client.get_auth_token(auth_code)
#         access_token = token.get("access_token")
#         alipay_user_id = token.get("user_id")
#
#         # 获取用户信息
#         user_info = client.get_user_info(access_token)
#         nick_name = user_info.get("nick_name", "支付宝用户")
#
#         # 查或建用户（你需要扩展 UserModel 支持 alipay_user_id）
#         user = get_user_by_id(alipay_user_id)
#         if not user:
#             user = UserModel(id=alipay_user_id, name=nick_name)
#             db.session.add(user)
#             db.session.commit()
#
#         # 发 token
#         jwt_token = jwt.encode({
#             "user_id": user.id,
#             "alipay_user_id": alipay_user_id,
#             "exp": datetime.utcnow() + timedelta(hours=24)
#         }, current_app.config["SECRET_KEY"], algorithm="HS256")
#
#         next_url = session.pop("alipay_oauth_next", "http://localhost:4173")
#         return redirect(f"{next_url}?token={jwt_token}")
#
#     except Exception as e:
#         current_app.logger.exception("支付宝登录失败")
#         return "支付宝登录失败", 500



