import os
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend
import textwrap

def to_pem(raw_key, header, footer):
    body = "\n".join(textwrap.wrap(raw_key, 64))
    return f"{header}\n{body}\n{footer}"

# 获取当前脚本文件的绝对路径\ n# (根据项目结构调整)
base_dir = os.path.dirname(os.path.abspath(__file__))

# 私钥和公钥路径
private_key_path = os.path.join(base_dir, 'app_private_key.txt')
public_key_path = os.path.join(base_dir, 'alipay_public_key.txt')

# with open(private_key_path, 'r', encoding='utf-8') as f:
#     APP_PRIVATE_KEY1 = f.read()

with open(public_key_path, 'r', encoding="UTF-8") as f:
    ALIPAY_PUBLIC_KEY1 = f.read().strip()

with open(private_key_path, 'rb') as f:
    key_data = f.read().strip()

private_key = serialization.load_pem_private_key(key_data, password=None, backend=default_backend())

# 导出为 PKCS#1 格式
APP_PRIVATE_KEY1 = private_key.private_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PrivateFormat.TraditionalOpenSSL,  # PKCS#1
    encryption_algorithm=serialization.NoEncryption()
)
APP_PRIVATE_KEY1 = APP_PRIVATE_KEY1.decode("utf-8")

class Alipay:
    APP_ID = '2021000148684222'
    ALIPAY_PUBLIC_KEY = ALIPAY_PUBLIC_KEY1
    APP_PRIVATE_KEY = APP_PRIVATE_KEY1
    GATEWAY = 'https://openapi-sandbox.dl.alipaydev.com/gateway.do'
    RETURN_URL = 'http://localhost:4173/alipay/payment-result'  # 前端地址
    NOTIFY_URL = 'http://localhost:5000/api/alipay/notify'  # Flask回调接口
    CALLBACK_URL = 'http://localhost:5000/api/alipay/oauth_callback'

# print(APP_PRIVATE_KEY1+"\n"+ALIPAY_PUBLIC_KEY1)