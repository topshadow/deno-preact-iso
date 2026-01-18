# 项目目录结构优化建议

## 1. 项目现状分析

### 1.1 整体架构
当前项目采用插件化架构，主要由以下几个核心部分组成：

- **libs/** - 核心库目录，包含构建系统和UI组件库
- **plugins/** - 插件目录，包含管理后台和电商插件
- **server/** - 主服务器目录，负责插件加载和管理
- **docs/** - 文档目录

### 1.2 现有目录结构
```
├── .vscode/              # VSCode配置
├── docs/                 # 项目文档
├── libs/
│   ├── build/            # 构建和模块管理
│   └── shadcn/           # UI组件库
├── plugins/
│   ├── admin/            # 管理后台插件
│   └── shopxo/           # ShopXO电商插件
├── server/               # 主服务器
├── .gitignore
├── deno-preact-iso.rar   # 压缩文件（不应该出现在仓库中）
├── deno.jsonc            # 项目配置
├── deno.lock
├── tailwind.config.js
└── 项目大纲.md            # 项目大纲（中文命名）
```

## 2. 目录结构优化建议

### 2.1 整体结构调整

#### 2.1.1 移除不必要的文件
- **移除 `deno-preact-iso.rar`**：压缩文件不属于代码仓库内容，应移除并添加到 `.gitignore`
- **重命名 `项目大纲.md`**：建议重命名为 `project-outline.md` 或 `README.md`，使用英文命名便于国际化

#### 2.1.2 统一类型定义
- **创建 `libs/types/` 目录**：将所有类型定义集中管理，包括：
  - 从 `libs/build/types/` 迁移所有类型文件
  - 移除重复的 `server/app/types/Dialect.ts`
  - 统一管理所有核心类型定义

### 2.2 libs/ 目录优化

#### 2.2.1 libs/build/ 目录

**当前问题**：
- 功能混杂，包含模块管理、ORPC、SSR加载等多种功能
- 测试文件嵌套在源代码目录中

**优化建议**：
```
libs/build/
├── src/
│   ├── module-manager/   # 模块管理功能
│   │   ├── mod.ts
│   │   └── types.ts
│   ├── orpc/             # ORPC相关功能
│   │   ├── mod.ts
│   │   └── utils.ts
│   ├── ssr/              # SSR加载功能
│   │   ├── loader.tsx
│   │   └── types.ts
│   ├── db/               # 数据库相关功能
│   │   ├── manager.ts
│   │   └── seed.ts
│   ├── compile/          # 编译相关功能
│   │   └── js.ts
│   └── mod.ts            # 主入口
├── tests/                # 测试文件，与src同级
│   └── test-fetch-build.ts
└── deno.json
```

#### 2.2.2 libs/shadcn/ 目录

**当前问题**：
- 文档放在组件库内部，未与项目文档统一
- Pro组件和基础组件分离，增加使用复杂度

**优化建议**：
```
libs/shadcn/
├── components/           # 所有组件统一放在components目录
│   ├── base/            # 基础组件
│   │   ├── Button.tsx
│   │   ├── Input.tsx
│   │   └── ...
│   ├── pro/             # Pro组件（使用pro-前缀）
│   │   ├── ProTable.tsx
│   │   └── ...
│   └── layouts/         # 布局组件
│       ├── DashLayout.tsx
│       └── ...
├── utils/               # 工具函数
└── deno.json
```

- 将 `doc/SELECT_USAGE.md` 移动到项目根目录的 `docs/` 目录
- 统一组件导入路径，所有组件通过 `@24wings/shadcn/components/` 导入

### 2.3 plugins/ 目录优化

**当前问题**：
- 插件目录结构不一致，`admin/` 和 `shopxo/supplier/src/` 结构差异较大
- 插件内部目录层次过深

**优化建议**：统一插件目录结构

```
plugins/
├── plugin-name/
│   ├── src/
│   │   ├── api/          # API定义
│   │   ├── app/          # 前端应用
│   │   │   ├── components/ # 组件
│   │   │   ├── data/       # 数据管理
│   │   │   └── routes/     # 路由定义
│   │   ├── plugin.ts      # 插件入口
│   │   └── types.ts       # 类型定义
│   ├── deno.json
│   └── README.md
```

- 将 `admin/` 目录结构调整为：`plugins/admin/src/api/`、`plugins/admin/src/app/` 等
- 将 `shopxo/supplier/src/` 简化为 `shopxo/supplier/`，移除不必要的嵌套

### 2.4 server/ 目录优化

**当前问题**：
- 目录结构与插件目录结构不一致
- 功能模块划分不够清晰

**优化建议**：
```
server/
├── src/
│   ├── api/             # API定义
│   ├── app/             # 前端应用
│   │   ├── components/   # 组件
│   │   └── routes/       # 路由定义
│   ├── db/              # 数据库管理
│   ├── core/            # 核心功能
│   │   ├── manager.ts    # 模块管理
│   │   └── config.ts     # 配置管理
│   └── mod.ts           # 主入口
├── tests/               # 测试文件
├── deno.json
└── server.tsx           # 服务器入口
```

- 统一使用 `src/` 目录组织源代码，与插件目录结构保持一致
- 移除重复的类型定义文件
- 清晰划分功能模块

## 3. 命名规范建议

### 3.1 目录和文件名
- **统一命名风格**：建议使用 kebab-case（如 `module-manager/`、`plugin.ts`）
- **避免混合命名**：不要同时使用 kebab-case 和 camelCase
- **使用英文命名**：所有目录和文件名使用英文，便于国际化和协作

### 3.2 配置文件
- **统一配置文件命名**：所有插件使用 `deno.json` 作为配置文件
- **避免重复配置**：将共享配置提取到项目根目录的 `deno.jsonc` 中

## 4. 文档组织建议

### 4.1 文档目录结构
```
docs/
├── architecture/        # 架构设计文档
│   └── plugin-system.md
├── components/          # 组件文档
│   ├── button.md
│   └── input.md
├── development/         # 开发指南
│   ├── getting-started.md
│   └── plugin-development.md
├── api/                 # API文档
└── project-outline.md   # 项目大纲
```

### 4.2 文档内容要求
- **组件文档**：每个组件应有详细的使用说明、API文档和示例代码
- **架构文档**：详细描述项目架构、插件系统、数据流等
- **开发指南**：提供清晰的开发流程和最佳实践
- **API文档**：自动生成或手动编写详细的API文档

## 5. 实施计划

### 5.1 短期优化（1-2天）
1. 移除不必要的文件（`.rar`压缩文件）
2. 重命名中文文件为英文
3. 统一插件目录结构
4. 清理重复的类型定义

### 5.2 中期优化（3-5天）
1. 重构 `libs/build/` 目录，按功能划分模块
2. 优化 `libs/shadcn/` 目录，统一组件组织
3. 调整 `server/` 目录结构，与插件保持一致
4. 完善文档目录结构

### 5.3 长期优化（持续进行）
1. 完善所有组件文档
2. 编写详细的架构文档和开发指南
3. 建立自动化文档生成机制
4. 实施严格的命名规范和代码审查

## 6. 预期收益

通过以上目录结构优化，预期可以获得以下收益：

1. **提高代码可维护性**：清晰的目录结构便于理解和维护代码
2. **降低学习成本**：统一的目录结构使新开发者更容易上手
3. **提高开发效率**：合理的模块划分减少了开发时的查找和理解成本
4. **便于扩展**：清晰的架构设计便于添加新功能和插件
5. **提升项目专业性**：规范化的目录结构和文档使项目更加专业

## 7. 总结

项目目录结构是软件架构的重要组成部分，合理的目录结构可以提高代码的可维护性、降低学习成本并提高开发效率。通过以上优化建议，可以使当前项目的目录结构更加清晰、合理，便于团队协作和未来扩展。

建议按照实施计划逐步进行优化，优先处理影响最大的问题，如统一目录结构和移除不必要的文件。