from flask import Flask
from config import Config
from exts.db import db
from exts.cors import cors
from models.models import HouseInfo # <--- 正确的模型导入路径
from blueprints.user import user_bp
from blueprints.comment import comment_bp
from blueprints.contract import contract_bp
from blueprints.appointment import appointment_bp
from blueprints.houseinfo import house_info_bp
from blueprints.repair_complaint import repair_bp
from blueprints.message import message_bp
from blueprints.news import news_bp
from socketio_init import socketio  # 修改导入语句

#初始化app
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)
cors.init_app(app)

app.register_blueprint(house_info_bp)
app.register_blueprint(user_bp)
app.register_blueprint(comment_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(contract_bp)
app.register_blueprint(repair_bp)
app.register_blueprint(message_bp)
app.register_blueprint(news_bp)

# 初始化socketio
socketio.init_app(app)
@app.route('/')
def index():
    first_info = HouseInfo.query.first()
    print(first_info)
    return "OK~"

if __name__ == "__main__":
    # app.run(debug=True)
    socketio.run(app, debug=True, allow_unsafe_werkzeug=True)