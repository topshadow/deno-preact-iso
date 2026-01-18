# Checkbox 组件使用文档

## 组件介绍

Checkbox 组件是一个复选框组件，用于多选操作。它基于 button 元素实现，支持自定义样式和状态管理。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Checkbox } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Checkbox } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const isChecked = useSignal(false);

  return (
    <div class="flex items-center gap-2">
      <Checkbox 
        checked={isChecked.value} 
        onClick={() => isChecked.value = !isChecked.value} 
      />
      <label>复选框</label>
    </div>
  );
}
```

## API 文档

### CheckboxProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `checked` | `boolean` | 复选框的选中状态 | 必须 |
| `name` | `string` | 复选框名称，用于表单提交 | - |
| `class` | `string` | 自定义类名 | - |
| `onClick` | `(event: MouseEvent) => void` | 点击事件处理函数 | - |
| `disabled` | `boolean` | 是否禁用复选框 | `false` |

## 高级用法

### 自定义样式

```tsx
import { Checkbox } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomCheckbox() {
  const isChecked = useSignal(false);

  return (
    <Checkbox 
      checked={isChecked.value} 
      onClick={() => isChecked.value = !isChecked.value} 
      class="border-blue-500 text-blue-500"
    />
  );
}
```

### 多个复选框

```tsx
import { Checkbox } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MultipleCheckboxes() {
  const options = useSignal([
    { id: "option1", label: "选项 1", checked: false },
    { id: "option2", label: "选项 2", checked: true },
    { id: "option3", label: "选项 3", checked: false },
  ]);

  const toggleOption = (id: string) => {
    options.value = options.value.map(option => {
      if (option.id === id) {
        return { ...option, checked: !option.checked };
      }
      return option;
    });
  };

  return (
    <div class="space-y-2">
      {options.value.map(option => (
        <div key={option.id} class="flex items-center gap-2">
          <Checkbox 
            checked={option.checked} 
            onClick={() => toggleOption(option.id)} 
            name={option.id}
          />
          <label>{option.label}</label>
        </div>
      ))}
    </div>
  );
}
```

### 禁用状态

```tsx
import { Checkbox } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function DisabledCheckbox() {
  return (
    <div class="flex items-center gap-2">
      <Checkbox 
        checked={true} 
        disabled 
      />
      <label class="text-muted-foreground">禁用的选中复选框</label>
    </div>
  );
}
```

## 注意事项

1. Checkbox 组件是基于 button 元素实现的，不是原生 input 元素
2. 需要手动管理选中状态，通常使用 Preact Signals
3. 支持自定义样式，可以通过 class 属性调整外观
4. 带有 focus-visible 样式，支持键盘导航
5. 适合用于表单中的多选场景

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Input](INPUT_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基本复选框功能
- 支持自定义样式
- 支持禁用状态
- 支持键盘导航
