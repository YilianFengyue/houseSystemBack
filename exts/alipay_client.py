# exts/alipay_client.py
from exts.alipay import Alipay          # 你的常量/密钥配置文件
from alipay.aop.api.AlipayClientConfig import AlipayClientConfig
from alipay.aop.api.DefaultAlipayClient import DefaultAlipayClient
from alipay.aop.api.domain.AlipayTradePagePayModel import AlipayTradePagePayModel
from alipay.aop.api.request.AlipayTradePagePayRequest import AlipayTradePagePayRequest
from alipay.aop.api.request.AlipaySystemOauthTokenRequest import AlipaySystemOauthTokenRequest
from alipay.aop.api.request.AlipayUserInfoShareRequest import AlipayUserInfoShareRequest


class AlipayClient:
    def __init__(self):
        # 1) 先组装配置对象
        config = AlipayClientConfig()
        config.server_url         = Alipay.GATEWAY
        config.app_id             = Alipay.APP_ID
        config.app_private_key    = Alipay.APP_PRIVATE_KEY
        config.alipay_public_key  = Alipay.ALIPAY_PUBLIC_KEY
        # 2) 只把 config 放进客户端
        self.client = DefaultAlipayClient(alipay_client_config=config)

    def generate_payment_url(self, out_trade_no, total_amount, subject):
        model = AlipayTradePagePayModel()
        model.out_trade_no = out_trade_no
        model.total_amount = f"{float(total_amount):.2f}"
        model.subject = subject
        model.product_code = "FAST_INSTANT_TRADE_PAY"

        request = AlipayTradePagePayRequest()
        request.biz_model = model
        request.notify_url = Alipay.NOTIFY_URL
        request.return_url = Alipay.RETURN_URL

        # 电脑网站支付（GET 跳转收银台）
        return self.client.page_execute(request, http_method="GET")

    def verify(self, data: dict, signature: str) -> bool:
        """支付宝异步/同步回传验签"""
        return self.client.verify(data, signature)

    def get_auth_token(self, auth_code: str) -> dict:
        """根据 auth_code 换取 access_token"""
        request = AlipaySystemOauthTokenRequest()
        request.grant_type = "authorization_code"
        request.code = auth_code

        response = self.client.execute(request)
        return response.to_dict()

    def get_user_info(self, access_token: str) -> dict:
        """根据 access_token 获取用户信息"""
        request = AlipayUserInfoShareRequest()
        response = self.client.execute(request, auth_token=access_token)
        return response.to_dict()

