from flask import Flask
from config import Config
from extensions import db
from blueprints.user import user_bp


def create_app():
    app = Flask(__name__)
    # 加载配置
    app.config.from_object(Config)

    # 初始化插件
    db.init_app(app)
    # 注册蓝图
    app.register_blueprint(user_bp, url_prefix="/api/user")
 
    return app
