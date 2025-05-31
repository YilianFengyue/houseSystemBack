from exts.db import db
from models.models import Rental
from datetime import datetime

def get_rental_by_tenant_username(tenant_username):
    return db.session.query(Rental).filter_by(tenant_username=tenant_username).all()

def get_rental_by_landlord_username(landlord_username):
    return db.session.query(Rental).filter_by(landlord_username=landlord_username).first()

def create_rental(data):
    current_date = datetime.strptime(data['currentDate'], '%Y-%m-%d')
    rental = Rental(
        tenant_username=data['tenantName'],
        landlord_username=data['landlordName'],
        house_id=data['houseid'],
        currentDate=current_date
    )
    db.session.add(rental)
    db.session.commit()
    return rental