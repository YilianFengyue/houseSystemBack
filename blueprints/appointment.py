from flask import Blueprint, request, jsonify
from services.appointment_service import create_appointments
from exts.db import db
from datetime import datetime
from utils.response_utils import success_response, error_response
appointment_bp = Blueprint("appointment", __name__)

# 创建预约
@appointment_bp.route("/appointments", methods=["POST"])
def create_appointment():
    data = request.json

    required_fields = ['username', 'property', 'time']
    for field in required_fields:
        if field not in data:
            return jsonify({"message": f"缺少必要字段: {field}"}), 400

    try:
        # 使用datetime.fromisoformat解析ISO 8601格式的日期时间
        date_str = data['time'].replace('Z', '+00:00')
        appointment_time = datetime.fromisoformat(date_str)

        # 更新数据中的time字段为解析后的datetime对象
        data['time'] = appointment_time

        # 创建新预约
        new_appointment = create_appointments(data)

        return success_response(data=new_appointment.to_dict(), message="预约提交成功", code=201)


    except ValueError as ve:
        return error_response(message=f"日期格式错误: {str(ve)}", code=400)
    except Exception as e:
        db.session.rollback()
        # 打印详细错误信息，便于调试
        import traceback
        traceback.print_exc()
        return error_response(message=f"添加预约失败: {str(e)}", code=500)