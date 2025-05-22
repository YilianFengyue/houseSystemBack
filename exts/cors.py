from flask_cors import CORS

cors = CORS(
resources={r"/*": {  # 匹配所有路由
        "origins": "*",  # 允许所有来源（生产环境建议指定具体域名）
        "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],  # 明确允许 OPTIONS 方法
        "allow_headers": ["Content-Type", "Authorization"],
        "redirect": False  # 禁止预检请求重定向（可选，部分场景需要）
    }}
)