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
from socketio_init import socketio  # 修改导入语句

#初始化app
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)
cors.init_app(app, supports_credentials=True)

app.register_blueprint(house_info_bp)
app.register_blueprint(user)
app.register_blueprint(comment_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(contract_bp)
app.register_blueprint(repair_bp)
app.register_blueprint(message_bp)
app.register_blueprint(news_bp)
app.register_blueprint(housedetail_bp)

# 初始化socketio
socketio.init_app(app)
@app.route('/')
def index():
    try:
        # 确保在应用上下文中执行数据库查询
        with app.app_context():
            first_info = db.session.query(HouseInfo).first()  # 或者 HouseInfo.query.first() 如果你习惯旧版
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
