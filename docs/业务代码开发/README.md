# 业务代码开发的核心规范和最佳实践

## 1. 技术栈概述

| 技术 | 用途 | 溯源 |
|------|------|------|
| Preact | 前端框架 | `plugins/admin/deno.json` |
| TypeScript | 类型安全 | 项目配置 |
| Preact Signals | 状态管理 | `plugins/admin/deno.json` |
| shadcn | UI 组件库 | `libs/shadcn/` |
| ORPC | API 通信 | `plugins/admin/orpc-client.ts` |
| Zod | 数据验证 | `plugins/admin/api/` |
| Tailwind CSS | 样式框架 | 项目配置 |

## 2. 文件结构规范

### 2.1 标准目录结构

```
plugins/[业务模块]/
├── api/             # API 定义和实现
│   ├── mod.ts       # API 入口
│   ├── types.ts     # 类型定义
│   └── [业务].ts    # 具体业务 API
├── app/             # 前端应用代码
│   ├── data/        # 静态数据
│   ├── routes/      # 路由组件
│   │   └── [业务]/  # 业务组件
│   ├── App.tsx      # 应用入口
│   └── client.tsx   # 客户端入口
├── orpc-client.ts   # ORPC 客户端
└── plugin.ts        # 插件入口
```

### 2.2 组件命名规范

- 组件文件使用 **PascalCase**：`DataSourcePage.tsx`
- 目录使用 **kebab-case**：`data-source/`
- 组件名称与文件名一致

## 3. 开发核心规范

### 3.1 JSX 语法规范

✅ **使用 class 而不是 className**

```tsx
// ✅ 推荐
<div class="container">内容</div>

// ❌ 避免
<div className="container">内容</div>
```

### 3.2 组件设计原则

**核心原则：拆分组件，避免大函数组件**

- 将功能拆分为多个小组件
- 组件职责单一
- 支持自定义属性
- 包含完整的类型定义

#### 组件拆分示例

```tsx
// 主页面组件
function DataSourcePage() {
  return (
    <div class="page">
      <PageHeader title="数据源管理" />
      <DataSourceTable data={data} />
      <DataSourceForm isOpen={isOpen} />
    </div>
  );
}

// 子组件 - 表格
function DataSourceTable({ data }: { data: Data[] }) {
  return <table class="table">{/* 表格内容 */}</table>;
}

// 子组件 - 表单
function DataSourceForm({ isOpen }: { isOpen: Signal<boolean> }) {
  return <Dialog open={isOpen}>{/* 表单内容 */}</Dialog>;
}
```

### 3.3 状态管理

**使用 Preact Signals 进行状态管理**

```tsx
import { useSignal } from "@preact/signals";

function MyComponent() {
  // 基本类型
  const count = useSignal(0);
  
  // 对象类型
  const user = useSignal({ name: "", email: "" });
  
  // 数组类型
  const items = useSignal<Item[]>([]);
  
  // 更新状态
  const increment = () => {
    count.value++;
  };
  
  return (
    <div class="container">
      <button class="btn" onClick={increment}>
        Count: {count}
      </button>
    </div>
  );
}
```

### 3.4 Dialog 组件使用规范

**使用 shadcn Dialog 组件，结合 Signal 管理状态**

```tsx
import { Dialog, Button } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function DialogExample() {
  // 控制对话框显示状态
  const isOpen = useSignal(false);
  
  return (
    <div class="container">
      <Button onClick={() => isOpen.value = true}>
        打开对话框
      </Button>
      
      {/* Dialog 组件使用 */}
      <Dialog open={isOpen}>
        <Dialog.Content>
          <Dialog.Header>对话框标题</Dialog.Header>
          <Dialog.Body>
            对话框内容
          </Dialog.Body>
          <Dialog.Footer>
            <Button variant="outline" onClick={() => isOpen.value = false}>
              取消
            </Button>
            <Button onClick={() => isOpen.value = false}>
              确定
            </Button>
          </Dialog.Footer>
        </Dialog.Content>
      </Dialog>
    </div>
  );
}
```

### 3.5 表单处理规范

**使用 Signal 管理表单数据，结合组件库表单组件**

```tsx
import { Input, Button, Label } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

function FormExample() {
  // 表单数据管理
  const name = useSignal("");
  const email = useSignal("");
  
  const handleSubmit = () => {
    // 表单验证
    if (!name.value) {
      alert("请输入名称");
      return;
    }
    
    // 提交表单数据
    console.log({ name: name.value, email: email.value });
  };
  
  return (
    <div class="form-container">
      <div class="space-y-2">
        <Label>名称</Label>
        <Input value={name} placeholder="请输入名称" />
      </div>
      
      <div class="space-y-2">
        <Label>邮箱</Label>
        <Input type="email" value={email} placeholder="请输入邮箱" />
      </div>
      
      <div class="mt-4">
        <Button onClick={handleSubmit}>提交</Button>
      </div>
    </div>
  );
}
```

