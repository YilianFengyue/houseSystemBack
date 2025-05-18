# config.py
class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:ssy123@localhost:3306/house'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    #生成随机的密钥会更好
    JWT_SECRET_KEY = 'random_key'
    JSON_AS_ASCII = False
