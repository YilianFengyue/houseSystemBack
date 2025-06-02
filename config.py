# config.py
import os
class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost:3306/flaskhousesystem'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    #生成随机的密钥会更好
    SECRET_KEY = 'random_key'
    JSON_AS_ASCII = False
    STRICT_SLASH = False  # 禁止路由自动重定向

    # redis配置
    # REDIS_URL = 'redis://:luyue@localhost:6379/0'
    REDIS_URL = 'redis://@localhost:6379/0'  # 设置密码有误，重启后失效

    # Celery 配置,使用不同数据库
    CELERY_BROKER_URL = 'redis://@localhost:6379/1'
    CELERY_RESULT_BACKEND = 'redis://@localhost:6379/1'
    CELERY_ACCEPT_CONTENT = ['application/json']
    CELERY_TASK_SERIALIZER = 'json'
    CELERY_RESULT_SERIALIZER = 'json'
    CELERY_TIMEZONE = 'Asia/Shanghai'
    CELERY_WORKER_AUTOSCALE = (5,1)

    # GitHub OAuth 配置
    os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
    GITHUB_CLIENT_ID = 'Ov23liAecgp8eQEFj3xG'
    GITHUB_CLIENT_SECRET = '8f4267ce6a9e38442d5ef5e1e7658021e0528145'
    GITHUB_AUTHORIZE_URL = 'https://github.com/login/oauth/authorize'
    GITHUB_ACCESS_TOKEN_URL = 'https://github.com/login/oauth/access_token'
    GITHUB_API_BASE_URL = 'https://api.github.com/'
    GITHUB_CALLBACK_URL = 'http://127.0.0.1:5000/github/callback'