# Shadcn 组件库文档

欢迎使用 Shadcn 组件库文档！本目录包含了所有组件的详细使用说明和 API 文档。

## 快速开始

### 安装

```bash
deno add @24wings/shadcn
```

### 导入组件

```tsx
import { Button, Input, Dialog } from "@24wings/shadcn";
```

## 组件列表

| 组件名称     | 文档链接                              | 描述                               |
| ------------ | ------------------------------------- | ---------------------------------- |
| Accordion    | [Accordion](ACCORDION_USAGE.md)       | 手风琴组件，用于折叠/展开内容      |
| Alert        | [Alert](ALERT_USAGE.md)               | 提示组件，用于显示警告、成功等信息 |
| Badge        | [Badge](BADGE_USAGE.md)               | 徽章组件，用于显示标签或状态       |
| Button       | [Button](BUTTON_USAGE.md)             | 按钮组件，用于触发操作             |
| Card         | [Card](CARD_USAGE.md)                 | 卡片组件，用于展示内容块           |
| Checkbox     | [Checkbox](CHECKBOX_USAGE.md)         | 复选框组件，用于多选操作           |
| Dialog       | [Dialog](DIALOG_USAGE.md)             | 对话框组件，用于显示模态内容       |
| Divider      | [Divider](DIVIDER_USAGE.md)           | 分隔线组件，用于分隔内容           |
| DropdownMenu | [DropdownMenu](DROPDOWNMENU_USAGE.md) | 下拉菜单组件，用于显示选项列表     |
| Icons        | [Icons](ICONS_USAGE.md)               | 图标组件，提供常用图标集           |
| Input        | [Input](INPUT_USAGE.md)               | 输入框组件，用于文本输入           |
| Label        | [Label](LABEL_USAGE.md)               | 标签组件，用于表单字段标签         |
| Pagination   | [Pagination](PAGINATION_USAGE.md)     | 分页组件，用于分页导航             |
| Select       | [Select](SELECT_USAGE.md)             | 选择器组件，用于从选项中选择       |
| Sidebar      | [Sidebar](SIDEBAR_USAGE.md)           | 侧边栏组件，用于导航菜单           |
| Table        | [Table](TABLE_USAGE.md)               | 表格组件，用于展示数据             |
| Textarea     | [Textarea](TEXTAREA_USAGE.md)         | 文本框组件，用于多行文本输入       |
| Theme        | [Theme](THEME_USAGE.md)               | 主题组件，用于管理应用主题         |

## 设计原则

- **简洁 API**：提供易于使用和理解的组件 API
- **基于信号**：使用 Preact Signals 管理状态，提供更流畅的用户体验
- **可定制性**：支持自定义样式和行为
- **响应式设计**：适配不同屏幕尺寸
- **无障碍支持**：遵循无障碍设计原则

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 贡献

如有问题或建议，请提交 Issue 或 Pull Request。

## 更新日志

### v1.0.0
- 初始版本
- 包含 17 个核心组件
- 支持 Preact Signals
- 提供完整的文档
