from flask import Blueprint, request, jsonify
from services.repair_service import create_repaires
from utils.response_utils import error_response, success_response
from datetime import datetime

repair_bp = Blueprint("repair", __name__)

@repair_bp.route("/repaires", methods=["POST"])
def create_repaire():
    data = request.json
    print(data)
    # 检查请求数据是否为空
    if not data:
        return error_response(message="请求数据不能为空", code=400)

    # 处理可能为None或空字符串的字段
    for field in ["repair_description", "complaint_content", "complaint_person"]:
        if field in data:
            # 将None转换为空字符串
            if data[field] is None:
                data[field] = ""
                # 去除字符串两端的空格
                data[field] = data[field].strip()
                # 将仅包含空格的字符串视为空字符串
                if data[field] == "":
                    data[field] = ""

    # 处理描述和投诉内容为空的情况
    if not data.get("repair_description"):
        data["repair_description"] = " "

    if not data.get("complaint_content"):
        data["complaint_content"] = " "

    # 检查必要的字段是否存在
    required_fields = ["report_reason", "house_address", "repair_type", "agreed_terms"]
    for field in required_fields:
        if field not in data:
            return error_response(message=f"缺少必要字段: {field}", code=400)

    # 检查日期格式
    try:
        data["create_at"] = datetime.now()
    except ValueError:
        return error_response(message="日期格式不正确", code=400)

    try:
        # 调用 create_repairs 方法创建新的维修投诉记录
        repair = create_repaires(data)
        return success_response(data=repair.to_dict(), message="维修投诉记录创建成功", code=201)
    except Exception as e:
        # 打印详细的异常信息
        import traceback
        traceback.print_exc()
        return error_response(message=f"创建维修投诉记录失败: {str(e)}", code=500)

