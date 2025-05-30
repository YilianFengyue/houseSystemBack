# models/log_model.py (或者其他你组织模型的地方)
from exts.db import db
from datetime import datetime

class LogEntry(db.Model):
    __tablename__ = 'log_entries'

    id = db.Column(db.Integer, primary_key=True)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow, index=True)
    level = db.Column(db.String(50), index=True) # INFO, DEBUG, ERROR 等
    module = db.Column(db.String(100)) # 发生日志的模块
    func_name = db.Column(db.String(100)) # 发生日志的函数名
    line_no = db.Column(db.Integer) # 行号
    message = db.Column(db.Text) # 日志具体信息
    traceback = db.Column(db.Text, nullable=True) # 异常堆栈信息

    def __repr__(self):
        return f'<LogEntry {self.timestamp} [{self.level}] {self.message[:50]}>'