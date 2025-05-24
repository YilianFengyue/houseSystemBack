from models.models import UserInfo
from exts.db import db

def get_user_by_username(username):
    """根据用户名查找用户(兼容别名)"""
    return get_user_by_name(username)

def create_user(username=None, password=None, identification=None, phone=None, name=None, email=None, addr=None, identityCard=None):
    """创建新用户"""
    # Maintain backward compatibility with 'name' parameter
    username = username or name
    user = UserInfo(
        name=username,
        password=password,
        email=email,
        phone=phone,
        addr=addr,
        identityCard=identityCard or identification
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

def get_user_by_phone(phone):
    """<UNK>"""
    return db.session.query(UserInfo).filter_by(phone=phone).first()