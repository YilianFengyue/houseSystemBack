
from flask import Flask

from config import Config
from exts import db, mail
from blueprints.houseinfo import house_info_bp
from blueprints.user import user_bp
from models.house_model import HouseInfo # <--- 正确的模型导入路径

# from blueprints.oss import oss_bp
#初始化app
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)
mail.init_app(app)

app.register_blueprint(house_info_bp)
app.register_blueprint(user_bp)
# app.register_blueprint(oss_bp)

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
    app.run(debug=True)
