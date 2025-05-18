from models.models import Appointment
from extensions import db
from datetime import datetime

def create_appointments(data):
    """添加新预约"""
    appointment = Appointment(
        username=data['username'],
        property=data['property'],
        time=data['time'],
    )
    db.session.add(appointment)
    db.session.commit()
    return appointment