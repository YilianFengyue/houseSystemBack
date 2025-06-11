from flask import Blueprint, request, jsonify, redirect, current_app
from exts.alipay_client import AlipayClient
from exts.alipay import Alipay   # 仅用来读取常量
from utils.response_utils import success_response, error_response

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
