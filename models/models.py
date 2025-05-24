from typing import Optional
from sqlalchemy import Date, DateTime, Float, Integer, String, text
from sqlalchemy.dialects.mysql import INTEGER, TINYINT, VARCHAR, TEXT
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from datetime import datetime
# 引入 bcrypt
from flask_bcrypt import generate_password_hash, check_password_hash

class Base(DeclarativeBase):
    pass

class Comment(Base):
    __tablename__ = 'comment'

    comment_id: Mapped[int] = mapped_column(Integer, primary_key=True)
    house_id: Mapped[int] = mapped_column(Integer, comment='房屋的id')
    username: Mapped[str] = mapped_column(VARCHAR(255), comment='留言人名字')
    type: Mapped[int] = mapped_column(Integer, comment='留言人类型,1:租客，2:房东')
    desc: Mapped[str] = mapped_column(VARCHAR(255), comment='留言内容')
    time: Mapped[datetime] = mapped_column(DateTime, comment='留言时间')
    at: Mapped[Optional[int]] = mapped_column(Integer, comment='@哪条留言，前端显示为@谁，选填')

class UserInfo(Base):
    __tablename__ = 'user_info'

    id: Mapped[int] = mapped_column(INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='用户名')
    password: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='密码')
    email: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='邮箱')
    phone: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='电话')
    addr: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='地址')
    seen_id: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='已浏览ID')
    collect_id: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='收藏ID')
    identityCard: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='身份证号')
    userType: Mapped[Optional[int]] = mapped_column(INTEGER, nullable=True, comment='用户类型')
    avatarUrl: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='用户头像')

    # 新增：设置密码的方法，自动进行哈希加密
    def set_password(self, password_text):
        self.password = generate_password_hash(password_text).decode('utf-8')

    # 新增：校验密码的方法
    def check_password(self, password_text):
        return check_password_hash(self.password, password_text)

        # 修改 to_dict，移除密码字段，防止泄露

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email,
            "phone": self.phone,
            "addr": self.addr,
            "seen_id": self.seen_id,
            "collect_id": self.collect_id,
            "identityCard": self.identityCard,
            "userType": self.userType,
            "avatarUrl": self.avatarUrl,
        }

class Appointment(Base):
    __tablename__ = 'appointment'

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True, comment='预约id')
    username: Mapped[Optional[str]] = mapped_column(String(255))
    property: Mapped[Optional[str]] = mapped_column(String(255))
    time: Mapped[datetime] = mapped_column(DateTime, comment='预约时间')

    def to_dict(self):
        return {
            "id": self.id,
            "username": self.username,
            "property": self.property,
            "time": self.time.strftime("%Y-%m-%d %H:%M:%S") if self.time else None
        }

class Contract(Base):
    __tablename__ = 'contract'

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    rentValue: Mapped[str] = mapped_column(String(255))
    purpose: Mapped[str] = mapped_column(String(255))
    startDate: Mapped[str] = mapped_column(DateTime)
    endDate: Mapped[str] = mapped_column(DateTime)
    landlordName: Mapped[str] = mapped_column(String(255))
    landlordId: Mapped[str] = mapped_column(String(255))
    landlordPhone: Mapped[str] = mapped_column(String(255))
    tenantName: Mapped[str] = mapped_column(String(255))
    tenantId: Mapped[str] = mapped_column(String(255))
    tenantPhone: Mapped[str] = mapped_column(String(255))
    formattedRent: Mapped[str] = mapped_column(String(255))
    currentDate: Mapped[str] = mapped_column(DateTime)

    def to_dict(self):
        return {
            "id": self.id,
            "rentValue": self.rentValue,
            "purpose": self.purpose,
            "startDate": self.startDate.strftime("%Y-%m-%d") if self.startDate else None,
            "endDate": self.endDate.strftime("%Y-%m-%d") if self.endDate else None,
            "landlordName": self.landlordName,
            "landlordId": self.landlordId,
            "landlordPhone": self.landlordPhone,
            "tenantName": self.tenantName,
            "tenantId": self.tenantId,
            "tenantPhone": self.tenantPhone,
            "formattedRent": self.formattedRent,
            "currentDate": self.currentDate.strftime("%Y-%m-%d") if self.currentDate else None
        }

class Repair_Complaint(Base):
    __tablename__ = 'repair_complaint'

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    report_reason: Mapped[Optional[str]] = mapped_column(String(255))
    house_address: Mapped[Optional[str]] = mapped_column(String(255))
    repair_type: Mapped[Optional[str]] = mapped_column(String(255))
    repair_description: Mapped[Optional[str]] = mapped_column(String(255))
    complaint_content: Mapped[Optional[str]] = mapped_column(String(255))
    complaint_person: Mapped[Optional[str]] = mapped_column(String(255))
    agreed_terms: Mapped[int] = mapped_column(Integer)
    create_at: Mapped[datetime] = mapped_column(DateTime)

    def to_dict(self):
        """Convert the model instance to a dictionary."""
        return {
            "id": self.id,
            "report_reason": self.report_reason,
            "house_address": self.house_address,
            "repair_type": self.repair_type,
            "repair_description": self.repair_description,
            "complaint_content": self.complaint_content,
            "complaint_person": self.complaint_person,
            "agreed_terms": self.agreed_terms,
            "create_at": self.create_at.isoformat() if self.create_at else None
        }

class Message(Base):
    __tablename__ = 'message'

    message_id: Mapped[int] = mapped_column(Integer, primary_key=True)
    content: Mapped[str] = mapped_column(String(500), comment='消息内容')
    sender_username: Mapped[str] = mapped_column(String(50), comment='发送者用户名')
    receiver_username: Mapped[str] = mapped_column(String(50), comment='接收者用户名')
    timestamp: Mapped[datetime] = mapped_column(DateTime, default=datetime.now(), comment='消息时间戳')
    channel_id: Mapped[int] = mapped_column(Integer)

    def to_dict(self):
        return {
            "message_id": self.message_id,
            "content": self.content,
            "sender_username": self.sender_username,
            "receiver_username": self.receiver_username,
            "timestamp": self.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
            "channel_id": self.channel_id
        }

class Channel(Base):
    __tablename__ = 'channel'

    channel_id: Mapped[int] = mapped_column(Integer, primary_key=True)
    tenant_username: Mapped[str] = mapped_column(String(50), comment='租客用户名')
    landlord_username: Mapped[str] = mapped_column(String(50), comment='房东用户名')
    timestamp: Mapped[datetime] = mapped_column(DateTime)

    def to_dict(self):
        return {
            "channel_id": self.channel_id,
            "tenant_username": self.tenant_username,
            "landlord_username": self.landlord_username,
            "timestamp": self.timestamp.strftime("%Y-%m-%d %H:%M:%S")
        }

class News(Base):
    __tablename__ = 'news'

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    title: Mapped[str] = mapped_column(String(255), nullable=False)
    content: Mapped[text] = mapped_column(TEXT, nullable=False)
    publish_time: Mapped[datetime] = mapped_column(DateTime)

    def to_dict(self):
        return {
            "id": self.id,
            "title": self.title,
            "content": self.content,
            "publish_time": self.publish_time.isoformat() if self.publish_time else None,
        }
