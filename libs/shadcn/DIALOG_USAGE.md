# Dialog 组件使用指南

## 🔧 环境设置

首先在应用的根组件中使用 `DialogProvider` 包裹你的应用：

```tsx
import { DialogProvider } from "@24wings/shadcn";
import { App } from "./App.tsx";

export function Root() {
  return (
    <DialogProvider>
      <App />
    </DialogProvider>
  );
}
```

## 基础 Dialog 组件

### 基本用法

```tsx
import { Dialog, Button } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

export function MyComponent() {
  const isOpen = useSignal(false);

  return (
    <>
      <Button onClick={() => isOpen.value = true}>打开对话框</Button>

      <Dialog open={isOpen}>
        <Dialog.Content>
          <Dialog.Header title="标题" description="描述信息" />
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
    </>
  );
}
```

## Dialog Hooks (Provider模式)

使用DialogProvider后，可以在任何子组件中直接使用这些hooks，无需手动渲染Dialog组件。

### 1. useAlertDialog - 提示对话框

简单的提示信息框，只有确定按钮。

```tsx
import { useAlertDialog, Button } from "@24wings/shadcn";

export function AlertExample() {
  const { alert } = useAlertDialog();

  const handleClick = async () => {
    await alert("操作成功!");
  };

  return (
    <Button onClick={handleClick}>
      显示提示
    </Button>
  );
}
```

**API:**
- `alert(message: string)` - 显示提示并返回Promise

---

### 2. useConfirmDialog - 确认对话框

用于确认用户的操作，返回 Promise<boolean>。

```tsx
import { useConfirmDialog, Button } from "@24wings/shadcn";

export function ConfirmExample() {
  const { confirm } = useConfirmDialog();

  const handleDelete = async () => {
    const confirmed = await confirm("删除确认", "确定要删除这个项目吗?");
    if (confirmed) {
      // 执行删除操作
      console.log("已删除");
    }
  };

  return (
    <Button variant="destructive" onClick={handleDelete}>
      删除
    </Button>
  );
}
```

**API:**
- `confirm(title?: string, message?: string)` - 显示确认框，返回 Promise<boolean>

---

### 3. usePromptDialog - 输入对话框

用于获取用户输入，返回 Promise<string | null>。

```tsx
import { usePromptDialog, Button } from "@24wings/shadcn";

export function PromptExample() {
  const { prompt } = usePromptDialog();

  const handleInput = async () => {
    const result = await prompt(
      "输入名称",
      "请输入项目名称:",
      "例如: My Project"
    );
    if (result) {
      console.log("用户输入:", result);
    }
  };

  return (
    <Button onClick={handleInput}>
      输入信息
    </Button>
  );
}
```

**API:**
- `prompt(title?: string, message?: string, placeholder?: string)` - 显示输入框，返回 Promise<string | null>

---

## 完整示例

```tsx
import { useAlertDialog, useConfirmDialog, usePromptDialog, Button } from "@24wings/shadcn";

export function DialogDemo() {
  const { alert } = useAlertDialog();
  const { confirm } = useConfirmDialog();
  const { prompt } = usePromptDialog();

  const handleAlert = async () => {
    await alert("这是一个提示消息");
  };

  const handleConfirm = async () => {
    const result = await confirm("删除确认", "确定要删除吗?");
    if (result) {
      await alert("已删除!");
    }
  };

  const handlePrompt = async () => {
    const name = await prompt("输入名称", "请输入您的名称:", "匿名");
    if (name) {
      await alert(`欢迎, ${name}!`);
    }
  };

  return (
    <div class="flex gap-4">
      <Button onClick={handleAlert}>提示</Button>
      <Button onClick={handleConfirm}>确认</Button>
      <Button onClick={handlePrompt}>输入</Button>
    </div>
  );
}
```

## 链式调用示例

```tsx
import { useAlertDialog, useConfirmDialog, Button } from "@24wings/shadcn";

export function ChainDialogDemo() {
  const { confirm } = useConfirmDialog();
  const { alert } = useAlertDialog();

  const handleAction = async () => {
    const confirmed = await confirm(
      "确认操作", 
      "确定要继续吗?"
    );
    
    if (confirmed) {
      // 执行操作...
      await alert("操作成功!");
    } else {
      await alert("已取消操作");
    }
  };

  return <Button onClick={handleAction}>执行操作</Button>;
}
```

## 样式特性

- ✅ 自动处理ESC键关闭
- ✅ 点击背景关闭
- ✅ 点击内容区不关闭
- ✅ 动画过渡效果
- ✅ 响应式设计
- ✅ 键盘支持 (Enter确认, ESC关闭)
- ✅ 全屏overlay + 居中content
- ✅ Provider模式：无需在每个使用处手动渲染Dialog

## 架构优势

### Provider 模式的优点

1. **集中管理** - 所有Dialog状态在Provider中集中管理
2. **简洁API** - Hooks直接返回方法，无需组件部分
3. **自动渲染** - 无需在每个使用处手动渲染对话框
4. **链式操作** - 支持Promise-based的链式调用
5. **全局可访问** - 任何子组件都能使用Dialog功能

