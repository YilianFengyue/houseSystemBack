from celery import Celery
from config import Config

celery = Celery(__name__, broker=Config.CELERY_BROKER_URL, backend=Config.CELERY_RESULT_BACKEND)

# 重要，windows下需要设置成单solo
celery.conf.update(
    CELERYD_POOL = 'solo',
    CELERYD_CONCURRENCY = 1
)

# 配置 Celery 与 Flask 应用集成
def make_celery(app):
    celery1 = celery
    celery1.conf.update(app.config)

    class ContextTask(celery1.Task):
        def __call__(self, *args, **kwargs):
            with app.app_context():
                return self.run(*args, **kwargs)

    celery1.Task = ContextTask
    return celery1

# 使用方法
# 打开终端1 输入redis-server
# 打开终端2 输入celery -A app.celery worker --loglevel=info --pool=solo
# 运行app