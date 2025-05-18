from flask import Flask
from config import Config
from extensions import db, cors
from blueprints.user import user_bp
from blueprints.comment import comment_bp
from blueprints.appointment import appointment_bp
from blueprints.contract import contract_bp

def create_app():
    app = Flask(__name__)
    # 加载配置
    app.config.from_object(Config)

    # 初始化插件
    db.init_app(app)
    cors.init_app(app)
    # 注册蓝图
    app.register_blueprint(user_bp, url_prefix="/api/user")
    app.register_blueprint(comment_bp, url_prefix="/api/comment")
    app.register_blueprint(appointment_bp, url_prefix="/api/appointment")
    app.register_blueprint(contract_bp, url_prefix="/api/contract")

    return app