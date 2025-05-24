# app/routes/house_info_routes.py
from flask import Blueprint, request, current_app
from models.house_model import HouseInfo  # , SessionLocal # 如果不使用Flask-SQLAlchemy
from utils.response_utils import success_response, error_response, Code
from sqlalchemy.exc import SQLAlchemyError
import datetime
# 如果使用 Flask-SQLAlchemy
from exts import db
from services.house_info_service import get_housenum, get_house_hot_list, get_house_new_list

house_info_bp = Blueprint('houseinfo', __name__,url_prefix="/houseinfo")

def get_db_session():

    return db.session
#1.1房源总数接口
@house_info_bp.route('/houseNums', methods=['GET'])
def get_housenums():
    house_total_num=get_housenum()
    return success_response(house_total_num)

#1.2热点房源
@house_info_bp.route('/hotLists', methods=['GET'])
def get_hotlists():
    # house_hot_List=HouseInfo.query.order_by(HouseInfo.page_views.desc()).limit(4).all()
    house_hot_List = get_house_hot_list()
    return success_response( [a.to_dict() for a in house_hot_List])

#1.3最新房源
@house_info_bp.route('/newLists', methods=['GET'])
def get_newlists():
    house_info_num=get_housenum()
    #获取前六条数据
    # house_new_list=HouseInfo.query.order_by(HouseInfo.publish_time.desc()).limit(6).all()
    house_new_list=get_house_new_list()
    return success_response([a.to_dict() for a in house_new_list])


