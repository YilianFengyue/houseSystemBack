from flask import Flask
from config import Config
from exts.db import db
from exts.cors import cors
from models.house_model import HouseInfo # <--- 正确的模型导入路径
from blueprints.user import user
from blueprints.comment import comment_bp
from blueprints.contract import contract_bp
from blueprints.appointment import appointment_bp
from blueprints.houseinfo import house_info_bp
from blueprints.repair_complaint import repair_bp
from blueprints.message import message_bp
from blueprints.news import news_bp
from blueprints.housedetail import housedetail_bp
from blueprints.log_management import log_bp
from blueprints.rental import rental_bp
from blueprints.celery_bp import celery_bp
from blueprints.sms import sms_bp  # 添加短信蓝图导入
from blueprints.alipay import alipay_bp  # 重新添加支付宝蓝图导入
from blueprints.chat_ai import chat_ai_bp  # 添加聊天AI蓝图导入
from blueprints.github import github_bp
from blueprints.email_auth import email_auth_bp  # 添加邮箱验证码蓝图导入
from socketio_init import socketio  # 修改导入语句
from exts.redis import redis_store
from exts.celery import make_celery

#日志处理
import logging
from exts.log_handlers import DatabaseLogHandler # 导入你的 handler
from models.log_model import LogEntry # 确保模型被创建

def setup_logging(app_instance): # app_instance 就是你的 Flask app 对象
    # 将 app 实例传递给 Handler
    db_log_handler = DatabaseLogHandler(app_instance=app_instance)
    db_log_handler.setLevel(logging.INFO)

    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(module)s.%(funcName)s:%(lineno)d - %(message)s'
    )
    db_log_handler.setFormatter(formatter)

    root_logger = logging.getLogger()

    root_logger.addHandler(db_log_handler)
    root_logger.setLevel(logging.INFO)

#初始化app
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)
cors.init_app(app, supports_credentials=True)
# 初始化 Redis 实例
redis_store.init_app(app)

setup_logging(app) # 调用日志配置函数
app.register_blueprint(house_info_bp)
app.register_blueprint(user)
app.register_blueprint(comment_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(contract_bp)
app.register_blueprint(repair_bp)
app.register_blueprint(message_bp)
app.register_blueprint(news_bp)
app.register_blueprint(housedetail_bp)
#日志
app.register_blueprint(log_bp)
app.register_blueprint(rental_bp)
app.register_blueprint(celery_bp)
app.register_blueprint(sms_bp)  # 添加短信蓝图注册
app.register_blueprint(alipay_bp)  # 重新添加支付宝蓝图注册
app.register_blueprint(chat_ai_bp)  # 添加聊天AI蓝图注册
app.register_blueprint(github_bp)
app.register_blueprint(email_auth_bp)  # 添加邮箱验证码蓝图注册

# 初始化socketio
socketio.init_app(app)
# 初始化celery
celery = make_celery(app)

@app.route('/')
def index():
    try:
        # 确保在应用上下文中执行数据库查询
        app.logger.info("--- 这是一条来自 INDEX 路由的测试日志 ---")  # 添加这行
        with app.app_context():
            first_info = db.session.query(HouseInfo).first()

        if first_info:
            print("数据库连接成功，并能查询到HouseInfo数据。")
        else:
            print("数据库连接成功，但HouseInfo表中无数据。")
    except Exception as e:
        print(f"数据库连接或查询失败: {e}")
    return "OK~ Backend is running."

if __name__ == "__main__":
    # app.run(debug=True)
    socketio.run(app, debug=True, allow_unsafe_werkzeug=True)
