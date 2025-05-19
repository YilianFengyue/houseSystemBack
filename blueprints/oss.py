#
# from datetime import datetime, timezone # 确保 timezone 也被导入
# from flask import Flask, jsonify # request 在此函数中不需要
# import time, base64, hmac, hashlib
# # import oss2 # oss2 在此代码段未直接使用
# from flask import Blueprint # request, current_app 在此代码段未直接使用
#
# app = Flask(__name__)
#
# # 确保替换为你的实际凭证和存储桶名称
# ACCESS_KEY_ID = ""
# ACCESS_KEY_SECRET = "q"
# BUCKET_NAME = ""
#
# ENDPOINT = 'oss-cn-hangzhou.aliyuncs.com' # 根据你的 Bucket 所在地可能需要修改
# HOST = f'https://{BUCKET_NAME}.{ENDPOINT}'
# EXPIRE_TIME = 30  # 签名过期时间（秒）
#
# # 1. 定义蓝图 oss_bp，并设置了 URL 前缀 /oss
# oss_bp = Blueprint('oss', __name__, url_prefix="/oss")
#
# # 2. 使用蓝图的路由装饰器 @oss_bp.route('/')
# # 这意味着此路由的完整路径将是 /oss/ (蓝图前缀 + 路由相对路径)
# @oss_bp.route('/', methods=['GET'])
# def get_policy():
#     # 确保 ACCESS_KEY_ID, ACCESS_KEY_SECRET, BUCKET_NAME 已被正确赋值
#     if not all([ACCESS_KEY_ID, ACCESS_KEY_SECRET, BUCKET_NAME]) or \
#        ACCESS_KEY_ID == "YOUR_ACCESS_KEY_ID": # 简单检查是否还是占位符
#         return jsonify({"error": "Server configuration missing for OSS credentials."}), 500
#
#     now = int(time.time())
#     expire_end = now + EXPIRE_TIME
#     # expiration = time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime(expire_end))
#     # OSS Policy 中 expiration 字段的格式通常是 ISO8601 UTC 时间，例如 '2025-05-19T12:00:00.000Z'
#     # time.gmtime(expire_end) 生成的时间元组不包含毫秒，strftime 格式化后也不包含 'Z'
#     # 更精确的格式化：
#     dt_obj = datetime.datetime.fromtimestamp(expire_end, datetime.timezone.utc)
#     expiration = dt_obj.isoformat(timespec='milliseconds').replace('+00:00', 'Z')
#
#
#     policy_dict = {
#         "expiration": expiration,
#         "conditions": [
#             ["content-length-range", 0, 1048576000],  # 例如：最大1GB，原为100MB
#             ["starts-with", "$key", "uploads/"] # 文件将上传到 bucket 的 uploads/ 目录下
#         ]
#     }
#
#     policy = base64.b64encode(str(policy_dict).encode('utf-8')).decode('utf-8')
#     # 阿里云OSS签名文档通常指明 policy 是 utf-8 编码后再进行 base64 编码
#     # policy_json_str = json.dumps(policy_dict)
#     # policy = base64.b64encode(policy_json_str.encode('utf-8')).decode('utf-8')
#
#
#     signature_payload = ACCESS_KEY_SECRET.encode('utf-8')
#     policy_to_sign = policy.encode('utf-8')
#
#     h = hmac.new(signature_payload, policy_to_sign, hashlib.sha1)
#     signature = base64.b64encode(h.digest()).decode('utf-8')
#
#
#     return jsonify({
#         'accessid': ACCESS_KEY_ID,
#         'host': HOST,
#         'policy': policy,
#         'signature': signature,
#         'expire': expire_end, # 前端通常使用这个 Unix 时间戳来判断签名是否过期
#         'dir': 'uploads/' # 告诉前端上传的目标目录
#     })
#
# # 3. 将蓝图注册到 app 实例
# # app.register_blueprint(oss_bp)
#
# # if __name__ == '__main__':
# #     # 确保在运行前替换掉 YOUR_ACCESS_KEY_ID, YOUR_ACCESS_KEY_SECRET, YOUR_BUCKET_NAME
# #     if BUCKET_NAME == "YOUR_BUCKET_NAME" or \
# #        ACCESS_KEY_ID == "YOUR_ACCESS_KEY_ID" or \
# #        ACCESS_KEY_SECRET == "YOUR_ACCESS_KEY_SECRET":
# #         print("警告：请在代码中填入你的阿里云 OSS Access Key ID, Secret 和 Bucket Name！")
# #         # exit(1) # 可以选择在此处退出，防止以无效配置启动
# #
# #     app.run(debug=True) # debug=True 方便开发调试