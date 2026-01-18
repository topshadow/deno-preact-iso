# Badge 组件使用文档

## 组件介绍

Badge 组件是一个徽章组件，用于显示标签或状态。它支持多种变体样式，可以根据不同场景选择合适的徽章类型。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Badge } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Badge } from "@24wings/shadcn";

function MyComponent() {
  return (
    <div class="flex gap-2">
      <Badge>默认徽章</Badge>
      <Badge variant="secondary">次要徽章</Badge>
      <Badge variant="destructive">危险徽章</Badge>
      <Badge variant="outline">轮廓徽章</Badge>
    </div>
  );
}
```

## API 文档

### BadgeProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `variant` | `"default"  "secondary"  "destructive"  "outline"` | 徽章样式变体 | `"default"` |
| `className` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 徽章内容 | - |

## 高级用法

### 自定义样式

```tsx
import { Badge } from "@24wings/shadcn";

function CustomBadge() {
  return (
    <Badge className="bg-blue-500 text-white hover:bg-blue-600">
      自定义徽章
    </Badge>
  );
}
```

### 与其他组件结合使用

```tsx
import { Badge, Button } from "@24wings/shadcn";

function ButtonWithBadge() {
  return (
    <Button>
      通知 <Badge variant="destructive">3</Badge>
    </Button>
  );
}
```

### 状态标签

```tsx
import { Badge } from "@24wings/shadcn";

function StatusBadges() {
  return (
    <div class="space-y-2">
      <div class="flex items-center gap-2">
        <span>待处理</span>
        <Badge>pending</Badge>
      </div>
      <div class="flex items-center gap-2">
        <span>已完成</span>
        <Badge variant="secondary">completed</Badge>
      </div>
      <div class="flex items-center gap-2">
        <span>错误</span>
        <Badge variant="destructive">error</Badge>
      </div>
    </div>
  );
}
```

### 小型徽章

```tsx
import { Badge } from "@24wings/shadcn";

function SmallBadge() {
  return (
    <Badge className="text-[10px] px-1.5 py-0">S</Badge>
  );
}
```

## 注意事项

1. Badge 组件默认是内联元素（inline-flex），适合用于文本旁或按钮内
2. 不同变体的 Badge 有不同的颜色和背景，适合不同场景
3. 可以通过 `className` 属性自定义徽章样式
4. 徽章内容应该简洁，建议不超过 2-3 个字符
5. 徽章组件支持 focus 状态，有助于键盘导航和无障碍访问

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Card](CARD_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持四种变体样式
- 支持自定义样式
- 包含 focus 状态支持
- 支持无障碍访问
