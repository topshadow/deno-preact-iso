import * as React from "react";

// 示例博客文章数据
const blogPosts = [
  {
    id: "1",
    title: "Getting Started with React + Wouter SSR",
    excerpt:
      "Learn how to set up a React application with Wouter for routing and Server-Side Rendering on Deno.",
    date: "2026-01-15",
    author: "John Doe",
  },
  {
    id: "2",
    title: "Understanding SSR with React 18",
    excerpt:
      "Dive into the new SSR capabilities of React 18, including streaming and selective hydration.",
    date: "2026-01-10",
    author: "Jane Smith",
  },
  {
    id: "3",
    title: "Why Wouter is a Great Choice for React Routing",
    excerpt:
      "Explore the benefits of using Wouter, a small and fast router for React applications.",
    date: "2026-01-05",
    author: "John Doe",
  },
];

const Blog = () => {
  return (
    <div>
      <h2>Blog</h2>
      <p>
        Welcome to our blog! Here you'll find articles about React, Wouter, SSR,
        and Deno.
      </p>

      <div style={{ marginTop: "20px", display: "grid", gap: "20px" }}>
        {blogPosts.map((post) => (
          <div
            key={post.id}
            style={{
              padding: "15px",
              backgroundColor: "#f9f9f9",
              borderRadius: "8px",
              border: "1px solid #e0e0e0",
            }}
          >
            <a
              href={`/blog/${post.id}`}
              style={{ textDecoration: "none", color: "inherit" }}
            >
              <h3 style={{ margin: "0 0 10px 0", color: "#2c3e50" }}>
                {post.title}
              </h3>
            </a>
            <p style={{ margin: "0 0 10px 0", color: "#666" }}>
              {post.excerpt}
            </p>
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                fontSize: "14px",
                color: "#999",
              }}
            >
              <span>By {post.author}</span>
              <span>{post.date}</span>
            </div>
            <div style={{ marginTop: "10px" }}>
              <a
                href={`/blog/${post.id}`}
                style={{ color: "#3498db", textDecoration: "none" }}
              >
                Read more →
              </a>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Blog;
