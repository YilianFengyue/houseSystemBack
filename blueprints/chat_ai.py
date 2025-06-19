from flask import Blueprint, request, current_app, jsonify
import openai
import json
import re
from sqlalchemy import and_, or_
from models.house_model import HouseInfo
from exts.db import db
from utils.response_utils import success_response, error_response, Code
from decorators.decorators import token_required

chat_ai_bp = Blueprint('chat_ai', __name__, url_prefix='/chat-ai')

class HouseRecommendationBot:
    def __init__(self):
        self.house_search_functions = [
            {
                "name": "search_houses_by_criteria",
                "description": "根据用户提供的条件搜索房源，支持价格、区域、面积、房间数量等条件",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "min_price": {
                            "type": "integer",
                            "description": "最低价格（元/月）"
                        },
                        "max_price": {
                            "type": "integer", 
                            "description": "最高价格（元/月）"
                        },
                        "region": {
                            "type": "string",
                            "description": "区域，如：雨花、岳麓、天心等"
                        },
                        "min_area": {
                            "type": "number",
                            "description": "最小面积（平方米）"
                        },
                        "max_area": {
                            "type": "number",
                            "description": "最大面积（平方米）"
                        },
                        "rooms": {
                            "type": "string",
                            "description": "房间配置，如：1室1厅、2室1厅、3室2厅等"
                        },
                        "rent_type": {
                            "type": "string",
                            "description": "租赁类型：整租 或 合租"
                        },
                        "subway": {
                            "type": "boolean",
                            "description": "是否需要近地铁"
                        },
                        "decoration": {
                            "type": "string",
                            "description": "装修情况：精装、简装、毛坯等"
                        }
                    }
                }
            },
            {
                "name": "get_house_details",
                "description": "获取特定房源的详细信息",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "house_id": {
                            "type": "integer",
                            "description": "房源ID"
                        }
                    },
                    "required": ["house_id"]
                }
            },
            {
                "name": "get_popular_houses",
                "description": "获取热门房源（按浏览量排序）",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "limit": {
                            "type": "integer",
                            "description": "返回的房源数量，默认10个",
                            "default": 10
                        }
                    }
                }
            }
        ]

    def search_houses_by_criteria(self, **kwargs):
        """根据条件搜索房源"""
        try:
            query = db.session.query(HouseInfo).filter(HouseInfo.available == 1)
            
            # 价格筛选
            if kwargs.get('min_price'):
                query = query.filter(HouseInfo.price >= kwargs['min_price'])
            if kwargs.get('max_price'):
                query = query.filter(HouseInfo.price <= kwargs['max_price'])
            
            # 区域筛选
            if kwargs.get('region'):
                query = query.filter(HouseInfo.region.like(f"%{kwargs['region']}%"))
            
            # 面积筛选
            if kwargs.get('min_area'):
                query = query.filter(HouseInfo.area >= kwargs['min_area'])
            if kwargs.get('max_area'):
                query = query.filter(HouseInfo.area <= kwargs['max_area'])
            
            # 房间配置筛选
            if kwargs.get('rooms'):
                query = query.filter(HouseInfo.rooms.like(f"%{kwargs['rooms']}%"))
            
            # 租赁类型筛选
            if kwargs.get('rent_type'):
                query = query.filter(HouseInfo.rent_type == kwargs['rent_type'])
            
            # 地铁筛选
            if kwargs.get('subway'):
                query = query.filter(HouseInfo.subway == 1)
            
            # 装修情况筛选
            if kwargs.get('decoration'):
                query = query.filter(HouseInfo.decoration.like(f"%{kwargs['decoration']}%"))
            
            # 限制返回数量并按价格排序
            houses = query.order_by(HouseInfo.price.asc()).limit(20).all()
            
            return {
                "success": True,
                "houses": [house.to_dict() for house in houses],
                "count": len(houses)
            }
        except Exception as e:
            current_app.logger.error(f"Search houses error: {e}")
            return {"success": False, "error": str(e)}

    def get_house_details(self, house_id):
        """获取房源详细信息"""
        try:
            house = db.session.query(HouseInfo).filter(HouseInfo.id == house_id).first()
            if house:
                return {
                    "success": True,
                    "house": house.to_dict()
                }
            else:
                return {"success": False, "error": "房源不存在"}
        except Exception as e:
            current_app.logger.error(f"Get house details error: {e}")
            return {"success": False, "error": str(e)}

    def get_popular_houses(self, limit=10):
        """获取热门房源"""
        try:
            houses = db.session.query(HouseInfo)\
                .filter(HouseInfo.available == 1)\
                .order_by(HouseInfo.page_views.desc())\
                .limit(limit).all()
            
            return {
                "success": True,
                "houses": [house.to_dict() for house in houses],
                "count": len(houses)
            }
        except Exception as e:
            current_app.logger.error(f"Get popular houses error: {e}")
            return {"success": False, "error": str(e)}

    def execute_function_call(self, function_name, arguments):
        """执行函数调用"""
        if function_name == "search_houses_by_criteria":
            return self.search_houses_by_criteria(**arguments)
        elif function_name == "get_house_details":
            return self.get_house_details(arguments['house_id'])
        elif function_name == "get_popular_houses":
            return self.get_popular_houses(arguments.get('limit', 10))
        else:
            return {"success": False, "error": f"未知的函数: {function_name}"}

