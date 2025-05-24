from models.house_detail_model import HouseDetail
from exts.db import db

def get_house_detail_by_house_info_id(house_info_id):
    return db.session.query(HouseDetail).filter_by(house_info_id=house_info_id).first()