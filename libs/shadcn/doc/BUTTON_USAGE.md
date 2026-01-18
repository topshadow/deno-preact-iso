# Button 组件使用文档

## 组件介绍

Button 组件是一个基础的按钮组件，用于触发各种操作。它支持多种变体样式和尺寸，可以根据不同场景进行定制。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Button } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Button } from "@24wings/shadcn";

function MyComponent() {
  return (
    <div class="flex gap-4">
      <Button>默认按钮</Button>
      <Button variant="outline">轮廓按钮</Button>
      <Button variant="secondary">次要按钮</Button>
      <Button variant="destructive">危险按钮</Button>
    </div>
  );
}
```

## API 文档

### ButtonProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `variant` | `"default"  "destructive"  "red"  "outline"  "secondary"  "ghost"  "link"` | 按钮样式变体 | `"default"` |
| `size` | `"default"  "sm"  "lg"  "icon"` | 按钮尺寸 | `"default"` |
| `type` | `"button"  "submit"  "reset"` | 按钮类型 | `"button"` |
| `children` | `ReactNode` | 按钮内容 | - |
| `class` | `string` | 自定义类名 | - |
| `disabled` | `boolean` | 是否禁用按钮 | `false` |
| `onClick` | `(event: MouseEvent) => void` | 点击事件处理函数 | - |

## 高级用法

### 不同尺寸

```tsx
import { Button } from "@24wings/shadcn";

function ButtonSizes() {
  return (
    <div class="flex gap-4 items-center">
      <Button size="sm">小尺寸</Button>
      <Button size="default">默认尺寸</Button>
      <Button size="lg">大尺寸</Button>
      <Button size="icon">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
          <polyline points="7 10 12 15 17 10" />
          <line x1="12" y1="15" x2="12" y2="3" />
        </svg>
      </Button>
    </div>
  );
}
```

### 不同变体

```tsx
import { Button } from "@24wings/shadcn";

function ButtonVariants() {
  return (
    <div class="flex gap-4">
      <Button variant="default">默认</Button>
      <Button variant="destructive">危险</Button>
      <Button variant="red">红色</Button>
      <Button variant="outline">轮廓</Button>
      <Button variant="secondary">次要</Button>
      <Button variant="ghost">幽灵</Button>
      <Button variant="link">链接</Button>
    </div>
  );
}
```

### 表单提交按钮

```tsx
import { Button, Input, Label } from "@24wings/shadcn";

function FormExample() {
  const handleSubmit = (e: Event) => {
    e.preventDefault();
    console.log("表单提交");
  };

  return (
    <form onSubmit={handleSubmit} class="space-y-4">
      <div>
        <Label for="name">姓名</Label>
        <Input id="name" placeholder="请输入姓名" />
      </div>
      <Button type="submit">提交</Button>
      <Button type="reset">重置</Button>
    </form>
  );
}
```

### 禁用状态

```tsx
import { Button } from "@24wings/shadcn";

function DisabledExample() {
  return (
    <div class="flex gap-4">
      <Button disabled>禁用按钮</Button>
      <Button variant="outline" disabled>禁用轮廓按钮</Button>
    </div>
  );
}
```

## 自定义样式

可以通过 `class` 属性添加自定义样式：

```tsx
import { Button } from "@24wings/shadcn";

function CustomButton() {
  return (
    <Button class="rounded-full px-6 py-3">
      自定义样式按钮
    </Button>
  );
}
```

## 注意事项

1. 按钮的 `type` 属性默认为 `button`，在表单中使用时需要显式设置为 `submit` 或 `reset`
2. 图标按钮（`size="icon"`）通常用于工具栏或紧凑布局中
3. 危险按钮（`variant="destructive"` 或 `variant="red"`）应该用于不可逆的操作，如删除
4. 禁用按钮会自动添加 `disabled` 属性，阻止用户交互和键盘焦点

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Input](INPUT_USAGE.md)
- [Label](LABEL_USAGE.md)
- [Dialog](DIALOG_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持多种变体样式
- 支持多种尺寸
- 支持表单提交和重置类型
