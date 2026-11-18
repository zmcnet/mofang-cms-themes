# 魔方财务主题 · 屿笙云

魔方财务（Magic Cube Hosting）主机面板的**前端主题模板**集合，
包含 4 套主题与共享资源，基于 Smarty 模板引擎。

---

## 主题列表

| 目录 | 主题 | 模板数 | 说明 |
| ---- | ---- | ------ | ---- |
| `default/` | 默认主题 | 129 | 原始模板基线 |
| `808yun/` | 808云 | 129 | 标准云主机面板风格 |
| `ysyplat/` | 屿笙云 · 用户中心 | 128 | 用户中心（clientarea）改版 |
| `ysyplat-cart/` | 屿笙云 · 购物车 | 10 | 购物车（cart）改版 |

配套购物车 / 用户中心子主题见 `_archive/`（`mofang-cart-legacy`、`mofang-clientarea-legacy`）。

### `ysyplat` / `ysyplat-cart` 的设计方向

依据 [`plans/blazing-aurora-tesla.md`](plans/blazing-aurora-tesla.md)：

- **视觉** — Apple WWDC 2025 风格：Bento Grid 栅格、高对比度、大字号、玻璃拟态（Glassmorphism）
- **交互** — 顺滑轻量的「Liquid」过渡，微软式多步认证流
- **响应式** — 以桌面（1920px+）为主，移动端采用 App 式底部导航
- **品牌** — 腾讯蓝强调色，纯净白/浅色基底，高端专业感

---

## 技术栈

| 组件 | 说明 |
| ---- | ---- |
| 模板引擎 | **Smarty**（`.tpl` 文件） |
| 资源 | `assets/`（CSS/JS/图片）、`assets_custom/`（自定义覆盖） |
| 依赖 | 由魔方财务主程序提供，本仓库仅为模板层 |

---

## 安装 / 部署

### 方式一：整站主题

将主题目录上传到魔方财务的模板根目录：

```bash
# 典型路径
/var/www/mofang/templates/
```

然后在后台「模板管理」中选择对应主题即可。

### 方式二：单主题目录上传

```bash
# 只部署屿笙云用户中心
scp -r ysyplat/ root@server:/var/www/mofang/templates/
```

### 方式三：宝塔面板

`网站 → 目录` 指向魔方财务根目录，将主题文件夹拖入 `templates/` 目录。

---

## 构建说明

本项目是**纯模板**，无编译步骤、无 npm/composer 依赖。

```
mofang-cms/
├── default/            # 默认主题
├── 808yun/             # 808云主题
├── ysyplat/            # 屿笙云 · 用户中心
├── ysyplat-cart/       # 屿笙云 · 购物车
├── assets/             # 共享资源（css/）
├── plans/              # 设计方案文档
└── assets_custom/      # （各主题内的）自定义覆盖目录
```

### 关键目录说明

| 路径 | 说明 |
| ---- | ---- |
| `*/header.tpl` `*/footer.tpl` | 页面头尾骨架 |
| `*/login.tpl` `*/register.tpl` | 登录 / 注册 |
| `*/clientarea.tpl` | 用户中心首页 |
| `*/service*.tpl` | 产品选购页（云服务器/虚拟主机/域名/SSL/短信/CDN…） |
| `*/servicedetail*.tpl` | 产品详情页（`-v10-cloud` / `-v10-common` / `-v10-dcim` 三套变体） |
| `*/supporttickets.tpl` `*/viewticket.tpl` | 工单系统 |
| `*/transaction.tpl` `*/billing.tpl` `*/viewbilling.tpl` | 账单与交易 |
| `*/invoice*.tpl` | 发票 |
| `*/knowledgebase*.tpl` | 知识库 |
| `*/api*.tpl` | API 文档与管理 |
| `*/v10/` | v10 界面版本化组件 |
| `*/language/` | 多语言包 |
| `*/includes/` | 公共片段 |
| `*/error/` | 错误页 |

### 模板内自定义覆盖

修改 `assets_custom/` 下的文件可覆盖 `assets/` 中的同名资源，
**无需改动主模板**即可个性化 —— 这是魔方财务推荐的自定义方式。

---

## 备份文件说明

主题内保留有若干历史备份（如 `servicedetail.tpl.bak`、`login - 副本.tpl`），
已在 `.gitignore` 中排除 `*.bak` 与 `*- 副本.tpl`。如需保留请自行调整规则。

---

## 许可

模板继承自魔方财务官方结构，二次修改内容版权归作者所有。