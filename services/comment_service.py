from models.models import Comment
from extensions import db
from datetime import datetime

def get_comment_by_id(comment_id):
    """根据评论id查找评论"""
    return db.session.query(Comment).filter_by(comment_id=comment_id).one()

def get_comment_by_house_id(house_id):
    """根据房源id查找评论"""
    return db.session.query(Comment).filter_by(house_id=house_id).all()

def create_comment(data):
    """添加新评论"""
    comment = Comment(
        house_id=data['house_id'],
        username=data['username'],
        type=data['type'],
        desc=data['desc'],
        at=data.get('at'),  # at字段可选
        time=datetime.now()
    )
    db.session.add(comment)
    db.session.commit()
    return comment