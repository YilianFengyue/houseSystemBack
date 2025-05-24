from typing import Optional, List, Dict as PyDict
import datetime
from sqlalchemy import ForeignKey, func, JSON as SQLAlchemy_JSON, TIMESTAMP
from sqlalchemy.dialects.mysql import INTEGER as MYSQL_INTEGER
from sqlalchemy.orm import Mapped, mapped_column, relationship
from exts import db

# 延迟导入 HouseInfo
# 注意：这里假设 HouseInfo 在 models.house_info_model 模块中定义
# 请根据你的项目结构调整导入路径
# 不要在文件顶部直接导入 HouseInfo

class HouseDetail(db.Model):
    __tablename__ = 'house_detail'

    detail_id: Mapped[int] = mapped_column(db.Integer, primary_key=True, autoincrement=True, comment='详情表主键ID')
    house_info_id: Mapped[int] = mapped_column(
        MYSQL_INTEGER(unsigned=True),
        ForeignKey('house_info.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False,
        unique=True,
        comment='关联的 house_info 表主键ID'
    )

    photos: Mapped[Optional[List[str]]] = mapped_column(SQLAlchemy_JSON, nullable=True, comment='房源详情图片URL列表 (JSON格式)')
    facilities: Mapped[Optional[PyDict]] = mapped_column(SQLAlchemy_JSON, nullable=True, comment='配套设施 (JSON格式)')
    map_coordinates: Mapped[Optional[PyDict]] = mapped_column(SQLAlchemy_JSON, nullable=True, comment='地图坐标 (JSON格式)')

    created_at: Mapped[datetime.datetime] = mapped_column(TIMESTAMP, server_default=func.now(), comment='创建时间')
    updated_at: Mapped[datetime.datetime] = mapped_column(TIMESTAMP, server_default=func.now(), onupdate=func.now(), comment='更新时间')

    # 使用字符串引用 'HouseInfo'，避免直接引用类
    house_info_obj: Mapped["HouseInfo"] = relationship("HouseInfo", back_populates="detail_obj")

    def to_dict(self):
        return {
            "detail_id": self.detail_id,
            "house_info_id": self.house_info_id,
            "photos": self.photos,
            "facilities": self.facilities,
            "map_coordinates": self.map_coordinates,
            "created_at": self.created_at.isoformat() if self.created_at else None,
            "updated_at": self.updated_at.isoformat() if self.updated_at else None,
        }
