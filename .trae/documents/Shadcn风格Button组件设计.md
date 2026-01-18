# Shadcn风格Button组件设计

## 1. 组件概述
设计一个符合shadcn风格的Button组件，具有多种变体、尺寸和状态，保持与现有设计系统的一致性。

## 2. 组件结构
```tsx
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "../utils/cn.tsx";
import type { JSX } from "preact/jsx-runtime";

export const button = cva([
  "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
], {
  variants: {
    variant: {
      // 主要变体
      default: ["bg-primary text-primary-foreground hover:bg-primary/90"],
      destructive: ["bg-destructive text-destructive-foreground hover:bg-destructive/90"],
      outline: ["border border-input bg-background hover:bg-accent hover:text-accent-foreground"],
      secondary: ["bg-secondary text-secondary-foreground hover:bg-secondary/80"],
      ghost: ["hover:bg-accent hover:text-accent-foreground"],
      link: ["text-primary underline-offset-4 hover:underline"],
      // 新增变体
      success: ["bg-success text-success-foreground hover:bg-success/90"],
      warning: ["bg-warning text-warning-foreground hover:bg-warning/90"],
      info: ["bg-info text-info-foreground hover:bg-info/90"],
    },
    size: {
      default: ["h-10 px-4 py-2"],
      sm: ["h-9 rounded-md px-3 text-xs sm:text-sm"],
      lg: ["h-11 rounded-md px-8"],
      icon: ["h-10 w-10"],
      // 新增尺寸
      xl: ["h-12 rounded-md px-10 text-base"],
      xs: ["h-8 rounded-md px-2 text-xs"],
    },
    // 新增变体
    rounded: {
      default: ["rounded-md"],
      full: ["rounded-full"],
      lg: ["rounded-lg"],
      sm: ["rounded-sm"],
    },
    // 新增变体
    loading: {
      true: ["relative overflow-hidden"],
      false: [],
    },
  },
  compoundVariants: [
    // 图标按钮的特殊处理
    { size: "icon", rounded: "default", class: ["rounded-full"] },
    // 加载状态下的按钮样式
    { loading: true, class: ["disabled:opacity-100"] },
  ],
  defaultVariants: {
    variant: "default",
    size: "default",
    rounded: "default",
    loading: false,
  },
});

export type ButtonProps = 
  & VariantProps<typeof button>
  & JSX.IntrinsicElements["button"]
  & {
    // 新增属性
    loading?: boolean;
    leftIcon?: ComponentChildren;
    rightIcon?: ComponentChildren;
  };

export const Button = ({
  size,
  variant,
  rounded,
  loading,
  leftIcon,
  rightIcon,
  children,
  type,
  ...opt
}: ButtonProps = {}) => {
  return (
    <button
      type={type || "button"}
      {...opt}
      class={cn(button({ size, variant, rounded, loading }), opt.class)}
    >
      {loading && (
        <span className="mr-2 h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" aria-hidden="true" />
      )}
      {leftIcon && <span className="mr-2">{leftIcon}</span>}
      {children}
      {rightIcon && <span className="ml-2">{rightIcon}</span>}
    </button>
  );
};
```

## 3. 设计特点

### 3.1 变体设计（Variant）
- **default**: 主要按钮，使用主色调
- **destructive**: 危险操作按钮，使用红色
- **outline**: 描边按钮，透明背景
- **secondary**: 次要按钮，使用次要色调
- **ghost**: 幽灵按钮，仅在悬停时显示背景
- **link**: 链接样式按钮，带下划线
- **success**: 成功操作按钮，使用绿色
- **warning**: 警告操作按钮，使用黄色
- **info**: 信息按钮，使用蓝色

### 3.2 尺寸设计（Size）
- **xs**: 超小尺寸，适合紧凑布局
- **sm**: 小尺寸，适合辅助操作
- **default**: 默认尺寸，适合大多数场景
- **lg**: 大尺寸，适合强调操作
- **xl**: 超大尺寸，适合重要操作
- **icon**: 图标按钮，圆形，仅包含图标

### 3.3 圆角设计（Rounded）
- **sm**: 小圆角
- **default**: 默认圆角
- **lg**: 大圆角
- **full**: 圆形按钮

### 3.4 状态设计
- **hover**: 悬停状态，背景色透明度变化
- **focus**: 聚焦状态，显示环形焦点指示器
- **active**: 激活状态，使用默认浏览器行为
- **disabled**: 禁用状态，降低不透明度，禁用指针事件
- **loading**: 加载状态，显示旋转动画

### 3.5 可访问性考虑
- 使用原生button元素
- 支持aria属性
- 聚焦状态有明显视觉反馈
- 禁用状态有明确的视觉提示
- 加载状态有适当的aria标签

## 4. 使用示例

### 4.1 基本使用
```tsx
<Button>默认按钮</Button>
<Button variant="destructive">危险按钮</Button>
<Button variant="outline">描边按钮</Button>
```

### 4.2 带图标的按钮
```tsx
<Button leftIcon={<Icons.Search />}>搜索</Button>
<Button rightIcon={<Icons.ChevronRight />}>下一步</Button>
<Button variant="ghost" size="icon"><Icons.MoreHorizontal /></Button>
```

### 4.3 不同尺寸的按钮
```tsx
<Button size="xs">超小按钮</Button>
<Button size="sm">小按钮</Button>
<Button size="default">默认按钮</Button>
<Button size="lg">大按钮</Button>
<Button size="xl">超大按钮</Button>
```

### 4.4 加载状态的按钮
```tsx
<Button loading>加载中...</Button>
<Button variant="destructive" loading>删除中...</Button>
```

### 4.5 不同圆角的按钮
```tsx
<Button rounded="sm">小圆角</Button>
<Button rounded="default">默认圆角</Button>
<Button rounded="lg">大圆角</Button>
<Button rounded="full">圆形按钮</Button>
```

## 5. 设计系统集成
- 与现有设计系统的颜色变量保持一致
- 使用相同的字体和间距系统
- 与其他shadcn组件保持视觉一致性

## 6. 响应式设计
- 文本大小使用rem单位，支持响应式缩放
- 按钮尺寸在不同屏幕尺寸下保持协调
- 图标按钮在小屏幕上保持可用性

## 7. 性能优化
- 使用class-variance-authority库优化类名生成
- 避免不必要的重渲染
- 优化加载状态的动画性能

## 8. 测试计划
- 测试所有变体和尺寸的视觉表现
- 测试各种状态下的交互效果
- 测试响应式表现
- 测试可访问性
- 测试与其他组件的集成

## 9. 文档计划
- 组件API文档
- 使用示例
- 变体和尺寸参考
- 可访问性指南
- 最佳实践建议