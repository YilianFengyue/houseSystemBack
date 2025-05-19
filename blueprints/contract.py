from flask import Blueprint, request, jsonify
from services.contract_service import create_contracts
from exts.db import db
from datetime import datetime

contract_bp = Blueprint("contract", __name__)

# 新增合同
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

        return jsonify({
            "message": "合同提交成功",
            "data": {
                "rentValue": new_contract.rentValue,
                "purpose": new_contract.purpose,
                "startDate": new_contract.startDate,
                "endDate": new_contract.endDate,
                "landlordName": new_contract.landlordName,
                "landlordId": new_contract.landlordId,
                "landlordPhone": new_contract.landlordPhone,
                "tenantName": new_contract.tenantName,
                "tenantId": new_contract.tenantId,
                "tenantPhone": new_contract.tenantPhone,
                "formattedRent": new_contract.formattedRent,
                "currentDate": new_contract.currentDate
            }
        }), 201


    except Exception as e:
        db.session.rollback()
        print(f"具体错误信息: {str(e)}")
        return jsonify({"message": f"提交合同失败: {str(e)}"}), 500