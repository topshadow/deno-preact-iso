import * as React from "react";

// 示例博客文章详细数据
const blogPostData = {
  "1": {
    id: "1",
    title: "Getting Started with React + Wouter SSR",
    content: `# Getting Started with React + Wouter SSR

In this article, we'll learn how to set up a React application with Wouter for routing and Server-Side Rendering on Deno.

## Prerequisites

- Deno installed on your machine
- Basic knowledge of React and TypeScript

## Step 1: Set Up Your Project

First, create a new directory for your project and initialize it with Deno.

mkdir react-wouter-ssr
cd react-wouter-ssr
deno init

## Step 2: Install Dependencies

Add the necessary dependencies to your deno.json file:

{\n  "dependencies": {\n    "react": "https://esm.sh/react@18.2.0",\n    "react-dom": "https://esm.sh/react-dom@18.2.0",\n    "react-dom/server": "https://esm.sh/react-dom@18.2.0/server",\n    "wouter": "https://esm.sh/wouter@2.12.1"\n  },\n  "compilerOptions": {\n    "jsx": "react-jsx",\n    "jsxImportSource": "react"\n  }\n}

## Step 3: Create Your Components

Create your main App component, Layout component, and various page components.

## Step 4: Set Up SSR

Create a server.tsx file to handle Server-Side Rendering, and a client.tsx file for client-side hydration.

## Step 5: Run Your Application

Build your client bundle and start your server:

deno bundle client.tsx client.js
deno run --allow-net --allow-read server.tsx

## Conclusion

You've now successfully set up a React application with Wouter for routing, running on Deno with Server-Side Rendering. This combination provides a fast and efficient way to build modern web applications.`,
    date: "2026-01-15",
    author: "John Doe"
  },
  "2": {
    id: "2",
    title: "Understanding SSR with React 18",
    content: `# Understanding SSR with React 18

React 18 introduces several new features for Server-Side Rendering (SSR), including streaming and selective hydration.

## Streaming SSR

With streaming SSR, React can send HTML to the client in chunks as it renders, allowing the client to start rendering and hydrating the page before the entire HTML is received.

## Selective Hydration

Selective hydration allows React to prioritize which components to hydrate first, based on user interaction and visibility.

## Conclusion

React 18's new SSR features provide significant performance improvements for server-rendered applications, making them faster and more responsive.`,
    date: "2026-01-10",
    author: "Jane Smith"
  },
  "3": {
    id: "3",
    title: "Why Wouter is a Great Choice for React Routing",
    content: `# Why Wouter is a Great Choice for React Routing

Wouter is a small and fast router for React applications. Here are some reasons why it's a great choice:

## Small Size

Wouter is only about 1.5KB gzipped, making it much smaller than other popular React routers like React Router.

## Fast Performance

Due to its small size and simple implementation, Wouter is very fast, with minimal overhead.

## Easy to Use

Wouter has a simple and intuitive API, making it easy to learn and use.

## Conclusion

Wouter is a great choice for React applications that need a fast, small, and easy-to-use router.`,
    date: "2026-01-05",
    author: "John Doe"
  }
};

interface BlogPostProps {
  id?: string;
}

const BlogPost = ({ id = "1" }: BlogPostProps) => {
  // 获取博客文章数据
  const post = blogPostData[id as keyof typeof blogPostData] || blogPostData["1"];
  
  return (
    <div>
      <h2>{post.title}</h2>
      <div style={{ marginBottom: "20px", fontSize: "14px", color: "#999" }}>
        <span>By {post.author} | {post.date}</span>
      </div>
      
      <div style={{ whiteSpace: "pre-wrap", lineHeight: "1.6" }}>
        {post.content}
      </div>
      
      <div style={{ marginTop: "30px" }}>
        <a href="/blog" style={{ color: "#3498db", textDecoration: "none" }}>
          ← Back to Blog
        </a>
      </div>
    </div>
  );
};

export default BlogPost;
