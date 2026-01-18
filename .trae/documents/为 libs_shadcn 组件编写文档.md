# 为 libs/shadcn 组件编写文档

## 1. 目录结构确认
- 确认 libs/shadcn/doc/ 目录已存在
- 检查当前目录下的组件文件，确定需要编写文档的组件列表

## 2. 创建组件文档大纲
- 创建 `libs/shadcn/doc/INDEX.md` 文件，作为所有组件文档的入口
- 列出所有组件，并提供到各组件文档的链接

## 3. 为每个组件编写文档
- 按照现有 `SELECT_USAGE.md` 的格式，为每个组件创建单独的文档文件
- 文档包含：组件介绍、安装导入、基本用法、API 文档、高级用法、注意事项等
- 组件列表：Accordion、Alert、Badge、Button、Card、Checkbox、Dialog、Divider、DropdownMenu、Icons、Input、Label、Pagination、Select、Sidebar、Table、Theme

## 4. 文档格式统一
- 所有文档使用相同的 Markdown 格式
- API 文档使用表格形式
- 包含必要的代码示例
- 提供清晰的使用说明

## 5. 更新现有文档
- 如果有需要，更新已有的 `SELECT_USAGE.md` 文档

## 6. 验证文档完整性
- 检查所有组件是否都有对应的文档
- 确保所有文档链接正确
- 验证代码示例的正确性

## 实现步骤
1. 创建 INDEX.md 作为文档大纲
2. 为每个组件编写文档，从常用组件开始
3. 按照统一格式编写每个文档
4. 确保所有文档之间的链接正确
5. 检查文档内容的完整性和准确性

## 预期结果
- libs/shadcn/doc/ 目录下有一个 INDEX.md 文件和多个组件文档文件
- 每个组件都有详细的使用文档，包含示例代码和 API 说明
- 文档结构清晰，易于导航和使用