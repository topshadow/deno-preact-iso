# Table 组件使用文档

## 组件介绍

Table 组件是一个表格组件，用于展示结构化数据。它包含多个子组件，如 Header、Body、Footer、Row、Head、Cell 和 Caption，支持自定义样式和响应式设计。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Table } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Table } from "@24wings/shadcn";

function MyComponent() {
  const data = [
    { id: 1, name: "张三", email: "zhangsan@example.com" },
    { id: 2, name: "李四", email: "lisi@example.com" },
    { id: 3, name: "王五", email: "wangwu@example.com" },
  ];

  return (
    <Table>
      <Table.Header>
        <Table.Row>
          <Table.Head>ID</Table.Head>
          <Table.Head>姓名</Table.Head>
          <Table.Head>邮箱</Table.Head>
        </Table.Row>
      </Table.Header>
      <Table.Body>
        {data.map((item) => (
          <Table.Row key={item.id}>
            <Table.Cell>{item.id}</Table.Cell>
            <Table.Cell>{item.name}</Table.Cell>
            <Table.Cell>{item.email}</Table.Cell>
          </Table.Row>
        ))}
      </Table.Body>
    </Table>
  );
}
```

## API 文档

### TableProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格内容，通常包含 Header、Body 等子组件 | - |

### Table.HeaderProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格头部内容，通常包含 Table.Row 和 Table.Head | - |

### Table.BodyProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格主体内容，通常包含 Table.Row 和 Table.Cell | - |

### Table.FooterProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格底部内容，通常包含 Table.Row 和 Table.Cell | - |

### Table.RowProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格行内容，通常包含 Table.Head 或 Table.Cell | - |
| `data-state` | `"selected"` | 行的选中状态 | - |

### Table.HeadProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格表头单元格内容 | - |

### Table.CellProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格数据单元格内容 | - |

### Table.CaptionProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 表格标题内容 | - |

## 高级用法

### 带表格标题

```tsx
import { Table } from "@24wings/shadcn";

function TableWithCaption() {
  return (
    <Table>
      <Table.Caption>用户列表</Table.Caption>
      {/* 表格内容 */}
    </Table>
  );
}
```

### 带表格底部

```tsx
import { Table } from "@24wings/shadcn";

function TableWithFooter() {
  return (
    <Table>
      <Table.Header>
        {/* 表头 */}
      </Table.Header>
      <Table.Body>
        {/* 表格内容 */}
      </Table.Body>
      <Table.Footer>
        <Table.Row>
          <Table.Cell colSpan={3} class="text-right">
            总计：3 条记录
          </Table.Cell>
        </Table.Row>
      </Table.Footer>
    </Table>
  );
}
```

### 自定义样式

```tsx
import { Table } from "@24wings/shadcn";

function CustomTable() {
  return (
    <Table class="border border-border rounded-lg">
      <Table.Header class="bg-primary text-primary-foreground">
        <Table.Row class="border-b-0">
          <Table.Head class="text-white">ID</Table.Head>
          <Table.Head class="text-white">姓名</Table.Head>
          <Table.Head class="text-white">邮箱</Table.Head>
        </Table.Row>
      </Table.Header>
      <Table.Body>
        {/* 表格内容 */}
      </Table.Body>
    </Table>
  );
}
```

### 选中状态

```tsx
import { Table } from "@24wings/shadcn";

function TableWithSelection() {
  return (
    <Table>
      <Table.Header>
        {/* 表头 */}
      </Table.Header>
      <Table.Body>
        <Table.Row data-state="selected">
          <Table.Cell>1</Table.Cell>
          <Table.Cell>选中行</Table.Cell>
          <Table.Cell>selected@example.com</Table.Cell>
        </Table.Row>
        <Table.Row>
          <Table.Cell>2</Table.Cell>
          <Table.Cell>普通行</Table.Cell>
          <Table.Cell>normal@example.com</Table.Cell>
        </Table.Row>
      </Table.Body>
    </Table>
  );
}
```

## 注意事项

1. Table 组件默认带有水平滚动条，适合展示大量列的数据
2. 支持响应式设计，可以在不同屏幕尺寸下正常显示
3. 行支持 hover 效果，提升用户体验
4. 支持选中状态，适合用于表格行选择功能
5. 可以通过自定义类名调整表格样式

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Card](CARD_USAGE.md)
- [Pagination](PAGINATION_USAGE.md) (开发中)

## 更新日志

### v1.0.0
- 初始版本
- 支持完整的表格结构
- 包含 Header、Body、Footer、Row、Head、Cell 和 Caption 子组件
- 支持自定义样式
- 支持选中状态
