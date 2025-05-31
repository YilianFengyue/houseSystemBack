from flask import Blueprint, request, jsonify
from utils.response_utils import success_response, error_response
from services.rental_service import get_rental_by_tenant_username, get_rental_by_landlord_username
from services.house_info_service import get_house_by_id
from services.contract_service import get_contract_by_landlordId
rental_bp = Blueprint("rental", __name__)

# 获得某租客的所有租房记录
@rental_bp.route("/rental/tenants/<string:tenant_username>", methods=["GET"])
def get_rental_by_tenant(tenant_username):
    try:
        rentals = get_rental_by_tenant_username(tenant_username)
        data = []

        if rentals:
            for a in rentals:
                contract = get_contract_by_landlordId(a.to_dict().get("house_id"))
                house = get_house_by_id(a.to_dict().get("house_id"))

                b = a.to_dict()
                b["purpose"] = contract.to_dict()["purpose"]
                b["startDate"] = contract.to_dict()["startDate"]
                b["endDate"] = contract.to_dict()["endDate"]
                b["title"] = house.to_dict()["title"]
                b["region"] = house.to_dict()["region"]
                b["landlordPhone"] = contract.to_dict()["landlordPhone"]
                b["rentValue"] = contract.to_dict()["rentValue"]
                data.append(b)

            return success_response(data, message="获取租房信息成功", code=200)

        return error_response("不存在该用户的租房记录", code=404)

    except Exception as e:
        return error_response("运行错误", code=500)