# app/utils/response_utils.py
from flask import jsonify


# 仿照您Java示例中的Code类
class Code:
    GET_OK = 200
    SAVE_OK = 201  # RESTful 通常用 201 表示创建成功
    UPDATE_OK = 200
    DELETE_OK = 200  # 或者 204 (No Content)

    BAD_REQUEST = 400
    UNAUTHORIZED = 401
    FORBIDDEN = 403
    NOT_FOUND = 404
    INTERNAL_SERVER_ERROR = 500

    # 可以根据需要添加更多错误码
    GET_ERR = 404  # 或 500
    SAVE_ERR = 400  # 或 500
    UPDATE_ERR = 400  # 或 500
    DELETE_ERR = 400  # 或 500


def success_response(data=None, message="操作成功", code=Code.GET_OK):
    response_dict = {
        "code": code,
        "data": data,
        "message": message,
        "success": True
    }
    if data is None:  # 如果没有数据，可以不返回data字段
        del response_dict["data"]
    return jsonify(response_dict), code


def error_response(message="操作失败", code=Code.BAD_REQUEST, errors=None):
    response_dict = {
        "code": code,
        "message": message,
        "success": False
    }
    if errors:
        response_dict["errors"] = errors
    return jsonify(response_dict), code