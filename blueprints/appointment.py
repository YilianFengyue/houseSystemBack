from flask import Blueprint, request, jsonify
from services.appointment_service import create_appointments
from extensions import db
from datetime import datetime

appointment_bp = Blueprint("appointment", __name__)

@appointment_bp.route("/appointments", methods=["POST"])
def create_appointment():
    data = request.json

    required_fields = ['username', 'property', 'time']
    for field in required_fields:
        if field not in data:
            return jsonify({"message": f"缺少必要字段: {field}"}), 400


    try:
        # 使用datetime.fromisoformat解析ISO 8601格式的日期时间
        # 注意：Python 3.7+ 支持fromisoformat，但需要去掉最后的'Z'，替换为'+00:00'
        date_str = data['time'].replace('Z', '+00:00')
        appointment_time = datetime.fromisoformat(date_str)

        # 更新数据中的time字段为解析后的datetime对象
        data['time'] = appointment_time

        # 创建新预约
        new_appointment = create_appointments(data)

        # 返回成功响应
        return jsonify({
            "message": "预约添加成功",
            "data": {
                "username": new_appointment.username,
                "property": new_appointment.property,
                "time": new_appointment.time.strftime("%Y-%m-%d %H:%M:%S")
            }
        }), 201


    except ValueError as ve:
        return jsonify({"message": f"日期格式错误: {str(ve)}"}), 400
    except Exception as e:
        db.session.rollback()
        # 打印详细错误信息，便于调试
        import traceback
        traceback.print_exc()
        return jsonify({"message": f"添加预约失败: {str(e)}"}), 500