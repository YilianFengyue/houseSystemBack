from typing import Optional

from sqlalchemy import Column, Date, DateTime, Float, Integer, String, Table, text
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
    status: Mapped[int] = mapped_column(TINYINT, default=1, comment='0:admin, 1:tenant, 2:landlord')
