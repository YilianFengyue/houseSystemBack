# app/routes/house_info_routes.py
from flask import Blueprint, request, current_app
from sqlalchemy import or_

from models.house_model import HouseInfo  # , SessionLocal # 如果不使用Flask-SQLAlchemy
from utils.response_utils import success_response, error_response, Code
from sqlalchemy.exc import SQLAlchemyError
import datetime

# 如果使用 Flask-SQLAlchemy
from exts import db

house_info_bp = Blueprint('houseinfo', __name__,url_prefix="/houseinfo")


def get_db_session():

    return db.session
#1.1房源总数接口
@house_info_bp.route('/houseNums', methods=['GET'])
def get_housenums():
    house_total_num=HouseInfo.query.count()
    return success_response(house_total_num)

#1.2热点房源
@house_info_bp.route('/hotLists', methods=['GET'])
def get_hotlists():
    house_hot_List=HouseInfo.query.order_by(HouseInfo.page_views.desc()).limit(4).all()

    return success_response( [a.to_dict() for a in house_hot_List])
#1.3最新房源
@house_info_bp.route('/newLists', methods=['GET'])
def get_newlists():
    house_info_num=HouseInfo.query.count()
    #获取前六条数据
    house_new_list=HouseInfo.query.order_by(HouseInfo.publish_time.desc()).limit(4).all()
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
@house_info_bp.route('/', methods=['GET'])
def get_all_house_infos():
    session = get_db_session()
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 10, type=int)  # 每页数量，前端可控

        # 构建查询
        query = session.query(HouseInfo)

        # ----- 智能搜索/过滤条件 -----
        # 按地区搜索 (改进以支持逗号分隔的多选 "OR" 逻辑)
        if 'region' in request.args and request.args['region']:
            regions_to_filter = [r.strip() for r in request.args['region'].split(',') if r.strip()]
            if regions_to_filter:
                region_conditions = [HouseInfo.region.ilike(f"%{r}%") for r in regions_to_filter]
                query = query.filter(or_(*region_conditions))

        if 'block' in request.args and request.args['block']:  # block 通常是单选或作为 community 搜索的一部分
            query = query.filter(HouseInfo.block.ilike(f"%{request.args['block']}%"))

        if 'community' in request.args and request.args['community']:  # 主搜索框
            # 如果希望 community 搜索也覆盖区域和版块，需要更复杂的 OR 逻辑
            query = query.filter(HouseInfo.community.ilike(f"%{request.args['community']}%"))

        # 按户型搜索 (改进以支持逗号分隔的多选 "OR" 逻辑)
        if 'rooms' in request.args and request.args['rooms']:
            # room_types = [r.strip() for r in request.args['rooms'].split(',') if r.strip()]
            # if room_types:
            #     room_conditions = [HouseInfo.rooms.ilike(f"%{rt}%") for rt in room_types]
            #     query = query.filter(or_(*room_conditions))
            # 前端传来的可能是 "一居,两居,四居+" 这样的字符串
            raw_room_filters = [r.strip() for r in request.args['rooms'].split(',') if r.strip()]

            if raw_room_filters:
                # 用于收集所有有效的户型查询条件
                # 例如，如果用户选了 "一居" 和 "三居"，这里会包含两个查询条件
                # 这两个条件最终会用 OR 连接起来
                individual_room_type_conditions = []

                for room_filter_text in raw_room_filters:
                    if room_filter_text == '一居':
                        # 精确匹配以 "1室" 开头的房源
                        individual_room_type_conditions.append(HouseInfo.rooms.ilike("1室%"))
                    elif room_filter_text == '两居':
                        individual_room_type_conditions.append(HouseInfo.rooms.ilike("2室%"))
                    elif room_filter_text == '三居':
                        individual_room_type_conditions.append(HouseInfo.rooms.ilike("3室%"))
                    elif room_filter_text == '四居':
                        individual_room_type_conditions.append(HouseInfo.rooms.ilike("4室%"))
                    elif room_filter_text == '四居+':
                        # "四居+" 表示4室及以上
                        # 我们需要构建一个 OR 条件列表来匹配 "4室", "5室", ..., "9室" (或你认为合理的上限)
                        # 假设房源不太可能超过9室，如果超过，可以调整上限
                        # 也可以考虑更高级的查询方式，如正则表达式，但 ilike 更通用
                        plus_conditions = []
                        for i in range(4, 10):  # 匹配 4室, 5室, 6室, 7室, 8室, 9室
                            plus_conditions.append(HouseInfo.rooms.ilike(f"{i}室%"))

                        if plus_conditions:  # 如果生成了条件 (这里总是会的)
                            # 将 "4室" OR "5室" OR ... 作为一个整体条件添加到列表中
                            individual_room_type_conditions.append(or_(*plus_conditions))
                    # else:
                    # 如果前端可能发送数字 (如 "1", "2"), 也可以在这里处理
                    # elif room_filter_text.isdigit():
                    #     individual_room_type_conditions.append(HouseInfo.rooms.ilike(f"{room_filter_text}室%"))
                    # 当前端固定发送中文描述，此else分支可以省略

                if individual_room_type_conditions:
                    # 将所有选中的户型条件用 OR 连接起来
                    # 例如 (HouseInfo.rooms.ilike("1室%")) OR (HouseInfo.rooms.ilike("3室%"))
                    query = query.filter(or_(*individual_room_type_conditions))

        # 按朝向搜索 (新增，并支持逗号分隔的多选 "OR" 逻辑)
        # 假设 HouseInfo 模型中有 'direction' 字段存储朝向信息
        if 'orientation' in request.args and request.args['orientation']:
            orientations_to_filter = [o.strip() for o in request.args['orientation'].split(',') if o.strip()]
            if orientations_to_filter:
                orientation_conditions = [HouseInfo.direction.ilike(f"%{o}%") for o in orientations_to_filter]
                query = query.filter(or_(*orientation_conditions))

        # 按价格范围
        if 'min_price' in request.args:
            try:
                query = query.filter(HouseInfo.price >= int(request.args['min_price']))
            except ValueError:
                pass  # 或者返回错误
        if 'max_price' in request.args:
            try:
                query = query.filter(HouseInfo.price <= int(request.args['max_price']))
            except ValueError:
                pass  # 或者返回错误

        # 按租赁方式
        if 'rent_type' in request.args and request.args['rent_type']:  # Ensure not empty string
            query = query.filter(HouseInfo.rent_type == request.args['rent_type'])

        # 按是否近地铁 (假设 1=是, 0=否)
        if 'subway' in request.args:  # 后端接收的是字符串 '0' 或 '1'
            try:
                subway_val = int(request.args['subway'])
                if subway_val in [0, 1]:
                    query = query.filter(HouseInfo.subway == subway_val)
            except ValueError:
                pass  # 或者返回错误

        # 按装修情况
        if 'decoration' in request.args and request.args['decoration']:
            query = query.filter(HouseInfo.decoration.ilike(f"%{request.args['decoration']}%"))

        # 按房源状态 (available)
        if 'available' in request.args:
            try:
                available_val = int(request.args['available'])
                if available_val in [0, 1]:
                    query = query.filter(HouseInfo.available == available_val)
            except ValueError:
                pass

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

