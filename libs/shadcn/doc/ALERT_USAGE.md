# Alert 组件使用文档

## 组件介绍

Alert 组件是一个提示组件，用于显示警告、成功、错误等信息。它支持不同的变体样式，可以根据场景选择合适的提示类型。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Alert } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Alert } from "@24wings/shadcn";

function MyComponent() {
  return (
    <div class="space-y-4">
      <Alert>
        <Alert.Title>提示信息</Alert.Title>
        <Alert.Description>
          这是一个普通的提示信息，用于显示一般通知。
        </Alert.Description>
      </Alert>
      
      <Alert variant="destructive">
        <Alert.Title>错误信息</Alert.Title>
        <Alert.Description>
          这是一个错误提示信息，用于显示操作失败或错误状态。
        </Alert.Description>
      </Alert>
    </div>
  );
}
```

## API 文档

### AlertProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `variant` | `"default"  "destructive"` | 提示样式变体 | `"default"` |
| `className` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 提示内容，通常包含 `Alert.Title` 和 `Alert.Description` | - |

### Alert.TitleProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `className` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 提示标题内容 | - |

### Alert.DescriptionProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `className` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 提示描述内容 | - |

## 高级用法

### 带有图标的提示

```tsx
import { Alert } from "@24wings/shadcn";

function AlertWithIcon() {
  return (
    <Alert>
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10" />
        <line x1="12" y1="8" x2="12" y2="12" />
        <line x1="12" y1="16" x2="12.01" y2="16" />
      </svg>
      <Alert.Title>提示</Alert.Title>
      <Alert.Description>带有图标的提示信息</Alert.Description>
    </Alert>
  );
}
```

### 自定义样式

```tsx
import { Alert } from "@24wings/shadcn";

function CustomAlert() {
  return (
    <Alert className="border-blue-500 bg-blue-50 text-blue-800">
      <Alert.Title>自定义样式</Alert.Title>
      <Alert.Description>
        这是一个自定义样式的提示信息，可以根据需要调整颜色和外观。
      </Alert.Description>
    </Alert>
  );
}
```

### 简洁提示

```tsx
import { Alert } from "@24wings/shadcn";

function SimpleAlert() {
  return (
    <Alert>
      <Alert.Description>
        只有描述内容的简洁提示信息。
      </Alert.Description>
    </Alert>
  );
}
```

## 注意事项

1. Alert 组件默认带有边框和内边距，适合用于显示重要通知
2. `destructive` 变体通常用于显示错误或警告信息
3. 建议同时使用 `Alert.Title` 和 `Alert.Description` 以提供完整信息
4. 可以在 Alert 内部添加图标，组件会自动调整布局
5. Alert 组件带有 `role="alert"` 属性，有助于无障碍访问

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Dialog](DIALOG_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持两种变体样式
- 包含标题和描述子组件
- 支持自定义样式
- 支持无障碍访问
