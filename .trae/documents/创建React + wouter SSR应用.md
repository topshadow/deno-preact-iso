1. **清理tests目录**：删除所有现有文件
2. **设置项目结构**：

   * 创建deno.json配置依赖

   * 创建server.tsx实现SSR

   * 创建client.tsx实现客户端水合

   * 创建路由配置

   * 创建组件目录，包含layout和页面组件
3. **实现核心功能**：

   * Layout组件支持嵌套路由

   * 页面组件（Home、About、Blog等）

   * 服务端渲染逻辑

   * 客户端水合
4. **测试应用**：启动服务器并验证SSR功能

使用的技术栈：

* React

* wouter（路由）

* Deno

* SSR（服务端渲染）

* Layout嵌套路由

应用结构：

```
tests/
├── deno.json
├── server.tsx
├── client.tsx
├── routes.tsx
├── components/
│   ├── Layout.tsx
│   ├── Home.tsx
│   ├── About.tsx
│   └── Blog/
│       ├── Blog.tsx
│       └── BlogPost.tsx
└── data/
    └── blogPosts.ts
```

