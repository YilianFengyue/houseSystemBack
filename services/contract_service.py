from models.models import Contract
from exts.db import db
from datetime import datetime

def create_contracts(data):
    """添加新合同"""
    start_date = datetime.fromisoformat(data['startDate'].replace('Z', '+00:00'))
    end_date = datetime.fromisoformat(data['endDate'].replace('Z', '+00:00'))
    current_date = datetime.strptime(data['currentDate'], '%Y-%m-%d')

    # 处理 landlordId 和 tenantId
    landlord_id = data['landlordId'] if data['landlordId'].strip() else None
    tenant_id = data['tenantId'] if data['tenantId'].strip() else None

    contract = Contract(
        rentValue=data['rentValue'],
        purpose=data['purpose'],
        startDate=start_date,
        endDate=end_date,
        landlordName=data['landlordName'],
        landlordId=landlord_id,
        landlordPhone=data['landlordPhone'],
        tenantName=data['tenantName'],
        tenantId=tenant_id,
        tenantPhone=data['tenantPhone'],
        formattedRent=data['formattedRent'],
        currentDate=current_date
    )
    db.session.add(contract)
    db.session.commit()
    return contract