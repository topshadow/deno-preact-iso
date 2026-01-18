# Divider 组件使用文档

## 组件介绍

Divider 组件是一个分隔线组件，用于分隔内容。它支持水平和垂直两种方向，可以根据需要调整样式。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Divider } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Divider } from "@24wings/shadcn";

function MyComponent() {
  return (
    <div>
      <h2>标题 1</h2>
      <p>这是标题 1 的内容。</p>
      
      <Divider />
      
      <h2>标题 2</h2>
      <p>这是标题 2 的内容。</p>
    </div>
  );
}
```

## API 文档

### DividerProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `vertical` | `boolean` | 是否为垂直分隔线 | `false` |
| `class` | `string` | 自定义类名 | - |

## 高级用法

### 垂直分隔线

```tsx
import { Divider } from "@24wings/shadcn";

function VerticalDivider() {
  return (
    <div class="flex items-center gap-4">
      <div>左侧内容</div>
      <Divider vertical />
      <div>右侧内容</div>
    </div>
  );
}
```

### 自定义样式

```tsx
import { Divider } from "@24wings/shadcn";

function CustomDivider() {
  return (
    <div>
      <p>内容</p>
      <Divider class="my-4 border-blue-500" />
      <p>更多内容</p>
    </div>
  );
}
```

### 带有文本的分隔线

```tsx
import { Divider } from "@24wings/shadcn";

function DividerWithText() {
  return (
    <div class="relative">
      <Divider />
      <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-background px-2 text-sm">
        或
      </div>
    </div>
  );
}
```

## 注意事项

1. Divider 组件默认是水平方向的
2. 垂直分隔线默认高度为 h-4，可以通过自定义类名调整
3. 支持自定义颜色、边距和粗细
4. 适合用于分隔不同区块的内容

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Card](CARD_USAGE.md)
- [Accordion](ACCORDION_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持水平和垂直分隔线
- 支持自定义样式
