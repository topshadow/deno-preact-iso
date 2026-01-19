1. 创建 `libs/shadcn/components/Textarea.tsx` 文件，实现符合shadcn风格的Textarea组件
2. 参考Input组件的实现，支持Signal类型的value
3. 使用cn工具函数处理类名，确保与shadcn风格一致
4. 添加合适的tailwind类名，包括边框、背景、内边距、阴影等
5. 处理onChange事件来更新Signal值
6. 导出组件到mod.tsx文件中

组件特性：

* 支持Signal类型的value

* 符合shadcn设计规范

* 响应式设计

* 支持disabled状态

* 支持自定义类名

* 支持rows和cols属性

实现细节：

* 使用与Input组件相同的tailwind类名风格

* 支持多行输入

* 处理Signal值的双向绑定

* 确保类型安全

* 导出组件以便在其他地方使用

