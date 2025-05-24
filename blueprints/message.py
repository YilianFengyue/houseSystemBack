from flask import Blueprint, request, jsonify
from services.message_service import (
    get_messages_by_sender,
    create_message,
    get_messages_by_channel,
    get_messages_by_receiver,
    get_messages_between_users
)
from services.channel_service import get_channel
import logging
from functools import wraps
from utils.response_utils import success_response, error_response
from flask import current_app
from socketio_init import socketio

logger = logging.getLogger(__name__)

message_bp = Blueprint("message", __name__, url_prefix="/comments")

def handle_errors(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except ValueError as e:
            logger.exception("输入参数错误")
            return jsonify({
                "status": "error",
                "message": "输入参数错误",
                "detail": str(e)
            }), 400
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
        # messages = get_messages_by_sender(sender)
        messages = get_messages_between_users(user1, user2)
    elif user1 and user2:
        channel = get_channel(user1, user2)
        messages = get_messages_by_channel(channel.channel_id)
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

    sender = data['sender_username']
    receiver = data['receiver_username']
    channel = get_channel(sender, receiver)

    # 创建新消息
    new_message = create_message(
        content=data['content'],
        sender_username=sender,
        receiver_username=receiver,
        channel_id=channel.channel_id
    )

    # 广播消息给所有连接的客户端
    socketio = current_app.extensions['socketio']
    socketio.emit('new_message', new_message.to_dict())

    return success_response(data={"message": new_message.to_dict()}, code=201)


# @message_bp.route("/messages/andy", methods=["GET"])
# @handle_errors
# def get_andy_messages():
#     """专门获取Andy发送的消息接口"""
#     messages = get_messages_by_sender("Andy")
#
#     return success_response(data={"messages": [msg.to_dict() for msg in messages]})

# 根据发送者用户名获取聊天记录
@message_bp.route("/messages/<string:sender_username>", methods=["GET"])
@handle_errors
def get_sender_message(sender_username):
    """获取任意用户发送的消息"""
    messages = get_messages_by_sender(sender_username)
    return success_response(data={"messages": [msg.to_dict() for msg in messages]})

@message_bp.route("/messages/<string:receiver_username>", methods=["GET"])
@handle_errors
def get_receiver_message(receiver_username):
    """获取任意用户发送的消息"""
    messages = get_messages_by_receiver(receiver_username)
    return success_response(data={"messages": [msg.to_dict() for msg in messages]})

# 监听客户端发送的消息事件
@socketio.on('send_message')
def handle_send_message(data):
    sender = data.get('sender_username')
    receiver = data.get('receiver_username')
    content = data.get('content')

    if sender and receiver and content:
        channel = get_channel(sender, receiver)
        new_message = create_message(
            content=content,
            sender_username=sender,
            receiver_username=receiver,
            channel_id=channel.channel_id
        )
        # 广播消息给所有连接的客户端
        socketio.emit('new_message', new_message.to_dict())