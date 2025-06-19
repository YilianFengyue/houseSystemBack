# 智能房产推荐聊天功能

## 功能概述

基于OpenAI GPT模型的智能房产推荐系统，能够理解用户的自然语言需求，智能查询数据库中的房产信息，并提供个性化推荐。

## 🎯 核心功能

### 1. 智能对话
- 🤖 支持自然语言交互
- 🔍 智能理解用户需求
- 📊 自动调用数据库查询函数
- 💡 提供专业房产建议

### 2. 房源搜索
- 🏠 按价格、区域、面积筛选
- 🛏️ 支持房型、装修、租赁类型筛选
- 🚇 地铁沿线房源查询
- 🔥 热门房源推荐

### 3. 用户界面
- 💬 友好的聊天界面
- ⚡ 快速搜索预设
- 🎛️ 高级搜索面板
- 📱 响应式设计

## 🔧 技术架构

### 后端架构
```
Blueprint: chat_ai
├── HouseRecommendationBot (核心推荐引擎)
│   ├── search_houses_by_criteria() - 条件搜索
│   ├── get_house_details() - 房源详情
│   └── get_popular_houses() - 热门推荐
├── OpenAI Function Calling (智能函数调用)
└── Database Query Layer (数据库查询层)
```

### 前端架构
```
HouseRecommendationChat.vue
├── Chat Interface (聊天界面)
├── Quick Search (快速搜索)
├── Advanced Search (高级搜索)
└── Message Display (消息展示)
```

## 📡 API接口

### 1. 智能聊天接口
```http
POST /chat-ai/chat
Content-Type: application/json

{
  "message": "我想找雨花区3000元以下的两室一厅",
  "history": [
    {"role": "user", "content": "之前的对话"},
    {"role": "assistant", "content": "AI回复"}
  ],
  "api_key": "your_openai_api_key",
  "model": "gpt-3.5-turbo"
}
```

**响应示例：**
```json
{
  "code": 200,
  "success": true,
  "message": "对话成功",
  "data": {
    "reply": "根据您的需求，我为您找到了以下房源...",
    "function_called": true
  }
}
```

### 2. 房源搜索接口
```http
POST /chat-ai/houses/search
Content-Type: application/json

{
  "min_price": 2000,
  "max_price": 3000,
  "region": "雨花",
  "rooms": "2室1厅",
  "rent_type": "整租",
  "subway": true
}
```

### 3. 房源详情接口
```http
GET /chat-ai/houses/{house_id}
```

### 4. 热门房源接口
```http
GET /chat-ai/houses/popular?limit=10
```

## 🚀 部署指南

### 1. 后端配置

#### 安装依赖
```bash
pip install openai==0.28.1
```

#### 注册蓝图
在 `app.py` 中已自动注册：
```python
from blueprints.chat_ai import chat_ai_bp
app.register_blueprint(chat_ai_bp)
```

### 2. 前端配置

#### 添加路由
在路由配置中添加：
```javascript
{
  path: '/house-recommendation-chat',
  name: 'HouseRecommendationChat',
  component: () => import('@/views/chatgpt/HouseRecommendationChat.vue')
}
```

#### 配置API Key
在ChatGPT Store中配置OpenAI API Key。

## 💡 使用示例

### 用户对话示例

**用户**: "我想找雨花区3000元以下的房子"

**AI**: "好的，我来为您搜索雨花区3000元以下的房源。根据搜索结果，我找到了以下几个不错的选择：

1. **锦源小区 2室1厅** - 2800元/月
   - 面积：85㎡，精装修
   - 位置：雨花区树木岭
   - 特点：近地铁，采光好

2. **阳光花园 1室1厅** - 2500元/月
   - 面积：60㎡，简装
   - 位置：雨花区桂花公园
   - 特点：交通便利，周边配套齐全

..."

### 快速搜索标签
- "2000元以下" → 搜索价格≤2000的房源
- "雨花区" → 搜索雨花区房源
- "整租" → 搜索整租房源
- "近地铁" → 搜索地铁沿线房源

### 高级搜索
通过表单设置详细筛选条件：
- 价格范围：2000-5000元
- 区域：岳麓区
- 房型：2室1厅
- 装修：精装
- 近地铁：是

## 🔍 AI函数调用

系统使用OpenAI的Function Calling功能，AI可以智能调用以下函数：

### 1. search_houses_by_criteria
根据用户描述的条件搜索房源
```json
{
  "name": "search_houses_by_criteria",
  "description": "根据用户提供的条件搜索房源",
  "parameters": {
    "min_price": 2000,
    "max_price": 3000,
    "region": "雨花",
    "rooms": "2室1厅"
  }
}
```

### 2. get_house_details
获取特定房源的详细信息
```json
{
  "name": "get_house_details",
  "parameters": {
    "house_id": 123
  }
}
```

### 3. get_popular_houses
获取热门房源推荐
```json
{
  "name": "get_popular_houses",
  "parameters": {
    "limit": 10
  }
}
```

## 🎨 界面特性

### 1. 聊天界面
- 仿微信聊天样式
- 支持Markdown渲染
- 自动滚动到最新消息
- 加载状态指示

### 2. 搜索界面
- 快速搜索标签
- 可展开的高级搜索
- 表单验证
- 实时搜索反馈

### 3. 响应式设计
- 支持桌面和移动端
- 自适应布局
- 触摸友好的交互

## 🔐 安全考虑

1. **API Key管理**
   - 前端存储在本地Storage
   - 后端不存储用户API Key
   - 支持自定义代理URL

2. **数据验证**
   - 输入参数验证
   - SQL注入防护
   - 查询结果限制

3. **访问控制**
   - 可选的用户认证
   - API调用频率限制
   - 错误处理和日志记录

## 🚨 故障排除

### 1. OpenAI API错误
- 检查API Key是否有效
- 确认代理URL配置正确
- 检查API配额和余额

### 2. 数据库查询错误
- 验证房源数据格式
- 检查数据库连接
- 查看服务器日志

### 3. 前端显示问题
- 确认ChatGPT Store配置
- 检查网络连接
- 查看浏览器控制台错误

## 📈 扩展功能

### 1. 房源推荐算法优化
- 用户偏好学习
- 协同过滤推荐
- 地理位置权重

### 2. 多媒体支持
- 房源图片展示
- 虚拟看房
- 视频介绍

### 3. 社交功能
- 分享房源
- 用户评价
- 收藏夹功能

## 📞 技术支持

如有技术问题，请查看：
1. 服务器日志：`app.log`
2. 前端控制台错误
3. API响应状态码
4. OpenAI官方文档

---

**开发团队** | **更新时间**: 2024年

这个智能房产推荐系统结合了现代AI技术和传统数据库查询，为用户提供了直观、智能的房源搜索体验。 