import random
import json
from flask import current_app
from alibabacloud_dysmsapi20170525.client import Client as DysmsapiClient
from alibabacloud_tea_openapi import models as open_api_models
from alibabacloud_dysmsapi20170525 import models as dysmsapi_models
from alibabacloud_tea_util import models as util_models
from exts.redis import redis_store


class SMSService:
    @staticmethod
    def create_client():
        """
        创建阿里云短信客户端
        """
        config = open_api_models.Config(
            access_key_id=current_app.config['ALIYUN_ACCESS_KEY_ID'],
            access_key_secret=current_app.config['ALIYUN_ACCESS_KEY_SECRET']
        )
        config.endpoint = f'dysmsapi.{current_app.config["ALIYUN_SMS_REGION"]}.aliyuncs.com'
        return DysmsapiClient(config)

    @staticmethod
    def generate_verification_code():
        """
        生成6位随机验证码
        """
        return str(random.randint(100000, 999999))

    @staticmethod
    def send_verification_code(phone_number):
        """
        发送短信验证码
        
        Args:
            phone_number (str): 手机号码
            
        Returns:
            dict: 发送结果
        """
        try:
            client = SMSService.create_client()
            
            # 生成验证码
            verification_code = SMSService.generate_verification_code()
            
            # 构建短信发送请求
            send_sms_request = dysmsapi_models.SendSmsRequest(
                phone_numbers=phone_number,
                sign_name=current_app.config['ALIYUN_SMS_SIGN_NAME'],
                template_code=current_app.config['ALIYUN_SMS_TEMPLATE_CODE'],
                template_param=json.dumps({"code": verification_code})  # 模板参数
            )
            
            runtime = util_models.RuntimeOptions()
            
            # 发送短信
            response = client.send_sms_with_options(send_sms_request, runtime)
            
            if response.body.code == 'OK':
                # 短信发送成功，将验证码存储到Redis，有效期5分钟
                redis_key = f'sms_code:{phone_number}'
                redis_store.set(redis_key, verification_code, ex=300)  # 5分钟过期
                
                return {
                    'success': True,
                    'message': '验证码发送成功',
                    'request_id': response.body.request_id
                }
            else:
                return {
                    'success': False,
                    'message': f'短信发送失败: {response.body.message}',
                    'code': response.body.code
                }
                
        except Exception as e:
            current_app.logger.error(f"SMS send error: {e}")
            return {
                'success': False,
                'message': f'短信发送异常: {str(e)}'
            }

    @staticmethod
    def verify_code(phone_number, code):
        """
        验证短信验证码
        
        Args:
            phone_number (str): 手机号码
            code (str): 验证码
            
        Returns:
            bool: 验证结果
        """
        try:
            redis_key = f'sms_code:{phone_number}'
            stored_code = redis_store.get(redis_key)
            
            if stored_code is None:
                return False, '验证码已过期或不存在'
            
            stored_code = stored_code.decode('utf-8') if isinstance(stored_code, bytes) else stored_code
            
            if stored_code == code:
                # 验证成功后删除验证码
                redis_store.delete(redis_key)
                return True, '验证成功'
            else:
                return False, '验证码错误'
                
        except Exception as e:
            current_app.logger.error(f"SMS verify error: {e}")
            return False, f'验证异常: {str(e)}'

    @staticmethod
    def check_send_limit(phone_number):
        """
        检查发送频率限制（防止短信轰炸）
        
        Args:
            phone_number (str): 手机号码
            
        Returns:
            bool: 是否可以发送
        """
        try:
            limit_key = f'sms_limit:{phone_number}'
            send_count = redis_store.get(limit_key)
            
            if send_count is None:
                # 第一次发送，设置计数器，1小时过期
                redis_store.set(limit_key, 1, ex=3600)
                return True, '可以发送'
            
            send_count = int(send_count.decode('utf-8') if isinstance(send_count, bytes) else send_count)
            
            if send_count >= 5:  # 1小时内最多发送5次
                return False, '发送次数过多，请稍后再试'
            
            # 增加计数
            redis_store.incr(limit_key)
            return True, '可以发送'
            
        except Exception as e:
            current_app.logger.error(f"SMS limit check error: {e}")
            return False, f'检查异常: {str(e)}' 