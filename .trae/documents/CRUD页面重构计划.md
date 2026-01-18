# CRUD页面重构计划

## 重构目标

1. 将每个CRUD页面拆分为独立的子组件
2. 提高代码复用性和可维护性
3. 使用统一的组件设计模式
4. 明确组件职责划分

## 重构分析

### 当前代码问题

* 组件过于庞大，一个函数包含所有功能

* 表单与页面逻辑耦合紧密

* 缺乏代码复用，相似功能重复实现

* 维护性较差

### 目标架构

将每个页面拆分为以下子组件：

1. **主页面组件**：负责数据加载、状态管理和整体布局
2. **表单组件**：负责表单渲染和验证
3. **表格组件**：负责数据展示和操作按钮

## 重构实现方案

### 1. 目录结构调整

为每个页面创建对应的子组件目录：

```
dash/
├── DataSource/
│   ├── DataSourcePage.tsx        # 主页面组件
│   ├── DataSourceForm.tsx        # 表单组件
│   └── DataSourceTable.tsx       # 表格组件
├── PluginManager/
│   ├── PluginManagerPage.tsx     # 主页面组件
│   ├── PluginForm.tsx            # 表单组件
│   └── PluginTable.tsx           # 表格组件
└── ...                           # 其他页面类似
```

### 2. 组件设计模式

#### 主页面组件 (XXXPage.tsx)

* 负责数据加载和状态管理

* 管理对话框显示/隐藏

* 处理API调用

* 协调子组件通信

#### 表单组件 (XXXForm.tsx)

* 接收表单数据和回调函数作为props

* 负责表单渲染和验证

* 处理表单提交

* 支持新增和编辑模式

#### 表格组件 (XXXTable.tsx)

* 接收数据列表和操作回调作为props

* 负责数据展示

* 处理行操作（编辑、删除等）

* 支持搜索和筛选

### 3. 具体页面重构

#### DataSource页面重构

**主页面组件 (DataSourcePage.tsx)**

* 管理datasources、loading、showDialog等状态

* 处理loadDatasources、saveDatasource、deleteDatasource等API调用

* 协调DataSourceForm和DataSourceTable组件

**表单组件 (DataSourceForm.tsx)**

* 接收formData和onSave、onCancel回调

* 渲染表单字段：URL、数据库类型、域名、状态

* 处理表单验证

**表格组件 (DataSourceTable.tsx)**

* 接收datasources列表和onEdit、onDelete回调

* 渲染数据源表格

* 处理行操作按钮

#### PluginManager页面重构

**主页面组件 (PluginManagerPage.tsx)**

* 管理plugins、loading、isDialogOpen等状态

* 处理fetchPlugins、handleSubmit、handleDelete等API调用

* 协调PluginForm和PluginTable组件

**表单组件 (PluginForm.tsx)**

* 接收pluginData和onSave、onCancel回调

* 渲染表单字段：名称、URL、路径、状态

* 处理表单验证

**表格组件 (PluginTable.tsx)**

* 接收plugins列表和onEdit、onDelete回调

* 渲染插件表格

* 处理行操作按钮

### 4. 统一组件设计

#### Table组件设计

```tsx
interface TableProps<T> {
  data: T[];
  columns: TableColumn<T>[];
  onEdit?: (item: T) => void;
  onDelete?: (item: T) => void;
  loading?: boolean;
  emptyText?: string;
}

interface TableColumn<T> {
  key: keyof T | string;
  title: string;
  render?: (item: T) => JSX.Element;
  class?: string;
}
```

#### Form组件设计

```tsx
interface FormProps<T> {
  data: T;
  onSave: (data: T) => void;
  onCancel: () => void;
  loading?: boolean;
  isEditing?: boolean;
}
```

## 重构步骤

1. **创建子组件目录**：为每个页面创建对应的子组件目录
2. **拆分表单组件**：将每个页面的表单部分拆分为独立的Form组件
3. **拆分表格组件**：将每个页面的表格部分拆分为独立的Table组件
4. **重构主页面组件**：修改主页面组件，使用拆分后的子组件
5. **测试验证**：确保重构后的代码功能正常
6. **优化调整**：根据测试结果进行优化调整

## 技术要点

1. **TypeScript类型安全**：使用TypeScript类型定义提高代码类型安全性
2. **信号管理**：继续使用`useSignal`进行状态管理
3. **组件通信**：通过props和回调函数实现组件间通信
4. **API调用**：保持原有的orpc\_client API调用方式
5. **UI一致性**：保持与原有UI风格一致

## 预期收益

1. **提高代码复用性**：相似功能的组件可以在不同页面复用
2. **提高代码可维护性**：组件职责明确，修改功能更加方便
3. **提高开发效率**：