# 1. 新增房源信息 (对应房东发布房源)
@house_info_bp.route('/', methods=['POST'])
def add_house_info():
    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    # 基本的数据校验 (可以做得更完善，例如使用 Pydantic)
    required_fields = ['title', 'region', 'community', 'area', 'rooms', 'price', 'rent_type']
    for field in required_fields:
        if field not in data or data[field] is None:  # 确保字段存在且不为None (除非模型允许)
            return error_response(f"缺少必填字段: {field}", code=Code.BAD_REQUEST)

    # 处理日期
    if 'publish_time' in data and isinstance(data['publish_time'], str):
        try:
            data['publish_time'] = datetime.date.fromisoformat(data['publish_time'])
        except ValueError:
            return error_response("日期格式错误，应为 YYYY-MM-DD", code=Code.BAD_REQUEST)
    elif 'publish_time' not in data:  # 如果前端不传，可以设置为当前日期
        data['publish_time'] = datetime.date.today()

    # 处理布尔型字段 (TINYINT(1))
    bool_fields = ['subway', 'available', 'tag_new']
    for field in bool_fields:
        if field in data:
            data[field] = 1 if data[field] else 0
        # else: # 如果前端不传，模型中的server_default会生效
        #     data[field] = HouseInfo.__table__.columns[field].server_default.arg.text.strip("'") # 获取默认值

    new_house = HouseInfo(**data)

    session = get_db_session()
    try:
        session.add(new_house)
        session.commit()
        session.refresh(new_house)  # 获取自动生成的ID等
        return success_response(data=new_house.to_dict(), message="房源信息添加成功", code=Code.SAVE_OK)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"添加房源失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        session.rollback()
        current_app.logger.error(f"添加房源时发生未知错误: {e}")
        return error_response(f"添加房源失败: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)


# 2. 查询所有房源信息 / 搜索房源 (对应房源展示首页和搜索)
@house_info_bp.route('', methods=['GET'])
def get_all_house_infos():
    session = get_db_session()
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 10, type=int)  # 每页数量，前端可控

        # 构建查询
        query = session.query(HouseInfo)

        # ----- 智能搜索/过滤条件 -----
        # 按地区搜索
        if 'region' in request.args:
            query = query.filter(HouseInfo.region.ilike(f"%{request.args['region']}%"))
        if 'block' in request.args:
            query = query.filter(HouseInfo.block.ilike(f"%{request.args['block']}%"))
        if 'community' in request.args:
            query = query.filter(HouseInfo.community.ilike(f"%{request.args['community']}%"))

        # 按户型搜索
        if 'rooms' in request.args:
            query = query.filter(HouseInfo.rooms.ilike(f"%{request.args['rooms']}%"))

        # 按价格范围
        if 'min_price' in request.args:
            query = query.filter(HouseInfo.price >= int(request.args['min_price']))
        if 'max_price' in request.args:
            query = query.filter(HouseInfo.price <= int(request.args['max_price']))

        # 按租赁方式
        if 'rent_type' in request.args:
            query = query.filter(HouseInfo.rent_type == request.args['rent_type'])

        # 按是否近地铁 (假设 1=是, 0=否)
        if 'subway' in request.args:
            query = query.filter(HouseInfo.subway == (1 if request.args['subway'].lower() in ['true', '1'] else 0))

        # 按装修情况
        if 'decoration' in request.args:
            query = query.filter(HouseInfo.decoration.ilike(f"%{request.args['decoration']}%"))

        # 按房源状态 (available)
        if 'available' in request.args:
            query = query.filter(
                HouseInfo.available == (1 if request.args['available'].lower() in ['true', '1'] else 0))

        # 排序 (例如按发布时间降序)
        query = query.order_by(HouseInfo.publish_time.desc(), HouseInfo.id.desc())

        # 分页
        total_count = query.count()  # 获取过滤后的总数
        paginated_houses = query.paginate(page=page, per_page=per_page, error_out=False)
        house_list = [house.to_dict() for house in paginated_houses.items]

        response_data = {
            "items": house_list,
            "total": total_count,
            "page": page,
            "per_page": per_page,
            "pages": paginated_houses.pages
        }

        if not house_list and page == 1:  # 如果第一页就没有数据
            return success_response(data=response_data, message="暂无房源信息", code=Code.GET_OK)  # 仍然是成功，只是数据为空

        return success_response(data=response_data, message="查询成功", code=Code.GET_OK)

    except SQLAlchemyError as e:
        current_app.logger.error(f"查询房源失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        current_app.logger.error(f"查询房源时发生未知错误: {e}")
        return error_response(f"查询房源失败: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)


# 3. 查询单个房源信息 (对应点击查看房源详情)
@house_info_bp.route('/<int:house_id>', methods=['GET'])
def get_house_info_by_id(house_id):
    session = get_db_session()
    try:
        house = session.get(HouseInfo, house_id)  # SQLAlchemy 2.0 style
        # 或者 house = session.query(HouseInfo).filter_by(id=house_id).first()
        if house:
            return success_response(data=house.to_dict(), code=Code.GET_OK)
        else:
            return error_response("房源信息未找到", code=Code.NOT_FOUND)
    except SQLAlchemyError as e:
        current_app.logger.error(f"查询房源 {house_id} 失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)


# 4. 更新房源信息 (对应房东编辑房源)
@house_info_bp.route('/<int:house_id>', methods=['PUT'])
def update_house_info(house_id):
    session = get_db_session()
    house = session.get(HouseInfo, house_id)
    if not house:
        return error_response("房源信息未找到", code=Code.NOT_FOUND)

    data = request.get_json()
    if not data:
        return error_response("请求体不能为空", code=Code.BAD_REQUEST)

    try:
        for key, value in data.items():
            if hasattr(house, key) and key != 'id':  # 不允许修改id
                if key == 'publish_time' and isinstance(value, str):
                    try:
                        value = datetime.date.fromisoformat(value)
                    except ValueError:
                        return error_response("日期格式错误，应为 YYYY-MM-DD", code=Code.BAD_REQUEST)
                elif key in ['subway', 'available', 'tag_new'] and isinstance(value, bool):
                    value = 1 if value else 0

                setattr(house, key, value)

        session.commit()
        return success_response(data=house.to_dict(), message="房源信息更新成功", code=Code.UPDATE_OK)
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"更新房源 {house_id} 失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)
    except Exception as e:
        session.rollback()
        current_app.logger.error(f"更新房源 {house_id} 时发生未知错误: {e}")
        return error_response(f"更新房源失败: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)


# 5. 删除房源信息 (对应房东删除房源)
@house_info_bp.route('/<int:house_id>', methods=['DELETE'])
def delete_house_info(house_id):
    session = get_db_session()
    house = session.get(HouseInfo, house_id)
    if not house:
        return error_response("房源信息未找到", code=Code.NOT_FOUND)

    try:
        session.delete(house)
        session.commit()
        return success_response(message="房源信息删除成功", code=Code.DELETE_OK)  # 或者返回204, data=None
    except SQLAlchemyError as e:
        session.rollback()
        current_app.logger.error(f"删除房源 {house_id} 失败: {e}")
        return error_response(f"数据库错误: {str(e)}", code=Code.INTERNAL_SERVER_ERROR)



@house_info_bp.route('/<int:house_id>/upload_image', methods=['POST'])
def upload_house_image(house_id):
    session = get_db_session()
    house = session.get(HouseInfo, house_id)
    if not house:
        return error_response("房源信息未找到", code=Code.NOT_FOUND)

    if 'file' not in request.files:
        return error_response("缺少文件部分", code=Code.BAD_REQUEST)

    file = request.files['file']
    if file.filename == '':
        return error_response("未选择文件", code=Code.BAD_REQUEST)

    if file:

        return error_response("文件上传功能暂未完全实现，仅为示例接口", code=Code.INTERNAL_SERVER_ERROR)