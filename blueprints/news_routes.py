from flask import Blueprint, request, current_app
from sqlalchemy.exc import SQLAlchemyError
from exts import db
from models.news_model import News
from utils.response_utils import success_response, error_response, Code
from datetime import datetime

news_bp = Blueprint('news', __name__, url_prefix='/news')

def get_db_session():
    return db.session


# 1. 获取所有新闻，默认按发布时间降序，支持分页
@news_bp.route('/', methods=['GET'])
def get_all_news():
    session = get_db_session()
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 10, type=int)

        query = session.query(News).order_by(News.publish_time.desc(), News.id.desc())
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

        if not news_list and page == 1:
            return success_response(data=response_data, message="暂无新闻", code=Code.GET_OK)

        return success_response(data=response_data, message="查询成功", code=Code.GET_OK)
    except SQLAlchemyError as e:
        current_app.logger.error(f"查询新闻失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        current_app.logger.error(f"查询新闻时发生未知错误: {e}")
        return error_response("查询新闻失败", code=Code.INTERNAL_SERVER_ERROR)


# 2. 根据ID获取单条新闻详情
@news_bp.route('/<int:news_id>', methods=['GET'])
def get_news_by_id(news_id):
    session = get_db_session()
    try:
        news = session.get(News, news_id)
        if news:
            return success_response(data=news.to_dict(), code=Code.GET_OK)
        else:
            return error_response("新闻未找到", code=Code.NOT_FOUND)
    except SQLAlchemyError as e:
        current_app.logger.error(f"查询新闻 {news_id} 失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)


# 3. 新增新闻
@news_bp.route('/', methods=['POST'])
def add_news():
    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    required_fields = ['title', 'content']
    for field in required_fields:
        if field not in data or data[field] is None:
            return error_response(f"缺少必填字段: {field}", code=Code.BAD_REQUEST)

    # 处理时间
    if 'publish_time' in data and isinstance(data['publish_time'], str):
        try:
            data['publish_time'] = datetime.fromisoformat(data['publish_time'])
        except ValueError:
            return error_response("日期格式错误，应为 YYYY-MM-DD 或 ISO 格式", code=Code.BAD_REQUEST)
    else:
        data['publish_time'] = datetime.utcnow()

    new_news = News(**data)

    session = get_db_session()
    try:
        session.add(new_news)
        session.commit()
        session.refresh(new_news)
        return success_response(data=new_news.to_dict(), message="新闻添加成功", code=Code.SAVE_OK)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"添加新闻失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        session.rollback()
        current_app.logger.error(f"添加新闻未知错误: {e}")
        return error_response("添加新闻失败", code=Code.INTERNAL_SERVER_ERROR)


# 4. 更新新闻
@news_bp.route('/<int:news_id>', methods=['PUT'])
def update_news(news_id):
    session = get_db_session()
    news = session.get(News, news_id)
    if not news:
        return error_response("新闻未找到", code=Code.NOT_FOUND)

    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    try:
        for key, value in data.items():
            if hasattr(news, key) and key != 'id':
                if key == 'publish_time' and isinstance(value, str):
                    try:
                        value = datetime.fromisoformat(value)
                    except ValueError:
                        return error_response("日期格式错误，应为 YYYY-MM-DD 或 ISO 格式", code=Code.BAD_REQUEST)
                setattr(news, key, value)

        session.commit()
        return success_response(data=news.to_dict(), message="新闻更新成功", code=Code.UPDATE_OK)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"更新新闻失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        session.rollback()
        current_app.logger.error(f"更新新闻未知错误: {e}")
        return error_response("更新新闻失败", code=Code.INTERNAL_SERVER_ERROR)


# 5. 删除新闻
@news_bp.route('/<int:news_id>', methods=['DELETE'])
def delete_news(news_id):
    session = get_db_session()
    news = session.get(News, news_id)
    if not news:
        return error_response("新闻未找到", code=Code.NOT_FOUND)

    try:
        session.delete(news)
        session.commit()
        return success_response(message="新闻删除成功", code=Code.DELETE_OK)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"删除新闻失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)
