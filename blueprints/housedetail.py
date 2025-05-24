# In (e.g.) your_app/blueprints/housedetail_blueprint.py
from flask import Blueprint, request, current_app
from sqlalchemy.exc import IntegrityError, SQLAlchemyError
from models.house_detail_model import HouseDetail
from models.house_model import HouseInfo
from exts import db
from utils.response_utils import success_response, error_response, Code
from services.housedetil_service import get_house_detail_by_house_info_id
# End Placeholder

housedetail_bp = Blueprint('housedetail_bp', __name__, url_prefix='/housedetail')

@housedetail_bp.route('/', methods=['POST'])
def add_house_detail():
    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    required_fields = ['house_info_id', 'photos', 'facilities', 'map_coordinates']
    for field in required_fields:
        if field not in data:

            if data.get(field) is None:  # Allowing empty lists/dicts but not None if field is present
                return error_response(f"字段 {field} 不能为空", code=Code.BAD_REQUEST)


    house_info_id = data.get('house_info_id')

    # Basic validation for data types (can be more robust)
    if not isinstance(house_info_id, int):
        return error_response("house_info_id 必须是整数", code=Code.BAD_REQUEST)
    if 'photos' in data and not isinstance(data['photos'], list):
        return error_response("photos 必须是列表 (list of URLs)", code=Code.BAD_REQUEST)
    if 'facilities' in data and not isinstance(data['facilities'], dict):
        return error_response("facilities 必须是字典 (object)", code=Code.BAD_REQUEST)
    if 'map_coordinates' in data and not isinstance(data['map_coordinates'], dict):
        return error_response("map_coordinates 必须是字典 (object)", code=Code.BAD_REQUEST)

    session = db.session  # Assuming Flask-SQLAlchemy's db.session

    try:
        # 1. Check if HouseInfo exists
        house_info_exists = session.query(HouseInfo).filter_by(id=house_info_id).first()
        if not house_info_exists:
            return error_response(f"ID为 {house_info_id} 的房源基础信息不存在", code=Code.NOT_FOUND)

        # 2. Check if detail already exists (due to UNIQUE constraint on house_info_id)
        # The DB will raise IntegrityError, but a pre-check is friendlier.
        existing_detail = session.query(HouseDetail).filter_by(house_info_id=house_info_id).first()
        if existing_detail:
            return error_response(f"ID为 {house_info_id} 的房源已有详细信息，请使用更新接口", code=Code.INTERNAL_SERVER_ERROR)

        new_detail_data = {
            'house_info_id': house_info_id,
            'photos': data.get('photos'),  # Can be None if not provided and field is nullable
            'facilities': data.get('facilities'),
            'map_coordinates': data.get('map_coordinates')
        }

        new_detail = HouseDetail(**new_detail_data)
        session.add(new_detail)
        session.commit()
        session.refresh(new_detail)
        return success_response(data=new_detail.to_dict(), message="房源详细信息添加成功", code=Code.SAVE_OK)
    except IntegrityError as e:  # Catches UNIQUE constraint violation if pre-check fails or is racy
        session.rollback()
        current_app.logger.error(f"添加房源详情失败 - 数据库完整性冲突: {e}")
        return error_response(f"无法添加详情：可能该房源已有详情记录或 house_info_id 无效。", code=Code.INTERNAL_SERVER_ERROR)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"添加房源详情失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        session.rollback()
        current_app.logger.error(f"添加房源详情时发生未知错误: {e}")
        return error_response(f"添加房源详情失败: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)


@housedetail_bp.route('/<int:house_info_id>', methods=['GET'])
def get_house_detail_by_house_id(house_info_id):
    # session = db.session
    try:
        # detail = session.query(HouseDetail).filter_by(house_info_id=house_info_id).first()
        detail = get_house_detail_by_house_info_id(house_info_id)
        print(detail)
        if detail:
            return success_response(data=detail.to_dict(), message="获取成功", code=Code.GET_OK)
        else:
            return error_response("未找到该房源的详细信息", code=Code.NOT_FOUND)
    except SQLAlchemyError as e:
        current_app.logger.error(f"查询房源详情失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)

