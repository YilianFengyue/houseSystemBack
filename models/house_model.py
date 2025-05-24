# 假设这个文件是 app/models.py 或您存放模型的地方

from typing import Optional
from sqlalchemy import Date, Float, Integer as SQLAlchemyInteger, text # 重命名 Integer 以避免与 sqlalchemy.dialects.mysql.INTEGER 冲突（如果同时导入）
from sqlalchemy.dialects.mysql import INTEGER as MYSQL_INTEGER, TINYINT, VARCHAR # 使用别名以明确
from sqlalchemy.orm import Mapped, mapped_column, relationship
import datetime

from exts import db
from models.house_detail_model import HouseDetail


class HouseInfo(db.Model): # <--- 修改这里，继承自 db.Model
    __tablename__ = 'house_info'

    # 注意：在使用 Flask-SQLAlchemy 时，通常 INTEGER, Float 等类型会直接从 sqlalchemy 导入
    # sqlalchemy.dialects.mysql.INTEGER 也可以用于主键，如果需要 MySQL 特定的 INTEGER 属性
    # 这里我保留了您原始模型中的类型选择，但做了些许澄清

    id: Mapped[int] = mapped_column(MYSQL_INTEGER, primary_key=True, autoincrement=True) # autoincrement=True 是 Integer 主键的默认行为
    title: Mapped[Optional[str]] = mapped_column(VARCHAR(100), comment='标题，如：整租·锦源小区 2室1厅 南')
    region: Mapped[Optional[str]] = mapped_column(VARCHAR(50), comment='区，如：雨花')
    block: Mapped[Optional[str]] = mapped_column(VARCHAR(50), comment='街道，如：树木岭')
    community: Mapped[Optional[str]] = mapped_column(VARCHAR(100), comment='小区，如：锦源小区')
    area: Mapped[Optional[float]] = mapped_column(Float, comment='面积，单位㎡') # sqlalchemy.Float
    direction: Mapped[Optional[str]] = mapped_column(VARCHAR(20), comment='朝向，如：南')
    rooms: Mapped[Optional[str]] = mapped_column(VARCHAR(20), comment='几室几厅，如：2室1厅1卫')
    price: Mapped[Optional[int]] = mapped_column(SQLAlchemyInteger, comment='价格，单位：元/月') # sqlalchemy.Integer
    rent_type: Mapped[Optional[str]] = mapped_column(VARCHAR(20), comment='租赁方式，如：整租、合租')
    decoration: Mapped[Optional[str]] = mapped_column(VARCHAR(20), comment='装修情况，如：精装')
    subway: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'0'"), comment='是否近地铁')
    available: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'1'"), comment='是否随时看房')
    tag_new: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'0'"), comment='是否新上')
    image_url: Mapped[Optional[str]] = mapped_column(VARCHAR(255), comment='房源图片URL') # 之前模型中是 '房源图片'
    publish_time: Mapped[Optional[datetime.date]] = mapped_column(Date, comment='发布时间') # 之前模型中是 '发布时间，如：2天前'
    page_views: Mapped[Optional[str]] = mapped_column(VARCHAR(255), comment='浏览量') # 考虑是否应该是 Integer 类型
    landlord: Mapped[Optional[str]] = mapped_column(VARCHAR(255), comment='房东')
    phone_num: Mapped[Optional[str]] = mapped_column(VARCHAR(100), comment='房东电话')
    house_num: Mapped[Optional[int]] = mapped_column(SQLAlchemyInteger, comment='房源编号') # sqlalchemy.Integer

    # Add this relationship for one-to-one with HouseDetail
    # 'house_info_obj' should match back_populates in HouseDetail.house_info_obj
    detail_obj: Mapped[Optional["HouseDetail"]] = relationship(
        back_populates="house_info_obj",
        uselist=False,  # Important for one-to-one
        cascade="all, delete-orphan"  # If HouseInfo is deleted, its HouseDetail is also deleted
    )

    def to_dict(self):
        # 这个辅助方法保持不变，用于将模型对象转换为字典
        data = {}
        for column in self.__table__.columns:
            value = getattr(self, column.name)
            if isinstance(value, datetime.date):
                data[column.name] = value.isoformat()
            else:
                data[column.name] = value
        return data