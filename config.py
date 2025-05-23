# config.py
import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:ssy123@localhost:3306/house'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    #生成随机的密钥会更好
    JWT_SECRET_KEY = 'random_key'
    SECRET_KEY = 'random_key'  # For Flask session
    JSON_AS_ASCII = False

    # 阿里云 OSS 配置

    OSS_BUCKET_NAME = os.environ.get('OSS_BUCKET_NAME') or "flaskhousesystem"
    # OSS_ENDPOINT 通常是 Bucket 所在地域的访问域名，例如：oss-cn-hangzhou.aliyuncs.com
    # 请参考OSS文档获取正确的Endpoint：https://help.aliyun.com/document_detail/31837.html
    OSS_ENDPOINT = os.environ.get('OSS_ENDPOINT') or "oss-cn-hangzhou.aliyuncs.com"
    # 新增：OSS_REGION，必须与您的Bucket实际区域对应
    OSS_REGION = "cn-hangzhou"  # <--- 例如，如果您的Bucket在杭州，则填写 "cn-hangzhou"
    # (可选) 如果您想为上传的文件指定一个自定义域名（需在OSS控制台配置CNAME）
    OSS_CNAME_URL = os.environ.get('OSS_CNAME_URL') or None  # 例如: "https://img.yourdomain.com"

    # 允许上传的文件扩展名
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}