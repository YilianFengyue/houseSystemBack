from models.models import Message
from exts.db import db
from datetime import datetime
from sqlalchemy import or_, and_
import logging

logger = logging.getLogger(__name__)

def get_messages_by_sender(sender_username):
    """根据发送者用户名获取消息"""
    try:
        return db.session.query(Message).filter_by(sender_username=sender_username)\
                          .order_by(Message.timestamp.asc())\
                          .all()
    except Exception as e:
        logger.error(f"获取{sender_username}的消息失败: {str(e)}")
        raise

def get_messages_between_users(user1, user2):
    """获取两个用户之间的所有消息"""
    try:
        return db.session.query(Message).filter(
            or_(
                and_(Message.sender_username == user1, 
                     Message.receiver_username == user2),
                and_(Message.sender_username == user2, 
                     Message.receiver_username == user1)
            )
        ).order_by(Message.timestamp.asc()).all()
    except Exception as e:
        logger.error(f"获取{user1}和{user2}之间的消息失败: {str(e)}")
        raise

def create_message(content, sender_username, receiver_username):
    """创建新消息"""
    try:
        message = Message(
            content=content,
            sender_username=sender_username,
            receiver_username=receiver_username
        )
        db.session.add(message)
        db.session.commit()
        return message
    except Exception as e:
        db.session.rollback()
        logger.error(f"创建消息失败: {str(e)}")
        raise