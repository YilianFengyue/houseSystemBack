from flask import Blueprint, request, current_app
from utils.response_utils import success_response, error_response, Code
from services.user_service import get_user_by_email
from models.user_model import UserModel
from exts.db import db
from exts.redis import redis_store
import jwt
import datetime
import re
import random
from blueprints.celery_bp import send_email_smtp

email_auth_bp = Blueprint('email_auth', __name__, url_prefix='/email-auth')

def validate_email(email):
    """
    验证邮箱格式
    """
    pattern = r'^[^\s@]+@[^\s@]+\.[^\s@]+$'
    return re.match(pattern, email) is not None

def check_send_limit(email):
    """
    检查邮件发送频率限制
    """
    # 检查60秒内是否已发送
    last_send_key = f"email_last_send:{email}"
    last_send_time = redis_store.get(last_send_key)
    
    if last_send_time:
        return False, "请等待60秒后再次发送验证码"
    
    # 检查今日发送次数
    daily_count_key = f"email_daily_count:{email}:{datetime.datetime.now().strftime('%Y%m%d')}"
    daily_count = redis_store.get(daily_count_key)
    
    if daily_count and int(daily_count) >= 10:
        return False, "今日发送次数已达上限，请明天再试"
    
    return True, "可以发送"

@email_auth_bp.route('/send-code', methods=['POST'])
def send_email_verification_code():
    """
    发送邮箱验证码
    """
    try:
        data = request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        email = data.get('email')
        if not email:
            return error_response(code=Code.BAD_REQUEST, message="邮箱不能为空")
        
        # 验证邮箱格式
        if not validate_email(email):
            return error_response(code=Code.BAD_REQUEST, message="邮箱格式不正确")
        
        # 检查用户是否存在
        user = get_user_by_email(email)
        if not user:
            return error_response(code=Code.NOT_FOUND, message="该邮箱未注册，请先注册账号")
        
        # 检查发送频率限制
        can_send, limit_message = check_send_limit(email)
        if not can_send:
            return error_response(code=Code.TOO_MANY_REQUESTS, message=limit_message)
        
        # 生成6位数字验证码
        verification_code = ''.join([str(random.randint(0, 9)) for _ in range(6)])
        
        # 存储验证码到Redis，5分钟过期
        redis_key = f'email_verification_code:{email}'
        redis_store.set(redis_key, verification_code, ex=300)
        
        # 记录发送时间和次数
        last_send_key = f"email_last_send:{email}"
        redis_store.set(last_send_key, "1", ex=60)  # 60秒限制
        
        daily_count_key = f"email_daily_count:{email}:{datetime.datetime.now().strftime('%Y%m%d')}"
        redis_store.incr(daily_count_key)
        redis_store.expire(daily_count_key, 86400)  # 24小时过期
        
        # 异步发送邮件
        try:
            send_email_smtp(email, verification_code)
            return success_response(
                code=Code.SAVE_OK,
                message="验证码已发送到您的邮箱，请查收",
                data={}
            )
        except Exception as e:
            current_app.logger.error(f"Send email error: {e}")
            return error_response(code=Code.INTERNAL_SERVER_ERROR, message="邮件发送失败，请稍后重试")
            
    except Exception as e:
        current_app.logger.error(f"Send email code error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="发送验证码失败")

@email_auth_bp.route('/verify-login', methods=['POST'])
def email_verification_login():
    """
    邮箱验证码登录
    """
    try:
        data = request.form if request.content_type == 'application/x-www-form-urlencoded' else request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        email = data.get('email')
        code = data.get('code')
        
        if not email or not code:
            return error_response(code=Code.BAD_REQUEST, message="邮箱和验证码不能为空")
        
        # 验证邮箱格式
        if not validate_email(email):
            return error_response(code=Code.BAD_REQUEST, message="邮箱格式不正确")
        
        # 验证验证码
        redis_key = f'email_verification_code:{email}'
        stored_code = redis_store.get(redis_key)
        
        if not stored_code:
            return error_response(code=Code.UNAUTHORIZED, message="验证码已过期，请重新获取")
        
        if stored_code.decode('utf-8') != code:
            return error_response(code=Code.UNAUTHORIZED, message="验证码错误")
        
        # 验证成功，删除验证码
        redis_store.delete(redis_key)
        
        # 查找用户
        user = get_user_by_email(email)
        if not user:
            return error_response(code=Code.NOT_FOUND, message="用户不存在")
        
        # 生成JWT token
        token_payload = {
            'user_id': user.id,
            'phone': user.phone,
            'email': user.email,
            'type': user.userType,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)
        }
        token = jwt.encode(token_payload, current_app.config['SECRET_KEY'], algorithm="HS256")
        
        return success_response(
            code=Code.SAVE_OK,
            data={"token": token},
            message="邮箱验证登录成功"
        )
        
    except Exception as e:
        current_app.logger.error(f"Email verification login error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="邮箱验证登录失败")

@email_auth_bp.route('/verify-code', methods=['POST'])
def verify_email_code_only():
    """
    仅验证邮箱验证码（不登录）
    """
    try:
        data = request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        email = data.get('email')
        code = data.get('code')
        
        if not email or not code:
            return error_response(code=Code.BAD_REQUEST, message="邮箱和验证码不能为空")
        
        # 验证邮箱格式
        if not validate_email(email):
            return error_response(code=Code.BAD_REQUEST, message="邮箱格式不正确")
        
        # 验证验证码
        redis_key = f'email_verification_code:{email}'
        stored_code = redis_store.get(redis_key)
        
        if not stored_code:
            return error_response(code=Code.UNAUTHORIZED, message="验证码已过期，请重新获取")
        
        if stored_code.decode('utf-8') == code:
            return success_response(code=Code.GET_OK, message="验证码验证成功")
        else:
            return error_response(code=Code.UNAUTHORIZED, message="验证码错误")
            
    except Exception as e:
        current_app.logger.error(f"Verify email code error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="验证码验证失败") 