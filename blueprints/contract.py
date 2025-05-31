from flask import Blueprint, request, jsonify
from services.contract_service import create_contracts, get_contract_by_landlordId, get_contract_by_landlordId_and_tenant
from services.rental_service import create_rental
from exts.db import db
from utils.response_utils import success_response, error_response
from datetime import datetime
contract_bp = Blueprint("contract", __name__)

# 新增合同
# 后期还需修改
# 新增 同时插入rental表
@contract_bp.route("/contracts", methods=["POST"])
def create_contract():
    data = request.json

    # 验证必要字段
    required_fields = [
        'rentValue', 'purpose', 'startDate', 'endDate',
        'landlordName', 'landlordId', 'landlordPhone',
        'tenantName', 'tenantId', 'tenantPhone',
        'formattedRent', 'currentDate'
    ]

    for field in required_fields:
        if field not in data:
            return jsonify({"message": f"缺少必要字段: {field}"}), 400

    try:
        # 创建新合同
        new_contract = create_contracts(data)

        # 新增，创建新租房记录
        new_rental = create_rental(data)

        response_data = new_contract.to_dict()
        response_data['rental_info'] = new_rental.to_dict()  # 添加新rental的信息

        return success_response(data=response_data, message="合同提交成功", code=201)

    except Exception as e:
        db.session.rollback()
        return error_response(message=f"提交合同失败: {str(e)}", code=500)

@contract_bp.route("/contracts/<string:tenantName>/<string:landlord_id>", methods=["GET"])
def get_contract(landlord_id, tenantName):
    try:
        contract = get_contract_by_landlordId_and_tenant(landlord_id, tenantName)
        return success_response(data=contract.to_dict(), message="返回成功", code=200)

    except Exception as e:
        return error_response("不存在该合同", code=404)