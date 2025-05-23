
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
    first_info = HouseInfo.query.first()
    if first_info:
        print("yes")
    return "OK~"
if __name__ == "__main__":
    app.run(debug=True)
