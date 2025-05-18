# 基于Flask的房屋租赁系统后端

#### 安装步骤：

#### 1、克隆项目到本地；

#### 2、添加虚拟环境（flask_env)到项目

> 设置-项目-Python解释器-添加解释器-flask_env/Scripts/python.exe选择该文件

#### 3、配置数据库相关（sql文件记得导入）

#### 4、运行

记得及时提交！

记得及时提交！

记得及时提交！

不同成员板块写到不同文件里面应该都是接口，记得提供API文档）

----------------------------------------------------------------------------------------------------------

### 附录：

### API文档

#### 用户相关接口

##### 1. 用户注册
- **路径**: POST /api/user/users
- **参数**:
  ```json
  {
    "username": "string",
    "password": "string", 
    "identification": "string",
    "phone": "string"
  }
  ```
- **成功响应**:
  ```json
  {
    "code": 201,
    "msg": "用户注册成功"
  }
  ```
- **错误响应**:
  ```json
  {
    "code": 400,
    "msg": "用户已存在"
  }
  ```

##### 2. 用户登录
- **路径**: POST /api/user/auth/login
- **参数**:
  ```json
  {
    "username": "string",
    "password": "string"
  }
  ```
- **成功响应**:
  ```json
  {
    "code": 200,
    "msg": "登录成功",
    "data": {
      "id": "number",
      "username": "string",
      "password": "string",
      "identification": "string",
      "phone": "string"
    },
    "token": "string"
  }
  ```
- **错误响应**:
  ```json
  {
    "code": 401,
    "msg": "用户名或密码错误"
  }
  ```

##### 3. 获取所有用户
- **路径**: GET /api/user/users
- **成功响应**:
  ```json
  {
    "code": 200,
    "msg": "获取成功",
    "data": [
      {
        "id": "number",
        "username": "string",
        "password": "string"
      }
    ]
  }
  ```

##### 4. 获取用户资料
- **路径**: GET /api/user/profile
- **需要认证**: 是 (需要token)
- **成功响应**:
  ```json
  {
    "code": 200,
    "msg": "获取成功",
    "data": {
      "id": "number",
      "username": "string"
    }
  }
  ```
