# DropdownMenu 组件使用文档

## 组件介绍

DropdownMenu 组件是一个下拉菜单组件，用于显示选项列表。它包含 Trigger、Content 和 Item 三个子组件，使用 Preact Signals 管理状态，提供了简洁的 API 和良好的用户体验。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { DropdownMenu } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { DropdownMenu } from "@24wings/shadcn";

function MyComponent() {
  return (
    <DropdownMenu id="my-dropdown">
      <DropdownMenu.Trigger>下拉菜单</DropdownMenu.Trigger>
      <DropdownMenu.Content>
        <DropdownMenu.Item href="#">选项 1</DropdownMenu.Item>
        <DropdownMenu.Item href="#">选项 2</DropdownMenu.Item>
        <DropdownMenu.Item href="#">选项 3</DropdownMenu.Item>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

## API 文档

### DropdownMenuProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `id` | `string` | 下拉菜单的唯一标识符 | 必须 |
| `open` | `boolean` | 初始打开状态 | `false` |
| `children` | `ReactNode` | 下拉菜单内容，通常包含 Trigger 和 Content 子组件 | - |

### DropdownMenu.TriggerProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 触发按钮内容 | - |
| `onClick` | `(event: MouseEvent) => void` | 点击事件处理函数 | - |

### DropdownMenu.ContentProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 下拉菜单内容，通常包含 Item 子组件 | - |

### DropdownMenu.ItemProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 菜单项内容 | - |
| `href` | `string` | 菜单项链接地址 | - |
| `onClick` | `(event: MouseEvent) => void` | 点击事件处理函数 | - |

## 高级用法

### 自定义样式

```tsx
import { DropdownMenu } from "@24wings/shadcn";

function CustomDropdown() {
  return (
    <DropdownMenu id="custom-dropdown">
      <DropdownMenu.Trigger class="bg-primary text-primary-foreground hover:bg-primary/90">
        自定义下拉菜单
      </DropdownMenu.Trigger>
      <DropdownMenu.Content class="bg-blue-50 border-blue-200">
        <DropdownMenu.Item class="hover:bg-blue-100">选项 1</DropdownMenu.Item>
        <DropdownMenu.Item class="hover:bg-blue-100">选项 2</DropdownMenu.Item>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

### 初始打开状态

```tsx
import { DropdownMenu } from "@24wings/shadcn";

function InitiallyOpenDropdown() {
  return (
    <DropdownMenu id="open-dropdown" open={true}>
      <DropdownMenu.Trigger>初始打开的下拉菜单</DropdownMenu.Trigger>
      <DropdownMenu.Content>
        <DropdownMenu.Item href="#">选项 1</DropdownMenu.Item>
        <DropdownMenu.Item href="#">选项 2</DropdownMenu.Item>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

### 带图标的菜单项

```tsx
import { DropdownMenu } from "@24wings/shadcn";

function DropdownWithIcons() {
  return (
    <DropdownMenu id="icon-dropdown">
      <DropdownMenu.Trigger>带图标菜单</DropdownMenu.Trigger>
      <DropdownMenu.Content>
        <DropdownMenu.Item href="#">
          <svg width="16" height="16" class="mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
          </svg>
          编辑
        </DropdownMenu.Item>
        <DropdownMenu.Item href="#">
          <svg width="16" height="16" class="mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
          </svg>
          删除
        </DropdownMenu.Item>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

## 注意事项

1. DropdownMenu 组件需要一个唯一的 `id` 属性
2. 菜单项默认是 `<a>` 标签，可以通过 `href` 属性设置链接
3. 组件使用 Preact Signals 管理状态，无需手动处理打开/关闭逻辑
4. 支持自定义样式，可以通过 `class` 属性调整外观
5. 下拉菜单默认带有阴影和边框，适合用于导航或操作菜单

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Icons](ICONS_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持基本下拉菜单功能
- 包含 Trigger、Content 和 Item 子组件
- 支持自定义样式
- 支持初始打开状态
