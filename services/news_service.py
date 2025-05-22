from models.models import News
from exts.db import db
from sqlalchemy.exc import SQLAlchemyError
from datetime import datetime
import logging

logger = logging.getLogger(__name__)

def get_all_news(page=1, per_page=10):
    """获取所有新闻，默认按发布时间降序，支持分页"""
    try:
        query = db.session.query(News).order_by(News.publish_time.desc(), News.id.desc())
        total_count = query.count()
        paginated_news = query.paginate(page=page, per_page=per_page, error_out=False)

        news_list = [news.to_dict() for news in paginated_news.items]

        response_data = {
            "items": news_list,
            "total": total_count,
            "page": page,
            "per_page": per_page,
            "pages": paginated_news.pages,
        }
        return response_data
    except SQLAlchemyError as e:
        logger.error(f"查询新闻失败: {e}")
        raise
    except Exception as e:
        logger.error(f"查询新闻时发生未知错误: {e}")
        raise

def get_news_by_id(news_id):
    """根据ID获取单条新闻详情"""
    try:
        news = db.session.get(News, news_id)
        return news
    except SQLAlchemyError as e:
        logger.error(f"查询新闻 {news_id} 失败: {e}")
        raise

def add_news(data):
    """新增新闻"""
    # 处理时间
    if 'publish_time' in data and isinstance(data['publish_time'], str):
        try:
            data['publish_time'] = datetime.fromisoformat(data['publish_time'])
        except ValueError:
            raise ValueError("日期格式错误，应为 YYYY-MM-DD 或 ISO 格式")
    else:
        data['publish_time'] = datetime.utcnow()

    new_news = News(**data)

    try:
        db.session.add(new_news)
        db.session.commit()
        db.session.refresh(new_news)
        return new_news
    except SQLAlchemyError as e:
        db.session.rollback()
        logger.error(f"添加新闻失败: {e}")
        raise
    except Exception as e:
        db.session.rollback()
        logger.error(f"添加新闻未知错误: {e}")
        raise

def update_news(news_id, data):
    """更新新闻"""
    news = db.session.get(News, news_id)
    if not news:
        return None

    try:
        for key, value in data.items():
            if hasattr(news, key) and key != 'id':
                if key == 'publish_time' and isinstance(value, str):
                    try:
                        value = datetime.fromisoformat(value)
                    except ValueError:
                        raise ValueError("日期格式错误，应为 YYYY-MM-DD 或 ISO 格式")
                setattr(news, key, value)

        db.session.commit()
        return news
    except SQLAlchemyError as e:
        db.session.rollback()
        logger.error(f"更新新闻失败: {e}")
        raise
    except Exception as e:
        db.session.rollback()
        logger.error(f"更新新闻未知错误: {e}")
        raise

def delete_news(news_id):
    """删除新闻"""
    news = db.session.get(News, news_id)
    if not news:
        return False

    try:
        db.session.delete(news)
        db.session.commit()
        return True
    except SQLAlchemyError as e:
        db.session.rollback()
        logger.error(f"删除新闻失败: {e}")
        raise
    except Exception as e:
        db.session.rollback()
        logger.error(f"删除新闻未知错误: {e}")
        raise