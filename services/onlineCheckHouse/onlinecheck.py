from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime
import json

app = Flask(__name__)
CORS(app)  # 允许跨域请求

# 模拟数据库
appointments_db = []


@app.route('/HouseRent/appointments', methods=['POST'])
def create_appointment():
    try:
        # 获取前端发送的JSON数据
        data = request.get_json()

        # 打印接收到的完整请求数据（调试用）
        print("\n=== 接收到新的预约请求 ===")
        print("请求数据:", json.dumps(data, indent=2, ensure_ascii=False))

        if not data or 'date' not in data:
            print("错误: 请求缺少date参数")
            return jsonify({
                'success': False,
                'message': '缺少必要参数'
            }), 400

        # 格式化日期
        appointment_date = data['date']
        property_info = data.get('property', '未知房产')

        # 打印接收到的日期和房产信息
        print(f"预约日期: {appointment_date}")
        print(f"房产信息: {property_info}")

        # 创建预约记录
        appointment = {
            'id': len(appointments_db) + 1,
            'date': appointment_date,
            'property': property_info,
            'created_at': datetime.now().isoformat()
        }

        appointments_db.append(appointment)

        # 打印成功信息
        print("预约已成功保存到数据库")
        print("当前所有预约记录:", json.dumps(appointments_db, indent=2, ensure_ascii=False))

        return jsonify({
            'success': True,
            'message': '预约日期已保存',
            'data': appointment
        }), 201

    except Exception as e:
        # 打印错误信息
        print(f"处理请求时发生错误: {str(e)}")
        return jsonify({
            'success': False,
            'message': f'服务器错误: {str(e)}'
        }), 500


@app.route('/HouseRent/appointments', methods=['GET'])
def get_appointments():
    # 打印获取所有预约记录的请求
    print("\n=== 接收到获取所有预约的请求 ===")
    print("当前预约数量:", len(appointments_db))
    return jsonify({
        'success': True,
        'data': appointments_db
    })


if __name__ == '__main__':
    print("=== 启动预约服务 ===")
    print("服务地址: http://localhost:5000")
    print("可用端点:")
    print("  POST /HouseRent/appointments - 创建新预约")
    print("  GET /HouseRent/appointments - 获取所有预约")
    app.run(debug=True, port=5000)