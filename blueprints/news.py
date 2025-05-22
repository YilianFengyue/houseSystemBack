from flask import Blueprint, request, current_app
from sqlalchemy.exc import SQLAlchemyError
from exts import db
from models.models import News
from utils.response_utils import success_response, error_response, Code
from datetime import datetime
from services.news_service import get_all_news, get_news_by_id, update_news, add_news, delete_news

news_bp = Blueprint('news', __name__, url_prefix='/news')

def get_db_session():
    return db.session


# 1. 获取所有新闻，默认按发布时间降序，支持分页
@news_bp.route('', methods=['GET'])
def get_all_news_route():
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 10, type=int)
    try:
        response_data = get_all_news(page, per_page)
        if not response_data["items"] and page == 1:
            return success_response(data=response_data, message="暂无新闻", code=Code.GET_OK)
        print(response_data["items"])
        return success_response(data=response_data, message="查询成功", code=Code.GET_OK)
    except Exception as e:
        current_app.logger.error(f"查询新闻失败: {e}")
        return error_response("查询新闻失败", code=Code.INTERNAL_SERVER_ERROR)

# 2. 根据ID获取单条新闻详情
@news_bp.route('/<int:id>', methods=['GET'])
def get_news_by_id_route(id):
    try:
        news = get_news_by_id(id)
        if news:
            return success_response(data=news.to_dict(), code=Code.GET_OK)
        else:
            return error_response("新闻未找到", code=Code.NOT_FOUND)
    except Exception as e:
        current_app.logger.error(f"查询新闻 {id} 失败: {e}")
        return error_response("数据库错误", code=Code.INTERNAL_SERVER_ERROR)

# 3. 新增新闻
@news_bp.route('', methods=['POST'])
def add_news_route():
    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    required_fields = ['title', 'content']
    for field in required_fields:
        if field not in data or data[field] is None:
            return error_response(f"缺少必填字段: {field}", code=Code.BAD_REQUEST)

    try:
        new_news = add_news(data)
        return success_response(data=new_news.to_dict(), message="新闻添加成功", code=Code.SAVE_OK)
    except ValueError as e:
        return error_response(str(e), code=Code.BAD_REQUEST)
    except Exception as e:
        error_message = f"添加新闻失败: {str(e)}"
        current_app.logger.error(error_message)
        return error_response(error_message, code=Code.INTERNAL_SERVER_ERROR)

# 4. 更新新闻
@news_bp.route('/<int:id>', methods=['PUT'])
def update_news_route(id):
    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    try:
        news = update_news(id, data)
        if news:
            return success_response(data=news.to_dict(), message="新闻更新成功", code=Code.UPDATE_OK)
        else:
            return error_response("新闻未找到", code=Code.NOT_FOUND)
    except ValueError as e:
        return error_response(str(e), code=Code.BAD_REQUEST)
    except Exception as e:
        current_app.logger.error(f"更新新闻失败: {e}")
        return error_response("更新新闻失败", code=Code.INTERNAL_SERVER_ERROR)

# 5. 删除新闻
@news_bp.route('/<int:id>', methods=['DELETE'])
def delete_news_route(id):
    try:
        if delete_news(id):
            return success_response(message="新闻删除成功", code=Code.DELETE_OK)
        else:
            return error_response("新闻未找到", code=Code.NOT_FOUND)
    except Exception as e:
        current_app.logger.error(f"删除新闻失败: {e}")
        return error_response("删除新闻失败", code=Code.INTERNAL_SERVER_ERROR)
