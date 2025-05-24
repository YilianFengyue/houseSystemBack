# config.py

class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost:3306/flaskhousesystem'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    #生成随机的密钥会更好
    SECRET_KEY = 'random_key'
    JSON_AS_ASCII = False
    STRICT_SLASH = False  # 禁止路由自动重定向