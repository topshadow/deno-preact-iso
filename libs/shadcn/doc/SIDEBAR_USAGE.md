# Sidebar 组件使用文档

## 组件介绍

Sidebar 组件是一个侧边栏组件，用于创建具有侧边导航的布局。它包含 Panel 和 Content 两个子组件，支持响应式设计和自定义样式。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Sidebar } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Sidebar } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function MyComponent() {
  const isOpen = useSignal(true);

  return (
    <Sidebar open={isOpen}>
      <Sidebar.Panel>
        <div class="p-4 border-b">
          <h2 class="font-bold text-lg">侧边栏标题</h2>
        </div>
        <Sidebar.Content>
          <nav>
            <ul class="space-y-2">
              <li><a href="#" class="block p-2 hover:bg-accent rounded">菜单项 1</a></li>
              <li><a href="#" class="block p-2 hover:bg-accent rounded">菜单项 2</a></li>
              <li><a href="#" class="block p-2 hover:bg-accent rounded">菜单项 3</a></li>
            </ul>
          </nav>
        </Sidebar.Content>
      </Sidebar.Panel>
      <main class="flex-1 p-4">
        <h1>主内容区域</h1>
        <p>这是侧边栏布局的主内容区域。</p>
      </main>
    </Sidebar>
  );
}
```

## API 文档

### SidebarProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `open` | `Signal<boolean>` | 侧边栏的打开状态信号 | 必须 |
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 侧边栏内容，通常包含 Sidebar.Panel 和主内容区域 | - |

### Sidebar.PanelProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 侧边栏面板内容，通常包含标题和导航菜单 | - |

### Sidebar.ContentProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `class` | `string` | 自定义类名 | - |
| `children` | `ReactNode` | 侧边栏内容区域，通常包含导航菜单 | - |

## 高级用法

### 自定义样式

```tsx
import { Sidebar } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function CustomSidebar() {
  const isOpen = useSignal(true);

  return (
    <Sidebar open={isOpen} class="bg-gray-50">
      <Sidebar.Panel class="bg-blue-600 text-white">
        <Sidebar.Content class="text-white">
          {/* 导航内容 */}
        </Sidebar.Content>
      </Sidebar.Panel>
      <main class="flex-1 p-4">
        {/* 主内容 */}
      </main>
    </Sidebar>
  );
}
```

### 响应式侧边栏

```tsx
import { Sidebar, Button, Icons } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function ResponsiveSidebar() {
  const isOpen = useSignal(true);

  return (
    <Sidebar open={isOpen}>
      <Sidebar.Panel>
        <div class="flex items-center justify-between p-4 border-b">
          <h2 class="font-bold">侧边栏</h2>
          <Button 
            variant="ghost" 
            size="icon" 
            onClick={() => isOpen.value = !isOpen.value}
          >
            <Icons.X />
          </Button>
        </div>
        <Sidebar.Content>
          {/* 导航内容 */}
        </Sidebar.Content>
      </Sidebar.Panel>
      <div class="flex-1 flex flex-col">
        <header class="p-4 border-b flex items-center justify-between">
          <h1>主内容</h1>
          <Button 
            variant="ghost" 
            size="icon" 
            onClick={() => isOpen.value = !isOpen.value}
          >
            <Icons.Menu />
          </Button>
        </header>
        <main class="flex-1 p-4">
          {/* 主内容 */}
        </main>
      </div>
    </Sidebar>
  );
}
```

## 注意事项

1. Sidebar 组件需要一个 `open` 信号来管理侧边栏的状态
2. 建议将 Sidebar.Panel 用于侧边导航，主内容区域放在 Sidebar 组件的子元素中
3. 支持自定义样式，可以通过 `class` 属性调整外观
4. 适合用于管理后台、仪表盘等复杂应用的布局

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
- 支持侧边栏布局
- 包含 Panel 和 Content 子组件
- 支持自定义样式
