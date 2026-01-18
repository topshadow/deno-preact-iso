# Card 组件使用文档

## 组件介绍

Card 组件是一个卡片组件，用于展示内容块。它包含了 Header、Title、Description、Content 和 Footer 子组件，可以灵活组合使用，适合展示各种类型的内容。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Card } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Card } from "@24wings/shadcn";

function MyComponent() {
  return (
    <Card>
      <Card.Header>
        <Card.Title>卡片标题</Card.Title>
        <Card.Description>这是卡片的描述信息</Card.Description>
      </Card.Header>
      <Card.Content>
        <p>卡片内容区域，可以包含任何 HTML 元素或组件。</p>
        <p>支持多行文本和复杂布局。</p>
      </Card.Content>
      <Card.Footer>
        <div class="text-sm text-muted-foreground">卡片底部</div>
      </Card.Footer>
    </Card>
  );
}
```

## API 文档

### CardProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片内容，通常包含 Card 的子组件 | - |

### Card.HeaderProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片头部内容，通常包含 Card.Title 和 Card.Description | - |

### Card.TitleProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片标题内容 | - |

### Card.DescriptionProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片描述内容 | - |

### Card.ContentProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片内容区域 | - |

### Card.FooterProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 卡片底部内容 | - |

## 高级用法

### 自定义样式

```tsx
import { Card } from "@24wings/shadcn";

function CustomCard() {
  return (
    <Card class="border-2 border-blue-500 shadow-lg">
      <Card.Header>
        <Card.Title>自定义卡片</Card.Title>
      </Card.Header>
      <Card.Content>
        <p>这是一个带有自定义样式的卡片。</p>
      </Card.Content>
    </Card>
  );
}
```

### 带有图片的卡片

```tsx
import { Card } from "@24wings/shadcn";

function CardWithImage() {
  return (
    <Card>
      <img 
        src="https://via.placeholder.com/400x200" 
        alt="卡片图片" 
        class="w-full h-48 object-cover rounded-t-xl"
      />
      <Card.Content>
        <p>带有图片的卡片示例。</p>
      </Card.Content>
    </Card>
  );
}
```

### 卡片网格布局

```tsx
import { Card } from "@24wings/shadcn";

function CardGrid() {
  return (
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      {[1, 2, 3, 4, 5, 6].map((item) => (
        <Card key={item}>
          <Card.Header>
            <Card.Title>卡片 {item}</Card.Title>
          </Card.Header>
          <Card.Content>
            <p>这是卡片 {item} 的内容。</p>
          </Card.Content>
        </Card>
      ))}
    </div>
  );
}
```

### 卡片内的表单

```tsx
import { Card, Input, Button, Label } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CardForm() {
  const name = useSignal("");
  const email = useSignal("");

  return (
    <Card>
      <Card.Header>
        <Card.Title>联系表单</Card.Title>
        <Card.Description>请填写以下信息与我们联系</Card.Description>
      </Card.Header>
      <Card.Content class="space-y-4">
        <div>
          <Label for="name">姓名</Label>
          <Input id="name" value={name} placeholder="请输入姓名" />
        </div>
        <div>
          <Label for="email">邮箱</Label>
          <Input id="email" type="email" value={email} placeholder="请输入邮箱" />
        </div>
      </Card.Content>
      <Card.Footer>
        <Button>提交</Button>
      </Card.Footer>
    </Card>
  );
}
```

## 注意事项

1. Card 组件默认带有边框、阴影和圆角，适合用于展示独立内容块
2. 建议使用 Card 的子组件（Header、Title、Description、Content、Footer）来构建卡片结构
3. 可以根据需要自定义卡片样式，包括颜色、阴影、边框等
4. 支持响应式设计，可以在不同屏幕尺寸下正常显示
5. 可以嵌套其他组件，构建复杂的 UI 界面

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Button](BUTTON_USAGE.md)
- [Input](INPUT_USAGE.md)
- [Label](LABEL_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持卡片基本结构
- 包含 Header、Title、Description、Content、Footer 子组件
- 支持自定义样式
- 支持响应式设计
