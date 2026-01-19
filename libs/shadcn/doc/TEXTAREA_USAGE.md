# Textarea 组件使用文档

## 组件介绍

Textarea 组件是一个基于 Preact Signals 的多行文本输入框组件，用于长文本输入。它支持双向绑定，自动处理值的更新，提供了良好的用户体验和简洁的 API。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Textarea } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Textarea } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const textValue = useSignal("");

  return (
    <div>
      <Textarea 
        value={textValue} 
        placeholder="请输入多行文本"
        rows={5}
      />
      <p>输入值：{textValue}</p>
    </div>
  );
}
```

## API 文档

### TextareaProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `value` | `Signal<string  number>` | 输入值的信号，用于双向绑定 | 必须 |
| `placeholder` | `string` | 占位文本 | - |
| `rows` | `number` | 显示的行数 | - |
| `cols` | `number` | 显示的列数 | - |
| `id` | `string` | 文本框 ID，用于关联 Label | - |
| `class` | `string` | 自定义类名 | - |
| `disabled` | `boolean` | 是否禁用文本框 | `false` |
| `readOnly` | `boolean` | 是否只读 | `false` |
| `required` | `boolean` | 是否必填 | `false` |
| `onChange` | `(event: Event) => void` | 输入变化事件处理函数 | - |
| `onBlur` | `(event: Event) => void` | 失去焦点事件处理函数 | - |
| `onFocus` | `(event: Event) => void` | 获得焦点事件处理函数 | - |

## 高级用法

### 不同尺寸的文本框

```tsx
import { Textarea } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function TextareaSizes() {
  const smallValue = useSignal("");
  const mediumValue = useSignal("");
  const largeValue = useSignal("");

  return (
    <div class="space-y-4">
      <div>
        <label>小尺寸文本框</label>
        <Textarea value={smallValue} placeholder="小尺寸" rows={3} />
      </div>
      
      <div>
        <label>中尺寸文本框</label>
        <Textarea value={mediumValue} placeholder="中尺寸" rows={5} />
      </div>
      
      <div>
        <label>大尺寸文本框</label>
        <Textarea value={largeValue} placeholder="大尺寸" rows={10} />
      </div>
    </div>
  );
}
```

### 与 Label 组件配合使用

```tsx
import { Textarea, Label } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function TextareaWithLabel() {
  const textValue = useSignal("");

  return (
    <div>
      <Label for="description">描述</Label>
      <Textarea 
        id="description" 
        value={textValue} 
        placeholder="请输入描述" 
        rows={4}
      />
    </div>
  );
}
```

### 禁用和只读状态

```tsx
import { Textarea } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function TextareaStates() {
  const disabledValue = useSignal("禁用状态");
  const readOnlyValue = useSignal("只读状态");

  return (
    <div class="space-y-4">
      <div>
        <label>禁用状态</label>
        <Textarea value={disabledValue} disabled rows={3} />
      </div>
      
      <div>
        <label>只读状态</label>
        <Textarea value={readOnlyValue} readOnly rows={3} />
      </div>
    </div>
  );
}
```

### 表单集成

```tsx
import { Textarea, Label, Button } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function FormExample() {
  const title = useSignal("");
  const content = useSignal("");

  const handleSubmit = (e: Event) => {
    e.preventDefault();
    console.log({
      title: title.value,
      content: content.value
    });
  };

  return (
    <form onSubmit={handleSubmit} class="space-y-4">
      <div>
        <Label for="title">标题</Label>
        <Textarea 
          id="title" 
          value={title} 
          placeholder="请输入标题" 
          rows={1}
          required 
        />
      </div>
      
      <div>
        <Label for="content">内容</Label>
        <Textarea 
          id="content" 
          value={content} 
          placeholder="请输入内容" 
          rows={6}
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
import { Textarea } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomTextarea() {
  const textValue = useSignal("");

  return (
    <Textarea 
      value={textValue} 
      placeholder="自定义样式文本框" 
      rows={4}
      class="rounded-lg border-2 border-primary px-4 py-2 focus-visible:ring-2 focus-visible:ring-primary"
    />
  );
}
```

## 注意事项

1. Textarea 组件依赖 Preact Signals，必须使用 `useSignal` 创建值信号
2. `value` 属性是必填项，类型必须为 `Signal<string | number>`
3. 组件自动处理双向绑定，无需手动编写 `onChange` 事件处理函数
4. 支持所有原生 textarea 元素的属性，可以直接传递
5. 当需要自定义 onChange 事件时，组件仍然会自动更新信号值

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Input](INPUT_USAGE.md)
- [Label](LABEL_USAGE.md)
- [Button](BUTTON_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基于 Signal 的双向绑定
- 支持自定义行数和列数
- 支持禁用和只读状态
- 支持表单集成
