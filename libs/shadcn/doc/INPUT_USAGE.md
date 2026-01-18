# Input 组件使用文档

## 组件介绍

Input 组件是一个基于 Preact Signals 的输入框组件，用于文本输入。它支持双向绑定，自动处理值的更新，提供了良好的用户体验和简洁的 API。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Input } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const inputValue = useSignal("");

  return (
    <div>
      <Input 
        value={inputValue} 
        placeholder="请输入内容" 
      />
      <p>输入值：{inputValue}</p>
    </div>
  );
}
```

## API 文档

### InputProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `value` | `Signal<string  number>` | 输入值的信号，用于双向绑定 | 必须 |
| `type` | `string` | 输入框类型，如 "text"、"email"、"password" 等 | `"text"` |
| `placeholder` | `string` | 占位文本 | - |
| `id` | `string` | 输入框 ID，用于关联 Label | - |
| `class` | `string` | 自定义类名 | - |
| `disabled` | `boolean` | 是否禁用输入框 | `false` |
| `readOnly` | `boolean` | 是否只读 | `false` |
| `required` | `boolean` | 是否必填 | `false` |
| `onChange` | `(event: Event) => void` | 输入变化事件处理函数 | - |
| `onBlur` | `(event: Event) => void` | 失去焦点事件处理函数 | - |
| `onFocus` | `(event: Event) => void` | 获得焦点事件处理函数 | - |

## 高级用法

### 不同类型的输入框

```tsx
import { Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function InputTypes() {
  const textValue = useSignal("");
  const emailValue = useSignal("");
  const passwordValue = useSignal("");
  const numberValue = useSignal(0);

  return (
    <div class="space-y-4">
      <div>
        <label>文本输入</label>
        <Input value={textValue} placeholder="文本输入" />
      </div>
      
      <div>
        <label>邮箱输入</label>
        <Input type="email" value={emailValue} placeholder="邮箱输入" />
      </div>
      
      <div>
        <label>密码输入</label>
        <Input type="password" value={passwordValue} placeholder="密码输入" />
      </div>
      
      <div>
        <label>数字输入</label>
        <Input type="number" value={numberValue} placeholder="数字输入" />
      </div>
    </div>
  );
}
```

### 与 Label 组件配合使用

```tsx
import { Input, Label } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function InputWithLabel() {
  const inputValue = useSignal("");

  return (
    <div>
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

### 禁用和只读状态

```tsx
import { Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function InputStates() {
  const disabledValue = useSignal("禁用状态");
  const readOnlyValue = useSignal("只读状态");

  return (
    <div class="space-y-4">
      <div>
        <label>禁用状态</label>
        <Input value={disabledValue} disabled />
      </div>
      
      <div>
        <label>只读状态</label>
        <Input value={readOnlyValue} readOnly />
      </div>
    </div>
  );
}
```

### 表单集成

```tsx
import { Input, Label, Button } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function FormExample() {
  const name = useSignal("");
  const email = useSignal("");
  const password = useSignal("");

  const handleSubmit = (e: Event) => {
    e.preventDefault();
    console.log({
      name: name.value,
      email: email.value,
      password: password.value
    });
  };

  return (
    <form onSubmit={handleSubmit} class="space-y-4">
      <div>
        <Label for="name">姓名</Label>
        <Input id="name" value={name} placeholder="请输入姓名" required />
      </div>
      
      <div>
        <Label for="email">邮箱</Label>
        <Input 
          id="email" 
          type="email" 
          value={email} 
          placeholder="请输入邮箱" 
          required 
        />
      </div>
      
      <div>
        <Label for="password">密码</Label>
        <Input 
          id="password" 
          type="password" 
          value={password} 
          placeholder="请输入密码" 
          required 
        />
      </div>
      
      <Button type="submit">提交</Button>
    </form>
  );
}
```

### 自定义样式

```tsx
import { Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomInput() {
  const inputValue = useSignal("");

  return (
    <Input 
      value={inputValue} 
      placeholder="自定义样式输入框" 
      class="rounded-full border-2 border-primary px-4 py-2" 
    />
  );
}
```

## 注意事项

1. Input 组件依赖 Preact Signals，必须使用 `useSignal` 创建值信号
2. `value` 属性是必填项，类型必须为 `Signal<string | number>`
3. 组件自动处理双向绑定，无需手动编写 `onChange` 事件处理函数
4. 支持所有原生 input 元素的属性，可以直接传递
5. 当需要自定义 onChange 事件时，组件仍然会自动更新信号值

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Label](LABEL_USAGE.md)
- [Select](SELECT_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基于 Signal 的双向绑定
- 支持多种输入类型
- 支持禁用和只读状态
- 支持表单集成
