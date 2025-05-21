from flask_socketio import SocketIO

socketio = SocketIO(cors_allowed_origins="*")  # 允许所有域名跨域访问
