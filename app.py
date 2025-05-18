from flask import Flask
from config import Config
from extensions import db, cors
from blueprints.user import user_bp
from services.Repaire.RepaireSubmitted import repairesubmit_bp


def create_app():
    app = Flask(__name__)
    # 加载配置
    app.config.from_object(Config)

    # 初始化插件
    db.init_app(app)

    # 修改CORS配置
    cors.init_app(
        app,
        resources={
            r"/api/*": {
                "origins": ["http://localhost:4173", "http://127.0.0.1:4173"],
                "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
                "allow_headers": ["Content-Type"]
            }
        },
        supports_credentials=True
    )

    # 注册蓝图
    app.register_blueprint(user_bp, url_prefix="/api/user")
    app.register_blueprint(repairesubmit_bp, url_prefix="/api/repair")

    return app