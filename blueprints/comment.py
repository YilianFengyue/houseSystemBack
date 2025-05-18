from flask import Blueprint, request, jsonify
from models.models import HouseInfo, Comment
from services.comment_service import get_comment_by_house_id, get_comment_by_id, create_comment
from extensions import db
comment_bp = Blueprint("comment", __name__)

# 根据房源id获取评论
@comment_bp.route("/comments/<int:house_id>", methods=["GET"])
def get_comments(house_id):
    try:
        # 调用 comment_service 中的函数获取评论
        comments = get_comment_by_house_id(house_id)
        if not comments:
            return jsonify({"message": "未找到该房源的评论信息", "data": []}), 404
        # 将评论对象转换为字典列表
        comment_list = []
        for comment in comments:
            comment_dict = {
                "comment_id": comment.comment_id,
                "house_id": comment.house_id,
                "username": comment.username,
                "type": comment.type,
                "desc": comment.desc,
                "time": comment.time.strftime("%Y-%m-%d %H:%M:%S") if comment.time else None,
                "at": comment.at
            }
            comment_list.append(comment_dict)
        return jsonify({"message": "获取评论信息成功", "data": comment_list}), 200
    except Exception as e:
        return jsonify({"message": f"获取评论信息失败: {str(e)}", "data": []}), 500

# 根据评论id获取评论
@comment_bp.route("/comments/<int:comment_id>", methods=["GET"])
def get_comment_by_id(comment_id):
    try:
        # 调用 comment_service 中的函数获取评论
        comment = get_comment_by_id(comment_id)
        if not comment:
            return jsonify({"message": "未找到该id的评论信息", "data": []}), 404

        # 将评论对象转换为字典列表
        comment_list = []
        for comment in comment:
            comment_dict = {
                "comment_id": comment.comment_id,
                "house_id": comment.house_id,
                "username": comment.username,
                "type": comment.type,
                "desc": comment.desc,
                "time": comment.time.strftime("%Y-%m-%d %H:%M:%S") if comment.time else None,
                "at": comment.at
            }
            comment_list.append(comment_dict)
        return jsonify({"message": "获取评论信息成功", "data": comment_list}), 200
    except Exception as e:
        return jsonify({"message": f"获取评论信息失败: {str(e)}", "data": []}), 500

# 创建新评论
@comment_bp.route("/comments", methods=["POST"])
def create_comment():
    data = request.json

    # 验证必要字段
    required_fields = ['house_id', 'username', 'type', 'desc']
    for field in required_fields:
        if field not in data:
            return jsonify({"message": f"缺少必要字段: {field}"}), 400

    try:
        # 转换数据类型
        data['house_id'] = int(data['house_id'])
        data['type'] = int(data['type'])

        if data.get('at') and data['at'].strip():  # 检查 at 字段是否为空字符串
            data['at'] = int(data['at'])
        else:
            data['at'] = None

        # 创建新评论
        new_comment = create_comment(data)

        # 返回成功响应
        return jsonify({
            "message": "评论添加成功",
            "data": {
                "comment_id": new_comment.comment_id,
                "house_id": new_comment.house_id,
                "username": new_comment.username,
                "type": new_comment.type,
                "desc": new_comment.desc,
                "at": new_comment.at,
                "time": new_comment.time.strftime("%Y-%m-%d %H:%M:%S")
            }
        }), 201

    except ValueError as ve:
        return jsonify({"message": f"数据类型错误: {str(ve)}"}), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({"message": f"添加评论失败: {str(e)}"}), 500