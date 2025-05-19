from flask import Blueprint, request, jsonify
from services.message_service import (
    get_messages_by_sender,
    get_messages_between_users,
    create_message
)
from exts.db import db
from datetime import datetime
import logging
from functools import wraps
from utils.response_utils import success_response, error_response

logger = logging.getLogger(__name__)

message_bp = Blueprint("message", __name__, url_prefix="/comments")

def handle_errors(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except Exception as e:
            logger.exception("服务器内部错误")
            return jsonify({
                "status": "error",
                "message": "服务器内部错误",
                "detail": str(e)
            }), 500

    return wrapper


@message_bp.route("/messages", methods=["GET"])
@handle_errors
def get_messages():
    """获取消息接口"""
    sender = request.args.get('sender')
    user1 = request.args.get('user1')
    user2 = request.args.get('user2')

    if sender:
        messages = get_messages_by_sender(sender)
    elif user1 and user2:
        messages = get_messages_between_users(user1, user2)
    else:
        return jsonify({
            "status": "error",
            "message": "必须提供sender参数或user1和user2参数"
        }), 400

    return success_response(data={"messages": [msg.to_dict() for msg in messages]})


@message_bp.route("/messages", methods=["POST"])
@handle_errors
def post_message():
    """发送消息接口"""
    if not request.is_json:
        return jsonify({
            "status": "error",
            "message": "请求必须为JSON格式"
        }), 400

    data = request.get_json()

    # 验证必要字段
    required_fields = ['content', 'sender_username', 'receiver_username']
    if not all(field in data for field in required_fields):
        return jsonify({
            "status": "error",
            "message": f"缺少必要字段，需要: {', '.join(required_fields)}"
        }), 400

    # 创建新消息
    new_message = create_message(
        content=data['content'],
        sender_username=data['sender_username'],
        receiver_username=data['receiver_username']
    )

    return success_response(data={"message": new_message.to_dict()}, code=201)


@message_bp.route("/messages/andy", methods=["GET"])
@handle_errors
def get_andy_messages():
    """专门获取Andy发送的消息接口"""
    messages = get_messages_by_sender("Andy")

    return success_response(data={"messages": [msg.to_dict() for msg in messages]})