## 4. API 通信规范

### 4.1 ORPC 客户端使用

```tsx
import { orpc_client } from "../orpc-client.ts";

async function fetchData() {
  try {
    const result = await orpc_client.[业务模块].[api_method](params);
    if (result.ok) {
      // 处理成功结果
      return result.data;
    } else {
      // 处理错误
      alert(`请求失败: ${result.msg}`);
    }
  } catch (error) {
    // 处理异常
    alert(`异常: ${(error as Error).message}`);
  }
}
```

### 4.2 API 定义规范

```tsx
// api/types.ts
import { z } from "zod";

export const UserSchema = z.object({
  id: z.number(),
  name: z.string(),
  email: z.string().email(),
});

export type User = z.infer<typeof UserSchema>;

// api/user.ts
export const userApi = {
  list_users: {
    input: z.object({ page: z.number(), pageSize: z.number() }),
    output: z.object({
      users: z.array(UserSchema),
      total: z.number(),
    }),
  },
};
```

## 5. 组件库使用

### 5.1 shadcn 组件使用

| 组件 | 用途 | 使用示例 |
|------|------|----------|
| Button | 按钮 | `<Button variant="default">确定</Button>` |
| Input | 输入框 | `<Input value={signal} placeholder="请输入" />` |
| Select | 选择器 | `<Select value={signal} options={[]} />` |
| Dialog | 对话框 | `<Dialog open={signal}>` |
| Card | 卡片 | `<Card><Card.Content>内容</Card.Content></Card>` |
| Table | 表格 | `<Table><Table.Header>...</Table.Header></Table>` |

### 5.2 组件库文档

- **组件库入口**：`libs/shadcn/doc/INDEX.md`
- **组件详细文档**：`libs/shadcn/doc/*.md`
- **编码规范**：`docs/编程手册.md`

## 6. 最佳实践

### 6.1 代码组织

- ✅ 按功能模块组织代码
- ✅ 拆分组件，避免大函数组件
- ✅ 使用 TypeScript 类型定义
- ✅ 保持文件结构清晰

### 6.2 性能优化

- ✅ 使用 Signal 进行状态管理
- ✅ 合理使用 useEffect 钩子
- ✅ 避免不必要的渲染
- ✅ 懒加载非关键资源

### 6.3 错误处理

- ✅ 捕获 API 调用异常
- ✅ 显示友好的错误提示
- ✅ 使用 ErrorBoundary 包裹组件
- ✅ 记录错误日志

### 6.4 开发流程

1. **需求分析**：明确业务需求
2. **API 设计**：定义 API 接口
3. **组件设计**：拆分组件，设计组件结构
4. **代码实现**：实现业务逻辑
5. **测试验证**：测试功能完整性
6. **文档编写**：更新相关文档

## 7. 常见问题

### 7.1 Dialog 组件不显示

**解决方案**：确保使用 Signal 管理 open 状态，并在应用根组件中使用 DialogProvider

```tsx
// 应用根组件
import { DialogProvider } from "@24wings/shadcn";

function App() {
  return (
    <DialogProvider>
      {/* 应用内容 */}
    </DialogProvider>
  );
}
```

### 7.2 表单数据不更新

**解决方案**：确保使用 Signal 管理表单数据，并将 Signal 直接传递给组件

```tsx
// ✅ 推荐
const name = useSignal("");
<Input value={name} />

// ❌ 避免
const name = useSignal("");
<Input value={name.value} onChange={(e) => name.value = e.target.value} />
```

### 7.3 API 调用失败

**解决方案**：检查 ORPC 客户端配置和 API 定义，确保参数类型正确

```tsx
// 检查 orpc-client.ts 配置
// 检查 API 方法名称和参数类型
// 检查网络连接和权限
```

## 8. 文档资源

- **项目大纲**：`项目大纲.md`
- **编程手册**：`docs/编程手册.md`
- **组件规范**：`docs/input-component-design.md`
- **目录改进**：`docs/directory-structure-improvements.md`
- **组件文档**：`libs/shadcn/doc/`

## 9. 总结

本指南提供了 Deno Preact ISO 项目业务代码开发的核心规范和最佳实践，包括：

- ✅ 使用 class 而不是 className
- ✅ 拆分组件，避免大函数组件
- ✅ 使用 Preact Signals 进行状态管理
- ✅ 规范使用 Dialog 组件
- ✅ 遵循组件库使用规范

遵循这些规范可以提高代码质量、可维护性和开发效率。更多详细信息请参考相关文档。
