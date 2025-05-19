from models.models import Repair_Complaint
from exts.db import db
from datetime import datetime

def create_repaires(data):
    """添加新预约"""
    # 将布尔值转换为整数
    data["agreed_terms"] = 1 if data["agreed_terms"] else 0

    # 获取可能为None的值，若为None则设为空字符串
    repair_description = data.get("repair_description") or ""
    complaint_content = data.get("complaint_content") or ""
    complaint_person = data.get("complaint_person") or ""

    repair = Repair_Complaint(
        report_reason=data["report_reason"],
        house_address=data["house_address"],
        repair_type=data["repair_type"],
        repair_description=repair_description,
        complaint_content=complaint_content,
        complaint_person=complaint_person,
        agreed_terms=data["agreed_terms"],
        create_at=data["create_at"],
    )
    db.session.add(repair)
    db.session.commit()
    return repair