# config.py

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