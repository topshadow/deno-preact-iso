# Accordion 组件使用文档

## 组件介绍

Accordion 组件是一个手风琴组件，用于折叠/展开内容。它支持单个展开项，使用 Preact Signals 管理状态，提供了简洁的 API 和良好的用户体验。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Accordion } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Accordion } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const activeItem = useSignal("item1");

  return (
    <Accordion value={activeItem}>
      <Accordion.Item name="item1">
        <Accordion.Trigger>项目 1</Accordion.Trigger>
        <Accordion.Content>
          这是项目 1 的内容，可以包含任何 HTML 元素或组件。
        </Accordion.Content>
      </Accordion.Item>
      
      <Accordion.Item name="item2">
        <Accordion.Trigger>项目 2</Accordion.Trigger>
        <Accordion.Content>
          这是项目 2 的内容，支持多行文本和复杂布局。
        </Accordion.Content>
      </Accordion.Item>
      
      <Accordion.Item name="item3">
        <Accordion.Trigger>项目 3</Accordion.Trigger>
        <Accordion.Content>
          这是项目 3 的内容，可以嵌套其他组件。
        </Accordion.Content>
      </Accordion.Item>
    </Accordion>
  );
}
```

## API 文档

### AccordionProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `value` | `Signal<string>` | 当前激活项的信号，用于控制哪个项展开 | 必须 |
| `children` | `ComponentChildren` | 手风琴内容，通常是 `Accordion.Item` 组件 | - |

### Accordion.ItemProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `name` | `string` | 项的唯一标识符，用于与 `value` 信号比较 | 必须 |
| `children` | `ComponentChildren` | 项内容，包括 `Accordion.Trigger` 和 `Accordion.Content` | - |

### Accordion.TriggerProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `children` | `ComponentChildren` | 触发按钮的内容 | - |

### Accordion.ContentProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `children` | `ComponentChildren` | 折叠/展开的内容 | - |

## 高级用法

### 初始状态设置

```tsx
import { Accordion } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  // 设置初始激活项为 item2
  const activeItem = useSignal("item2");

  return (
    <Accordion value={activeItem}>
      {/* 手风琴内容 */}
    </Accordion>
  );
}
```

### 动态添加/移除项

```tsx
import { Accordion } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function DynamicAccordion() {
  const activeItem = useSignal("item1");
  const items = useSignal([
    { id: "item1", title: "项目 1", content: "内容 1" },
    { id: "item2", title: "项目 2", content: "内容 2" },
  ]);

  const addItem = () => {
    const newId = `item${items.value.length + 1}`;
    items.value = [...items.value, {
      id: newId,
      title: `项目 ${items.value.length + 1}`,
      content: `内容 ${items.value.length + 1}`
    }];
  };

  return (
    <div>
      <button onClick={addItem}>添加项目</button>
      <Accordion value={activeItem}>
        {items.value.map(item => (
          <Accordion.Item key={item.id} name={item.id}>
            <Accordion.Trigger>{item.title}</Accordion.Trigger>
            <Accordion.Content>{item.content}</Accordion.Content>
          </Accordion.Item>
        ))}
      </Accordion>
    </div>
  );
}
```

### 自定义样式

```tsx
import { Accordion } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomAccordion() {
  const activeItem = useSignal("item1");

  return (
    <Accordion value={activeItem}>
      <Accordion.Item name="item1">
        <Accordion.Trigger class="text-lg font-bold">
          自定义标题样式
        </Accordion.Trigger>
        <Accordion.Content class="p-6 bg-gray-50">
          <p>自定义内容样式，包含内边距和背景色。</p>
        </Accordion.Content>
      </Accordion.Item>
    </Accordion>
  );
}
```

## 注意事项

1. Accordion 组件依赖 Preact Signals，必须使用 `useSignal` 创建值信号
2. 每次只能展开一个项，这是设计限制
3. `Accordion.Item` 的 `name` 属性必须唯一，用于标识当前展开的项
4. 组件会自动处理展开/折叠的动画效果
5. 支持键盘导航，按上下箭头可以切换项目

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
- 支持单个展开项
- 支持 Preact Signals 状态管理
- 包含动画过渡效果
- 支持键盘导航