# 创建房产推荐机器人实例
house_bot = HouseRecommendationBot()

@chat_ai_bp.route('/chat', methods=['POST'])
def chat_with_ai():
    """智能房产推荐聊天接口"""
    try:
        data = request.get_json()
        user_message = data.get('message', '')
        chat_history = data.get('history', [])
        api_key = data.get('api_key', '')
        model = data.get('model', 'gpt-3.5-turbo')
        
        if not user_message:
            return error_response(code=Code.BAD_REQUEST, message="消息内容不能为空")
        
        if not api_key:
            return error_response(code=Code.BAD_REQUEST, message="API Key不能为空")
        
        # 设置OpenAI配置
        openai.api_key = api_key
        
        # 构建消息历史
        messages = [
            {
                "role": "system",
                "content": """你是一个专业的房产推荐助手。你可以帮助用户：
1. 根据预算、位置、面积等需求推荐合适的房源
2. 查询特定房源的详细信息
3. 提供热门房源推荐
4. 回答房产相关的问题

当用户询问房源信息时，请使用提供的函数来查询数据库。
在推荐房源时，请考虑用户的具体需求，如价格范围、区域偏好、房间数量等。
请用友好、专业的语调与用户交流。"""
            }
        ]
        
        # 添加聊天历史
        messages.extend(chat_history)
        
        # 添加当前用户消息
        messages.append({
            "role": "user", 
            "content": user_message
        })
        
        # 调用OpenAI API
        response = openai.ChatCompletion.create(
            model=model,
            messages=messages,
            functions=house_bot.house_search_functions,
            function_call="auto",
            temperature=0.7,
            max_tokens=1000
        )
        
        message = response.choices[0].message
        
        # 检查是否需要调用函数
        if message.get("function_call"):
            function_name = message["function_call"]["name"]
            function_args = json.loads(message["function_call"]["arguments"])
            
            # 执行函数调用
            function_result = house_bot.execute_function_call(function_name, function_args)
            
            # 将函数结果添加到消息历史
            messages.append({
                "role": "assistant",
                "content": None,
                "function_call": message["function_call"]
            })
            messages.append({
                "role": "function",
                "name": function_name,
                "content": json.dumps(function_result, ensure_ascii=False)
            })
            
            # 再次调用API生成最终回复
            final_response = openai.ChatCompletion.create(
                model=model,
                messages=messages,
                temperature=0.7,
                max_tokens=1000
            )
            
            ai_reply = final_response.choices[0].message.content
        else:
            ai_reply = message.content
        
        return success_response(
            code=Code.GET_OK,
            data={
                "reply": ai_reply,
                "function_called": message.get("function_call") is not None
            },
            message="对话成功"
        )
        
    except Exception as e:
        current_app.logger.error(f"Chat AI error: {e}")
        return error_response(
            code=Code.INTERNAL_SERVER_ERROR,
            message=f"AI对话失败: {str(e)}"
        )

@chat_ai_bp.route('/houses/search', methods=['POST'])
def search_houses():
    """直接搜索房源接口"""
    try:
        data = request.get_json()
        result = house_bot.search_houses_by_criteria(**data)
        
        if result['success']:
            return success_response(
                code=Code.GET_OK,
                data=result,
                message="房源搜索成功"
            )
        else:
            return error_response(
                code=Code.INTERNAL_SERVER_ERROR,
                message=result['error']
            )
    except Exception as e:
        current_app.logger.error(f"Search houses API error: {e}")
        return error_response(
            code=Code.INTERNAL_SERVER_ERROR,
            message=f"搜索失败: {str(e)}"
        )

@chat_ai_bp.route('/houses/<int:house_id>', methods=['GET'])
def get_house_detail(house_id):
    """获取房源详情接口"""
    try:
        result = house_bot.get_house_details(house_id)
        
        if result['success']:
            return success_response(
                code=Code.GET_OK,
                data=result,
                message="获取房源详情成功"
            )
        else:
            return error_response(
                code=Code.NOT_FOUND,
                message=result['error']
            )
    except Exception as e:
        current_app.logger.error(f"Get house detail API error: {e}")
        return error_response(
            code=Code.INTERNAL_SERVER_ERROR,
            message=f"获取详情失败: {str(e)}"
        )

@chat_ai_bp.route('/houses/popular', methods=['GET'])
def get_popular_houses():
    """获取热门房源接口"""
    try:
        limit = request.args.get('limit', 10, type=int)
        result = house_bot.get_popular_houses(limit)
        
        if result['success']:
            return success_response(
                code=Code.GET_OK,
                data=result,
                message="获取热门房源成功"
            )
        else:
            return error_response(
                code=Code.INTERNAL_SERVER_ERROR,
                message=result['error']
            )
    except Exception as e:
        current_app.logger.error(f"Get popular houses API error: {e}")
        return error_response(
            code=Code.INTERNAL_SERVER_ERROR,
            message=f"获取热门房源失败: {str(e)}"
        ) 