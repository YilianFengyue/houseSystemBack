from flask import Flask, request, jsonify, Blueprint
from flask_cors import CORS
import json
from datetime import datetime
from models.models import RepairComplaint  # 导入模型
from extensions import db # 导入数据库实例

repairesubmit_bp=Blueprint('repairesubmit', __name__)

@repairesubmit_bp.route('/repaires', methods=['POST'])
def print_received_data(data):
    """格式化打印接收到的数据"""
    print("\n" + "=" * 50)
    print(f"收到新请求 @ {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("-" * 50)
    print(f"申报类型: {data.get('report_reason', '未知')}")
    print(f"同意条款: {'是' if data.get('agreed_terms') else '否'}")

    if data['report_reason'] == 'repair':
        print("\n[维修申报详情]")
        print(f"房屋地址: {data.get('house_address', '未填写')}")
        print(f"维修类型: {data.get('repair_type', '未选择')}")
        if data.get('repair_type') == '其他维修':
            print(f"维修描述: {data.get('repair_description', '无描述')}")
    elif data['report_reason'] == 'complaint':
        print("\n[投诉提交详情]")
        print(f"投诉对象: {data.get('complaint_person', '未选择')}")
        print(f"投诉内容: {data.get('complaint_content', '无内容')}")

    print("\n[原始数据]")
    print(json.dumps(data, indent=2, ensure_ascii=False))
    print("=" * 50 + "\n")


@repairesubmit_bp.route('/new/repaires', methods=['POST', 'OPTIONS'])
def handle_repair_request():
    if request.method == 'OPTIONS':
        # 对预检请求返回200
        response = jsonify({})
        response.headers.add('Access-Control-Allow-Origin', 'http://localhost:4173')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        return response, 200
    try:
        data = request.get_json()
        print_received_data(data)

        # 验证必要字段
        required_fields = ['report_reason', 'agreed_terms']
        for field in required_fields:
            if field not in data:
                return jsonify({'error': f'缺少必要字段: {field}'}), 400

        # 根据申报类型验证其他字段
        if data['report_reason'] == 'repair':
            if not all(k in data for k in ['house_address', 'repair_type']):
                return jsonify({'error': '维修申报缺少必要字段'}), 400
            if data['repair_type'] == '其他维修' and not data.get('repair_description'):
                return jsonify({'error': '请填写维修描述'}), 400
        elif data['report_reason'] == 'complaint':
            if not all(k in data for k in ['complaint_content', 'complaint_person']):
                return jsonify({'error': '投诉提交缺少必要字段'}), 400

        if not data['agreed_terms']:
            return jsonify({'error': '必须同意条款才能提交'}), 400

        # 创建新记录并保存到数据库
        new_record = RepairComplaint(
            report_reason=data['report_reason'],
            house_address=data.get('house_address', ''),
            repair_type=data.get('repair_type'),
            repair_description=data.get('repair_description', ''),
            complaint_content=data.get('complaint_content', ''),
            complaint_person=data.get('complaint_person', ''),
            agreed_terms=data['agreed_terms']
        )

        db.session.add(new_record)
        db.session.commit()

        return jsonify({
            'status': 'success',
            'message': '报修/投诉提交成功',
            'data': data,
            'record_id': new_record.id  # 返回新创建的记录ID
        }), 200

    except Exception as e:
        db.session.rollback()
        print(f"处理请求时出错: {str(e)}")
        return jsonify({'error': str(e)}), 500
