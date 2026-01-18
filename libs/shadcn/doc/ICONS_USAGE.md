# Icons 组件使用文档

## 组件介绍

Icons 组件提供了一套常用的图标集，基于 Lucide 图标库构建。所有图标都作为独立的组件导出，可以直接使用，支持自定义样式和大小。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Icons } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Icons } from "@24wings/shadcn";

function MyComponent() {
  return (
    <div class="flex gap-4">
      <Icons.Bell size={24} />
      <Icons.Sun class="text-yellow-500" />
      <Icons.Moon class="text-gray-600" />
      <Icons.Search size={18} />
    </div>
  );
}
```

## API 文档

### IconProps

所有图标组件都支持以下属性：

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `size` | `number` | 图标尺寸 | `24` |
| `class` | `string` | 自定义类名 | - |
| `strokeWidth` | `number` | 图标的描边宽度 | `2` |
| `color` | `string` | 图标的颜色 | `currentColor` |

## 图标列表

### 常用图标

| 图标名称 | 组件 | 描述 |
|---------|------|------|
| Bell | `Icons.Bell` | 铃铛图标，用于通知 |
| Sun | `Icons.Sun` | 太阳图标，用于浅色主题 |
| Moon | `Icons.Moon` | 月亮图标，用于深色主题 |
| Search | `Icons.Search` | 搜索图标，用于搜索功能 |
| Settings | `Icons.Settings` | 设置图标，用于配置选项 |
| Github | `Icons.Github` | GitHub 图标，用于链接到 GitHub |
| X | `Icons.X` | 关闭图标，用于关闭功能 |
| ChevronLeft | `Icons.ChevronLeft` | 左箭头图标，用于导航 |
| ChevronRight | `Icons.ChevronRight` | 右箭头图标，用于导航 |
| ChevronDown | `Icons.ChevronDown` | 下箭头图标，用于下拉菜单 |

### 完整图标列表

- `Icons.ArrowUpDown`
- `Icons.Bell`
- `Icons.Box`
- `Icons.Boxes`
- `Icons.ChevronDown`
- `Icons.ChevronLeft`
- `Icons.ChevronRight`
- `Icons.Github`
- `Icons.Google`
- `Icons.IconBlibli`
- `Icons.Moon`
- `Icons.MoveDown`
- `Icons.MoveUp`
- `Icons.Palette`
- `Icons.RefreshCcw`
- `Icons.Search`
- `Icons.Settings`
- `Icons.SquareSquare`
- `Icons.Sun`
- `Icons.Titok`
- `Icons.X`
- `Icons.Xiaohongshu`

## 高级用法

### 自定义样式

```tsx
import { Icons } from "@24wings/shadcn";

function CustomIcon() {
  return (
    <Icons.Sun 
      class="text-yellow-500 hover:text-yellow-600 transition-colors"
      strokeWidth={3}
      size={32}
    />
  );
}
```

### 图标按钮

```tsx
import { Icons, Button } from "@24wings/shadcn";

function IconButton() {
  return (
    <Button variant="ghost" size="icon">
      <Icons.Search />
    </Button>
  );
}
```

### 带文本的图标

```tsx
import { Icons } from "@24wings/shadcn";

function IconWithText() {
  return (
    <div class="flex items-center gap-2">
      <Icons.Bell />
      <span>通知</span>
    </div>
  );
}
```

## 注意事项

1. 所有图标都支持 SVG 的原生属性
2. 图标默认颜色为 `currentColor`，会继承父元素的颜色
3. 可以通过 `size` 属性直接调整图标大小，无需额外的 CSS
4. 支持自定义描边宽度，通过 `strokeWidth` 属性设置
5. 所有图标都是响应式的，可以根据需要调整

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [DropdownMenu](DROPDOWNMENU_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 包含 20+ 常用图标
- 支持自定义样式和大小
- 基于 Lucide 图标库构建
