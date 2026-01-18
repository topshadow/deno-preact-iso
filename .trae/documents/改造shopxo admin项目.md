# 改造计划

## 1. 目录结构调整
- 将当前的 `src/` 目录重命名为 `app/`
- 创建 `api/` 目录用于存放API相关代码
- 保留或更新必要的配置文件

## 2. 配置文件更新
- 更新 `deno.json`：
  - 添加缺失的导入包（如@orpc相关包、tailwind-merge、clsx等）
  - 更新tasks，添加bundle任务
  - 调整compilerOptions
- 创建 `client.json` 配置文件，用于客户端打包

## 3. 核心文件重写
- 重写 `plugin.ts`：
  - 使用 `compile_js` 替代 `Compile`
  - 使用 `ssrRoutes` 替代手动路由配置
  - 添加 `setup_openapi` 支持
  - 调整组件导入路径

## 4. 组件结构调整
- 确保 `app/App.tsx` 作为主应用组件
- 调整路由配置，使用参考项目的路由模式
- 确保 `app/client.tsx` 作为客户端入口

## 5. 清理和优化
- 移除不必要的代码（如dev.tsx中的调试代码）
- 确保所有导入路径正确
- 测试构建和运行

## 预期结果
改造后的项目将与参考项目具有一致的结构和配置，能够正常构建和运行，并且支持API文档生成。