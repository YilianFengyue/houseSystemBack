from flask import session
from models.models import UserInfo
from exts import db
from flask_mail import Message
from flask import current_app
from exts import mail
import random
import datetime

def get_user_by_username(username):
    """根据用户名查找用户(兼容别名)"""
    return get_user_by_name(username)

def create_user(username=None, password=None, identification=None, phone=None, name=None, email=None, addr=None, identityCard=None, status=1):
    """创建新用户"""
    # Maintain backward compatibility with 'name' parameter
    username = username or name
    user = UserInfo(
        name=username,
        password=password,
        email=email,
        phone=phone,
        addr=addr,
        identityCard=identityCard or identification,
        status=status
    )
    db.session.add(user)
    db.session.commit()
    return user

def get_user_by_name(name):
    """根据用户名查找用户"""
    return db.session.query(UserInfo).filter_by(name=name).first()

def get_user_by_id(user_id):
    """根据ID查找用户"""
    return db.session.get(UserInfo, user_id)

def get_all_users():
    """获取所有用户"""
    return db.session.query(UserInfo).all()

def get_user_status(user_id):
    """获取用户状态"""
    user = db.session.get(UserInfo, user_id)
    return user.status if user else None

def update_user(user_id, **kwargs):
    """更新用户信息"""
    user = db.session.get(UserInfo, user_id)
    if not user:
        return None
        
    for key, value in kwargs.items():
        if hasattr(user, key):
            setattr(user, key, value)
            
    db.session.commit()
    return user

def delete_user(user_id):
    """删除用户"""
    user = db.session.get(UserInfo, user_id)
    if user:
        db.session.delete(user)
        db.session.commit()
        return True
    return False

def generate_verification_code():
    """生成6位随机数字验证码"""
    return ''.join([str(random.randint(0, 9)) for _ in range(6)])

def send_verification_email(email, code):
    """发送验证码邮件"""
    msg = Message(
        subject="您的验证码",
        recipients=[email],
        body=f"您的验证码是: {code}, 有效期为5分钟"
    )
    mail.send(msg)

def verify_code(email, code):
    """验证验证码有效性"""
    session_key = f"verification_code_{email}"
    if session_key not in session:
        return False
    
    stored_code, expires_at = session[session_key]
    now = datetime.datetime.now()
    
    return code == stored_code and expires_at > now

def update_verification_code(email, code):
    """更新用户验证码信息"""
    session_key = f"verification_code_{email}"
    expires_at = datetime.datetime.now() + datetime.timedelta(minutes=5)
    session[session_key] = (code, expires_at)
    return True

def get_user_info(username):
    """获取用户完整信息"""
    return db.session.query(UserInfo).filter_by(name=username).first()

def update_user_info(user_id, **kwargs):
    """更新用户信息"""
    user = db.session.get(UserInfo, user_id)
    if not user:
        return False
    
    for key, value in kwargs.items():
        if hasattr(user, key):
            setattr(user, key, value)
    
    db.session.commit()
    return True

def delete_user_account(user_id):
    """删除用户账户"""
    user = db.session.get(UserInfo, user_id)
    if not user:
        return False
    
    db.session.delete(user)
    db.session.commit()
    return True

def reset_password(username, new_password="1234"):
    """重置用户密码"""
    user = db.session.query(UserInfo).filter_by(name=username).first()
    if not user:
        return False
    
    user.password = new_password
    db.session.commit()
    return True
