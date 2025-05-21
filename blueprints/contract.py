from flask import Blueprint, request, jsonify
from services.contract_service import create_contracts
from exts.db import db
from utils.response_utils import success_response, error_response
from datetime import datetime

contract_bp = Blueprint("contract", __name__)

# 新增合同
# 后期还需修改
@contract_bp.route("/contracts", methods=["POST"])
def create_contract():
    data = request.json
    print(data)
    # 验证必要字段
    required_fields = [
        'rentValue', 'purpose', 'startDate', 'endDate',
        'landlordName', 'landlordId', 'landlordPhone',
        'tenantName', 'tenantId', 'tenantPhone',
        'formattedRent', 'currentDate'
    ]
    # for field in required_fields:
    #     if field not in data:
    #         return jsonify({"message": f"缺少必要字段: {field}"}), 400

    try:
        # 创建新合同
        new_contract = create_contracts(data)

        return success_response(data=new_contract.to_dict(), message="合同提交成功", code=201)

    except Exception as e:
        db.session.rollback()
        return error_response(message=f"提交合同失败: {str(e)}", code=500)