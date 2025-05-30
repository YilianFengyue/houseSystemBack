# blueprints/log_management.py
from flask import Blueprint, jsonify, request
from models.log_model import LogEntry # 确保路径正确
from exts.db import db
from datetime import datetime, timedelta
from sqlalchemy import func
from utils.response_utils import success_response, error_response, Code

log_bp = Blueprint('log_management', __name__, url_prefix='/admin/logs')

@log_bp.route('/', methods=['GET'])
def get_logs():
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 20, type=int)
    level = request.args.get('level')
    start_date_str = request.args.get('start_date')
    end_date_str = request.args.get('end_date')
    search_term = request.args.get('search') # 搜索日志消息内容

    query = LogEntry.query

    if level:
        query = query.filter(LogEntry.level == level.upper())
    if start_date_str:
        try:
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d')
            query = query.filter(LogEntry.timestamp >= start_date)
        except ValueError:
            return jsonify({"error": "Invalid start_date format. Use YYYY-MM-DD"}), 400
    if end_date_str:
        try:
            # 包含当天，所以查询到当天的 23:59:59
            end_date = datetime.strptime(end_date_str, '%Y-%m-%d') + timedelta(days=1, microseconds=-1)
            query = query.filter(LogEntry.timestamp <= end_date)
        except ValueError:
            return jsonify({"error": "Invalid end_date format. Use YYYY-MM-DD"}), 400
    if search_term:
        query = query.filter(LogEntry.message.ilike(f'%{search_term}%'))

    query = query.order_by(LogEntry.timestamp.desc())
    pagination = query.paginate(page=page, per_page=per_page, error_out=False)
    logs = pagination.items
    data= {
        "logs": [{
            "id": log.id,
            "timestamp": log.timestamp.isoformat(),
            "level": log.level,
            "module": log.module,
            "func_name": log.func_name,
            "line_no": log.line_no,
            "message": log.message,
            "traceback": log.traceback
        } for log in logs],
        "total": pagination.total,
        "pages": pagination.pages,
        "current_page": page
    }
    return success_response(data,"请求成功", code=Code.GET_OK)

@log_bp.route('/delete', methods=['POST']) # 使用 POST 更安全，或者 DELETE 带请求体
def delete_logs():
    # 简单的实现：删除指定 ID 的日志
    # 更复杂的可以按日期范围、级别等删除
    data = request.get_json()
    if not data or 'ids' not in data or not isinstance(data['ids'], list):
        return jsonify({"error": "Invalid request. 'ids' (list of integers) is required."}), 400

    ids_to_delete = [int(id_val) for id_val in data['ids'] if isinstance(id_val, (int, str)) and str(id_val).isdigit()]

    if not ids_to_delete:
        return jsonify({"error": "No valid log IDs provided for deletion."}), 400

    try:
        num_deleted = LogEntry.query.filter(LogEntry.id.in_(ids_to_delete)).delete(synchronize_session=False)
        db.session.commit()
        return jsonify({"message": f"Successfully deleted {num_deleted} log entries."}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": f"Failed to delete logs: {str(e)}"}), 500

@log_bp.route('/levels', methods=['GET'])
def get_log_levels():
    # 获取数据库中实际存在的日志级别，用于前端筛选器
    levels = db.session.query(LogEntry.level, func.count(LogEntry.level)).group_by(LogEntry.level).all()
    return jsonify([{"level": level, "count": count} for level, count in levels])

# 注册蓝图到 app
# 在 app.py 中:
# from blueprints.log_management import log_bp
# app.register_blueprint(log_bp)