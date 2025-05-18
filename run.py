
from flask import Flask


from config import Config
from exts.db import db
from blueprints.houseinfo import house_info_bp
from models.house_model import HouseInfo # <--- 正确的模型导入路径

#初始化app
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

app.register_blueprint(house_info_bp)
@app.route('/')
def index():
    first_info = HouseInfo.query.first()
    print(first_info)
    return "OK~"
if __name__ == "__main__":
    app.run(debug=True)
