from flask import Blueprint
from exts.celery import celery
celery_bp = Blueprint("celery", __name__)

@celery.task
def add(x, y):
    try:
        return x + y
    except Exception as e:
        return "错误"
@celery_bp.route('/test-celery', methods=["GET"])
def test_celery():
    result = add.delay(4, 5)
    return f"Celery task ID: {result.id}"

@celery_bp.route('/check-result/<task_id>', methods=["GET"])
def check_result(task_id):
    result = add.AsyncResult(task_id)
    if result.ready():
        return f"Task result: {result.get()}"
    else:
        return "Task is not ready yet."