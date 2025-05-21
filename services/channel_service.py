from models.models import Channel
from exts.db import db
from sqlalchemy import or_, and_, select, insert, exists
from datetime import datetime
import logging

logger = logging.getLogger(__name__)


def get_channel(user1, user2):
    """获取或创建channel（不使用query.filter）"""
    try:
        # 使用SQLAlchemy核心表达式构建查询
        stmt = select(Channel).where(
            or_(
                and_(Channel.tenant_username == user1, Channel.landlord_username == user2),
                and_(Channel.tenant_username == user2, Channel.landlord_username == user1)
            )
        )

        # 执行查询获取结果
        result = db.session.execute(stmt).scalars().first()

        if result:
            return result

        # 未找到，创建新的channel
        new_channel = Channel(
            tenant_username=user1,
            landlord_username=user2,
            timestamp=datetime.now()
        )

        db.session.add(new_channel)
        db.session.commit()

        # 提交后再次查询以获取完整的对象（某些数据库需要这样做）
        return db.session.execute(stmt).scalars().first()

    except Exception as e:
        logger.error(f"获取或创建channel失败: {str(e)}")
        db.session.rollback()
        raise