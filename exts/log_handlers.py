# exts/log_handlers.py
import logging
from flask import current_app, has_app_context # 导入 has_app_context
from exts.db import db
# from models.log_model import LogEntry # 建议在 emit 方法内导入

class DatabaseLogHandler(logging.Handler):
    def __init__(self, app_instance=None, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.app_instance = app_instance

    def emit(self, record):
        if record.name == 'sqlalchemy.engine':
            return

        # 尝试提前过滤掉一些明显没有上下文的早期 werkzeug 日志
        # 这是一种启发式方法，可能不完美，但有助于减少问题
        if record.name == 'werkzeug' and not has_app_context() and not self.app_instance:
            print(f"LOGGING (werkzeug - pre-context): {record.getMessage()}")
            return

        from models.log_model import LogEntry # 在方法内导入，更安全

        traceback_info = None
        if record.exc_info:
            if self.formatter:
                traceback_info = self.formatter.formatException(record.exc_info)
            else:
                import traceback
                traceback_info = ''.join(traceback.format_exception(*record.exc_info))

        log_entry = LogEntry(
            level=record.levelname,
            module=record.module,
            func_name=record.funcName,
            line_no=record.lineno,
            message=record.getMessage(),
            traceback=traceback_info
        )

        effective_app = self.app_instance if self.app_instance else current_app
        original_db_exception = None # 用来存储 commit 时发生的原始异常

        if effective_app:
            try:
                with effective_app.app_context():
                    db.session.add(log_entry)
                    db.session.commit()
                return # 如果成功记录，就此返回
            except Exception as e:
                original_db_exception = e # 保存原始的数据库操作异常

            # 如果代码执行到这里，说明上面的 commit 失败了
            print(f"--- ERROR Logging to Database (App: {getattr(effective_app, 'name', 'N/A')}) ---")
            print(f"Log Record: {record.levelname} - {record.getMessage()}")
            if original_db_exception:
                print(f"Original DB Exception during commit: {original_db_exception}")
                import traceback
                # 打印原始异常的堆栈信息
                traceback.print_exception(type(original_db_exception), original_db_exception, original_db_exception.__traceback__)
            else:
                # 理论上不应该发生，因为我们是从 except 块过来的
                print("An unknown error occurred during the DB logging commit attempt.")
            print(f"-------------------------------")

            # 尝试回滚，但要更小心应用上下文
            # 使用 has_app_context() 进行检查，它比直接操作 db.session 更安全
            if has_app_context():
                try:
                    # 即使有上下文，db.session 本身也可能存在问题（比如未正确初始化或作用域问题）
                    db.session.rollback()
                    print("--- Session rollback attempted. ---")
                except Exception as rb_exc:
                    print(f"--- Error during rollback attempt: {rb_exc} ---")
            else:
                print("--- Skipped rollback attempt: No active app context during error handling. ---")
        else:
            # 如果连 effective_app 都获取不到
            print(f"LOGGING (no effective_app for context): {record.getMessage()}")