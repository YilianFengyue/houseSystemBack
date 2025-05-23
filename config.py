# config.py
class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:ssy123@localhost:3306/house'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    #生成随机的密钥会更好
    JWT_SECRET_KEY = 'random_key'
    SECRET_KEY = 'random_key'  # For Flask session
    JSON_AS_ASCII = False
    # Email configuration
    MAIL_SERVER = 'smtp.qq.com'  # QQ邮箱SMTP服务器
    MAIL_PORT = 587              # TLS加密端口
    MAIL_USE_TLS = True           # 必须启用TLS
    MAIL_USERNAME = '3033861161@qq.com'  # 完整的QQ邮箱
    MAIL_PASSWORD = 'nzegqwgtwlczdhbj'          # 需替换为QQ邮箱生成的授权码
    MAIL_DEFAULT_SENDER = '3033861161@qq.com'  # 默认发件人
