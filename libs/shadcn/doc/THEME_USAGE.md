# Theme 组件使用文档

## 组件介绍

Theme 组件是一个主题管理组件，用于管理应用的深色/浅色模式和颜色主题。它使用 Preact Signals 管理状态，提供了 ThemeContext 来在应用中共享主题状态，并自动将主题应用到文档中。

## 安装和导入

### 安装

```bash
deno add @24wings/shadcn
```

### 导入

```tsx
import { Theme, ThemeContext, ThemeEnum } from "@24wings/shadcn";
```

## 基本用法

### 示例代码

```tsx
import { Theme, ThemeContext, ThemeEnum } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function App() {
  const isDark = useSignal(false);
  const colorTheme = useSignal(ThemeEnum.default);

  return (
    <ThemeContext.Provider value={{ is_dark: isDark, color: colorTheme }}>
      <Theme />
      <div>
        {/* 应用内容 */}
      </div>
    </ThemeContext.Provider>
  );
}
```

## API 文档

### ThemeContext

| 属性 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `is_dark` | `Signal<boolean>` | 深色模式状态信号 | `false` |
| `color` | `Signal<ThemeEnum>` | 颜色主题信号 | `ThemeEnum.default` |

### ThemeEnum

| 值 | 描述 |
|-----|------|
| `default` | 默认主题 |
| `blue` | 蓝色主题 |
| `green` | 绿色主题 |
| `orange` | 橙色主题 |
| `red` | 红色主题 |
| `rose` | 玫瑰色主题 |
| `violet` | 紫色主题 |
| `yellow` | 黄色主题 |

### ThemeProps

| 参数 | 类型 | 描述 | 默认值 |
|------|------|------|--------|
| `children` | `ReactNode` | 组件子元素 | - |

## 高级用法

### 在组件中访问和修改主题

```tsx
import { ThemeContext, Button, Icons } from "@24wings/shadcn";
import { useContext } from "preact/hooks";

function ThemeToggle() {
  const { is_dark, color } = useContext(ThemeContext);

  return (
    <div class="flex gap-2">
      <Button 
        variant="ghost" 
        size="icon" 
        onClick={() => is_dark.value = !is_dark.value}
      >
        {is_dark.value ? <Icons.Sun /> : <Icons.Moon />}
      </Button>
      
      <select 
        value={color.value} 
        onChange={(e) => color.value = e.target.value as ThemeEnum}
      >
        <option value={ThemeEnum.default}>默认</option>
        <option value={ThemeEnum.blue}>蓝色</option>
        <option value={ThemeEnum.green}>绿色</option>
        <option value={ThemeEnum.orange}>橙色</option>
        <option value={ThemeEnum.red}>红色</option>
        <option value={ThemeEnum.rose}>玫瑰色</option>
        <option value={ThemeEnum.violet}>紫色</option>
        <option value={ThemeEnum.yellow}>黄色</option>
      </select>
    </div>
  );
}
```

### 主题切换按钮

```tsx
import { ThemeContext, Button, Icons } from "@24wings/shadcn";
import { useContext } from "preact/hooks";

function DarkModeToggle() {
  const { is_dark } = useContext(ThemeContext);

  return (
    <Button 
      variant="ghost" 
      size="icon" 
      onClick={() => is_dark.value = !is_dark.value}
      class="rounded-full"
    >
      {is_dark.value ? (
        <Icons.Sun size={18} />
      ) : (
        <Icons.Moon size={18} />
      )}
    </Button>
  );
}
```

### 颜色主题选择器

```tsx
import { ThemeContext, ThemeEnum } from "@24wings/shadcn";
import { useContext } from "preact/hooks";

function ColorThemeSelector() {
  const { color } = useContext(ThemeContext);

  const themes = [
    { value: ThemeEnum.default, label: "默认" },
    { value: ThemeEnum.blue, label: "蓝色" },
    { value: ThemeEnum.green, label: "绿色" },
    { value: ThemeEnum.orange, label: "橙色" },
    { value: ThemeEnum.red, label: "红色" },
    { value: ThemeEnum.rose, label: "玫瑰色" },
    { value: ThemeEnum.violet, label: "紫色" },
    { value: ThemeEnum.yellow, label: "黄色" },
  ];

  return (
    <div class="flex gap-2 flex-wrap">
      {themes.map((theme) => (
        <button
          key={theme.value}
          onClick={() => color.value = theme.value}
          class={`px-3 py-1 rounded-full text-sm ${color.value === theme.value ? 'bg-primary text-primary-foreground' : 'bg-secondary text-secondary-foreground hover:bg-secondary/80'}`}
        >
          {theme.label}
        </button>
      ))}
    </div>
  );
}
```

## 注意事项

1. Theme 组件需要在 ThemeContext.Provider 内部使用
2. 确保在应用的根组件中包裹 ThemeContext.Provider
3. Theme 组件会自动将主题应用到 document.body 上
4. 深色模式通过添加/移除 `dark` 类名到 body 元素实现
5. 颜色主题通过修改 id 为 `color` 的 link 元素的 href 属性实现
6. 支持的颜色主题有：default、blue、green、orange、red、rose、violet、yellow

## 浏览器兼容性

- Chrome (推荐)
- Firefox
- Safari
- Edge

## 相关组件

- [Icons](ICONS_USAGE.md)
- [Button](BUTTON_USAGE.md)

## 更新日志

### v1.0.0
- 初始版本
- 支持深色/浅色模式切换
- 支持 8 种颜色主题
- 使用 Preact Signals 管理状态
- 提供 ThemeContext 用于主题共享
