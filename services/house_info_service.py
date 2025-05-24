from models.house_model import HouseInfo
from exts.db import db

def get_housenum():
    return db.session.query(HouseInfo).count()

def get_house_hot_list():
    return db.session.query(HouseInfo).order_by(HouseInfo.page_views.desc()).limit(4).all()

def get_house_new_list():
    return db.session.query(HouseInfo).order_by(HouseInfo.publish_time.desc()).limit(6).all()