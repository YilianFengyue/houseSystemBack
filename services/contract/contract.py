from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime
import json

app = Flask(__name__)
CORS(app)  # 允许跨域

# 模拟数据库存储
contracts_db = []


@app.route('/confirm/contracts', methods=['POST'])
def handle_contract():
    try:
        # 获取前端发送的JSON数据
        data = request.get_json()

        # 验证必要字段
        required_fields = [
            'rentValue', 'purpose', 'startDate', 'endDate'
        ]

        for field in required_fields:
            if field not in data or not data[field]:
                return jsonify({
                    'success': False,
                    'message': f'缺少必要字段: {field}'
                }), 400

        # 添加时间戳
        data['submitted_at'] = datetime.now().isoformat()
        data['contract_id'] = f"CT-{datetime.now().strftime('%Y%m%d%H%M%S')}"

        # 存储到"数据库"
        contracts_db.append(data)

        # 打印到控制台（实际项目应记录到日志）
        print("\n=== 收到新合同 ===")
        print(json.dumps(data, indent=2, ensure_ascii=False))

        return jsonify({
            'success': True,
            'message': '合同保存成功',
            'contract_id': data['contract_id']
        })

    except Exception as e:
        return jsonify({
            'success': False,
            'message': f'服务器错误: {str(e)}'
        }), 500


@app.route('/confirm/contracts', methods=['GET'])
def get_contracts():
    return jsonify({
        'success': True,
        'count': len(contracts_db),
        'data': contracts_db
    })


if __name__ == '__main__':
    app.run(debug=True, port=5000)