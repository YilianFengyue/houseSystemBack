from models.house_model import HouseInfo
from exts.db import db

def get_housenum():
    return db.session.query(HouseInfo).count()

def get_house_hot_list():
    return db.session.query(HouseInfo).order_by(HouseInfo.page_views.desc()).limit(4).all()

def get_house_new_list():
    return db.session.query(HouseInfo).order_by(HouseInfo.publish_time.desc()).limit(6).all()

def get_house_by_id(house_id):
    return db.session.query(HouseInfo).filter(HouseInfo.id == house_id).one()

def get_house_by_views():
    return db.session.query(HouseInfo).order_by(HouseInfo.page_views.desc()).first()

def add_views_by_id(data):
    # 查询指定ID的房源信息
    house_id = data.get('houseid')
    house = db.session.query(HouseInfo).filter(HouseInfo.id == house_id).first()

    if house:
        # 增加浏览量
        house.page_views = (house.page_views or 0) + 1

        try:
            # 提交更改到数据库
            db.session.commit()
            return True
        except Exception as e:
            # 发生错误时回滚
            db.session.rollback()
            return False
    else:
        return False
