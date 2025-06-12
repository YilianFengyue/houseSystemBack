from typing import Optional
from sqlalchemy.dialects.mysql import INTEGER as MYSQL_INTEGER, VARCHAR
from sqlalchemy.orm import Mapped, mapped_column
from exts import db
# 引入 bcrypt
from flask_bcrypt import generate_password_hash, check_password_hash

class UserModel(db.Model):
    __tablename__ = 'user_info'

    id: Mapped[int] = mapped_column(MYSQL_INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='用户名')
    password: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='密码')
    email: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='邮箱')
    phone: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='电话')
    addr: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='地址')
    seen_id: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='已浏览ID')
    collect_id: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='收藏ID')
    identityCard: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='身份证号')
    userType: Mapped[Optional[int]] = mapped_column(MYSQL_INTEGER, nullable=True, comment='用户类型')
    avatarUrl: Mapped[Optional[str]] = mapped_column(VARCHAR(255), nullable=True, comment='用户头像')

    # 新增：设置密码的方法，自动进行哈希加密
    def set_password(self, password_text):
        self.password = generate_password_hash(password_text).decode('utf-8')

    # 新增：校验密码的方法
    def check_password(self, password_text):
        return check_password_hash(self.password, password_text)

        # 修改 to_dict，移除密码字段，防止泄露

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email,
            "phone": self.phone,
            "addr": self.addr,
            "seen_id": self.seen_id,
            "collect_id": self.collect_id,
            "identityCard": self.identityCard,
            "userType": self.userType,
            "avatarUrl": self.avatarUrl,
        }