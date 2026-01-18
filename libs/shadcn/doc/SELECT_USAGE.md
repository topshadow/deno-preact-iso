# Select 组件使用文档

## 组件介绍

Select 组件是基于 Preact 和 Preact Signals 构建的自定义下拉选择组件，用于在表单中提供选择功能。与 shadcn 官方 Select 组件不同，本组件使用信号（Signal）管理状态，提供更简洁的 API。

## 安装和导入

### 安装

该组件是 `@24wings/shadcn` 包的一部分，无需单独安装。

### 导入

```tsx
import { Select } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { useSignal } from "@preact/signals";
import { Select } from "@24wings/shadcn";

function MyComponent() {
  // 使用信号管理选中值
  const selectedValue = useSignal("option1");

  return (
    <Select
      value={selectedValue}
      options={[
        { value: "option1", label: "选项 1" },
        { value: "option2", label: "选项 2" },
        { value: "option3", label: "选项 3" }
      ]}
      placeholder="请选择一个选项"
    />
  );
}
```

## API 文档

### SelectProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `value` | `Signal<string  number>` | 选中值的信号，用于双向绑定 | 必须 |
| `options` | `SelectOption[]` | 选项数组 | `[]` |
| `placeholder` | `string` | 占位文本 | `"选择一个选项"` |
| `disabled` | `boolean` | 是否禁用组件 | `false` |
| `isOpen` | `Signal<boolean>` | 外部控制下拉菜单的打开状态 | 内部管理 |
| `class` | `string` | 自定义类名 | - |
| `children` | `ComponentChild` | 自定义子元素（用于兼容性） | - |

### SelectOption

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `string  number` | 选项的值 |
| `label` | `string` | 选项的显示文本 |
| `disabled` | `boolean` | 是否禁用该选项 |

## 高级用法

### 外部控制打开状态

```tsx
import { useSignal } from "@preact/signals";
import { Select } from "@24wings/shadcn";

function MyComponent() {
  const selectedValue = useSignal("option1");
  const isOpen = useSignal(false);

  return (
    <div>
      <button onClick={() => (isOpen.value = !isOpen.value)}>
        切换下拉菜单
      </button>
      <Select
        value={selectedValue}
        options={[
          { value: "option1", label: "选项 1" },
          { value: "option2", label: "选项 2" }
        ]}
        isOpen={isOpen}
      />
    </div>
  );
}
```

### 禁用特定选项

```tsx
<Select
  value={selectedValue}
  options={[
    { value: "option1", label: "可用选项" },
    { value: "option2", label: "禁用选项", disabled: true },
    { value: "option3", label: "另一个可用选项" }
  ]}
/>
```

### 与表单集成

```tsx
import { useSignal } from "@preact/signals";
import { Select, Button, Input } from "@24wings/shadcn";

function FormComponent() {
  const name = useSignal("");
  const gender = useSignal("");
  
  const handleSubmit = (e: Event) => {
    e.preventDefault();
    console.log({ name: name.value, gender: gender.value });
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="mb-4">
        <label>姓名</label>
        <Input value={name} placeholder="请输入姓名" />
      </div>
      
      <div className="mb-4">
        <label>性别</label>
        <Select
          value={gender}
          options={[
            { value: "male", label: "男" },
            { value: "female", label: "女" }
          ]}
          placeholder="请选择性别"
        />
      </div>
      
      <Button type="submit">提交</Button>
    </form>
  );
}
```

## 注意事项

1. 该组件依赖 Preact Signals，必须使用 `useSignal` 创建值信号
2. 与 shadcn 官方 Select 组件 API 不兼容，请注意区分
3. 组件会自动处理外部点击关闭下拉菜单的逻辑
4. 支持键盘导航（上下箭头选择，Enter 确认，Esc 关闭）
5. 组件会渲染一个隐藏的 `<select>` 元素，用于表单兼容性

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 示例截图

![Select 组件示例](https://via.placeholder.com/400x200?text=Select+Component+Example)

## 相关组件

- [Input](INPUT_USAGE.md)
- [Button](BUTTON_USAGE.md)
- [Label](LABEL_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基本选择功能
- 支持信号管理状态
- 支持外部控制打开状态
- 支持禁用选项

### v1.0.1
- 修复键盘导航问题
- 优化样式
- 增加表单兼容性

## 贡献

如有问题或建议，请提交 Issue 或 Pull Request。
