# Label 组件使用文档

## 组件介绍

Label 组件是一个表单标签组件，用于与表单输入元素关联。它提供了默认的样式，支持自定义类名，可以提高表单的可访问性和用户体验。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Label } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Label, Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const inputValue = useSignal("");

  return (
    <div class="space-y-2">
      <Label for="username">用户名</Label>
      <Input 
        id="username" 
        value={inputValue} 
        placeholder="请输入用户名" 
      />
    </div>
  );
}
```

## API 文档

### LabelProps

| 参数       | 类型        | 描述              | 默认值  |
| ---------- | ----------- | ----------------- | ------- |
| `for`      | `string`    | 关联的表单元素 ID | -       |
| `class`    | `string`    | 自定义类名        | -       |
| `children` | `ReactNode` | 标签内容          | -       |
| `disabled` | `boolean`   | 是否禁用          | `false` |

## 高级用法

### 自定义样式

```tsx
import { Label, Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomLabel() {
  const inputValue = useSignal("");

  return (
    <div class="space-y-2">
      <Label 
        for="email" 
        class="text-blue-600 font-semibold"
      >
        邮箱地址
      </Label>
      <Input 
        id="email" 
        type="email" 
        value={inputValue} 
        placeholder="请输入邮箱" 
      />
    </div>
  );
}
```

### 与其他表单元素结合

```tsx
import { Label, Checkbox } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function LabelWithCheckbox() {
  const isChecked = useSignal(false);

  return (
    <div class="flex items-center gap-2">
      <Checkbox 
        id="agree" 
        checked={isChecked.value} 
        onClick={() => isChecked.value = !isChecked.value} 
      />
      <Label for="agree">我同意条款和条件</Label>
    </div>
  );
}
```

### 禁用状态

```tsx
import { Label, Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function DisabledLabel() {
  const inputValue = useSignal("禁用状态");

  return (
    <div class="space-y-2">
      <Label for="disabled-input" disabled>
        禁用标签
      </Label>
      <Input 
        id="disabled-input" 
        value={inputValue} 
        disabled 
      />
    </div>
  );
}
```

## 注意事项

1. 使用 `for` 属性将 Label 与表单元素关联，可以提高可访问性
2. 当表单元素被禁用时，Label 会自动应用禁用样式
3. 支持自定义类名，可以根据需要调整样式
4. 建议将 Label 与表单元素放在同一个容器中，以确保良好的布局
5. Label 组件会自动处理 `peer-disabled` 状态，当关联的表单元素被禁用时，Label 会显示禁用样式

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Input](INPUT_USAGE.md)
- [Checkbox](CHECKBOX_USAGE.md)
- [Select](SELECT_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基本标签功能
- 支持自定义样式
- 支持禁用状态
- 支持与表单元素关联
