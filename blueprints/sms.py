from flask import Blueprint, request, current_app
from utils.response_utils import success_response, error_response, Code
from services.sms_service import SMSService
from services.user_service import get_user_by_phone
from models.user_model import UserModel
from exts.db import db
import jwt
import datetime
import re

sms_bp = Blueprint('sms', __name__, url_prefix='/sms')

def validate_phone(phone):
    """
    验证手机号格式
    """
    pattern = r'^1[3-9]\d{9}$'
    return re.match(pattern, phone) is not None

@sms_bp.route('/send-code', methods=['POST'])
def send_verification_code():
    """
    发送短信验证码
    """
    try:
        data = request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        phone = data.get('phone')
        if not phone:
            return error_response(code=Code.BAD_REQUEST, message="手机号不能为空")
        
        # 验证手机号格式
        if not validate_phone(phone):
            return error_response(code=Code.BAD_REQUEST, message="手机号格式不正确")
        
        # 检查发送频率限制
        can_send, limit_message = SMSService.check_send_limit(phone)
        if not can_send:
            return error_response(code=Code.TOO_MANY_REQUESTS, message=limit_message)
        
        # 发送验证码
        result = SMSService.send_verification_code(phone)
        
        if result['success']:
            return success_response(
                code=Code.SAVE_OK,
                message=result['message'],
                data={'request_id': result.get('request_id')}
            )
        else:
            return error_response(
                code=Code.INTERNAL_SERVER_ERROR,
                message=result['message']
            )
            
    except Exception as e:
        current_app.logger.error(f"Send SMS code error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="发送验证码失败")

@sms_bp.route('/verify-login', methods=['POST'])
def sms_login():
    """
    短信验证码登录
    """
    try:
        data = request.form if request.content_type == 'application/x-www-form-urlencoded' else request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        phone = data.get('phone')
        code = data.get('code')
        
        if not phone or not code:
            return error_response(code=Code.BAD_REQUEST, message="手机号和验证码不能为空")
        
        # 验证手机号格式
        if not validate_phone(phone):
            return error_response(code=Code.BAD_REQUEST, message="手机号格式不正确")
        
        # 验证短信验证码
        is_valid, verify_message = SMSService.verify_code(phone, code)
        if not is_valid:
            return error_response(code=Code.UNAUTHORIZED, message=verify_message)
        
        # 查找用户
        user = get_user_by_phone(phone)
        if not user:
            # 如果用户不存在，自动创建新用户
            user = UserModel(phone=phone)
            db.session.add(user)
            db.session.commit()
            current_app.logger.info(f"Created new user with phone: {phone}")
        
        # 生成JWT token
        token_payload = {
            'user_id': user.id,
            'phone': user.phone,
            'type': user.userType,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)
        }
        token = jwt.encode(token_payload, current_app.config['SECRET_KEY'], algorithm="HS256")
        
        return success_response(
            code=Code.SAVE_OK,
            data={"token": token},
            message="短信验证登录成功"
        )
        
    except Exception as e:
        current_app.logger.error(f"SMS login error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="短信登录失败")

@sms_bp.route('/verify-code', methods=['POST'])
def verify_code_only():
    """
    仅验证短信验证码（不登录）
    """
    try:
        data = request.get_json()
        if not data:
            return error_response(code=Code.BAD_REQUEST, message="请求数据不能为空")
        
        phone = data.get('phone')
        code = data.get('code')
        
        if not phone or not code:
            return error_response(code=Code.BAD_REQUEST, message="手机号和验证码不能为空")
        
        # 验证手机号格式
        if not validate_phone(phone):
            return error_response(code=Code.BAD_REQUEST, message="手机号格式不正确")
        
        # 验证短信验证码
        is_valid, verify_message = SMSService.verify_code(phone, code)
        if is_valid:
            return success_response(code=Code.GET_OK, message=verify_message)
        else:
            return error_response(code=Code.UNAUTHORIZED, message=verify_message)
            
    except Exception as e:
        current_app.logger.error(f"Verify SMS code error: {e}")
        return error_response(code=Code.INTERNAL_SERVER_ERROR, message="验证码验证失败") 