from typing import Optional
from sqlalchemy import Column, Date, DateTime, Float, Integer, String, Text, Boolean, text
from sqlalchemy.dialects.mysql import INTEGER, TINYINT, VARCHAR
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
import datetime

class Base(DeclarativeBase):
    pass


class Comment(Base):
    __tablename__ = 'comment'

    comment_id: Mapped[int] = mapped_column(Integer, primary_key=True)
    house_id: Mapped[int] = mapped_column(Integer, comment='房屋的id')
    username: Mapped[str] = mapped_column(VARCHAR(255), comment='留言人名字')
    type: Mapped[int] = mapped_column(Integer, comment='留言人类型,1:租客，2:房东')
    desc: Mapped[str] = mapped_column(VARCHAR(255), comment='留言内容')
    time: Mapped[datetime.datetime] = mapped_column(DateTime, comment='留言时间')
    at: Mapped[Optional[int]] = mapped_column(Integer, comment='@哪条留言，前端显示为@谁，选填')


class HouseInfo(Base):
    __tablename__ = 'house_info'

    id: Mapped[int] = mapped_column(INTEGER, primary_key=True)
    title: Mapped[Optional[str]] = mapped_column(String(100), comment='标题，如：整租·锦源小区 2室1厅 南')
    region: Mapped[Optional[str]] = mapped_column(String(50), comment='区，如：雨花')
    block: Mapped[Optional[str]] = mapped_column(String(50), comment='街道，如：树木岭')
    community: Mapped[Optional[str]] = mapped_column(String(100), comment='小区，如：锦源小区')
    area: Mapped[Optional[float]] = mapped_column(Float, comment='面积，单位㎡')
    direction: Mapped[Optional[str]] = mapped_column(String(20), comment='朝向，如：南')
    rooms: Mapped[Optional[str]] = mapped_column(String(20), comment='几室几厅，如：2室1厅1卫')
    price: Mapped[Optional[int]] = mapped_column(Integer, comment='价格，单位：元/月')
    rent_type: Mapped[Optional[str]] = mapped_column(String(20), comment='租赁方式，如：整租、合租')
    decoration: Mapped[Optional[str]] = mapped_column(String(20), comment='装修情况，如：精装')
    subway: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'0'"), comment='是否近地铁')
    available: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'1'"), comment='是否随时看房')
    tag_new: Mapped[Optional[int]] = mapped_column(TINYINT(1), server_default=text("'0'"), comment='是否新上')
    image_url: Mapped[Optional[str]] = mapped_column(String(255), comment='房源图片')
    publish_time: Mapped[Optional[datetime.date]] = mapped_column(Date, comment='发布时间，如：2天前')
    page_views: Mapped[Optional[str]] = mapped_column(String(255), comment='浏览量')
    landlord: Mapped[Optional[str]] = mapped_column(String(255), comment='房东')
    phone_num: Mapped[Optional[str]] = mapped_column(String(100), comment='房东电话')
    house_num: Mapped[Optional[int]] = mapped_column(Integer, comment='房源编号')


class UserInfo(Base):
    __tablename__ = 'user_info'

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[Optional[str]] = mapped_column(String(255))
    password: Mapped[Optional[str]] = mapped_column(String(255))
    email: Mapped[Optional[str]] = mapped_column(String(255))
    phone: Mapped[Optional[str]] = mapped_column(String(255))
    addr: Mapped[Optional[str]] = mapped_column(String(255))
    seen_id: Mapped[Optional[str]] = mapped_column(String(255))
    collect_id: Mapped[Optional[str]] = mapped_column(String(255))
    identityCard: Mapped[Optional[str]] = mapped_column(String(255))


class RepairComplaint(Base):
    __tablename__ = 'repair_complaint'

    id: Mapped[int] = mapped_column(primary_key=True)
    report_reason: Mapped[str] = mapped_column(String(255), comment='申报类型：repair(维修)或complaint(投诉)')
    house_address: Mapped[Optional[str]] = mapped_column(String(255), comment='房屋地址')
    repair_type: Mapped[Optional[str]] = mapped_column(String(255), comment='维修类型')
    repair_description: Mapped[Optional[str]] = mapped_column(String(255), comment='维修描述')
    complaint_content: Mapped[Optional[str]] = mapped_column(String(255), comment='投诉内容')
    complaint_person: Mapped[Optional[str]] = mapped_column(String(255), comment='投诉对象')
    agreed_terms: Mapped[bool] = mapped_column(String(255), comment='是否同意条款')
    created_at: Mapped[datetime.datetime] = mapped_column(DateTime, server_default=text('CURRENT_TIMESTAMP'), comment='创建时间')