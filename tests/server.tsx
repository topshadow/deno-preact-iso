import * as React from "react"; 
import { renderToString } from "react/server";
import { parse } from "https://deno.land/std@0.185.0/flags/mod.ts";

// 导入组件和路由
import App from "./components/App.tsx";

// 创建HTTP服务器，配置端口和主机名
const serverOptions = {
  port: 8080,
  hostname: "0.0.0.0",
};

// 打印服务器启动信息
console.log(`Server running at http://localhost:${serverOptions.port}`);

// 处理请求
Deno.serve(serverOptions, async (request) => {
  const url = new URL(request.url);
  const pathname = url.pathname;

  // 如果请求是客户端脚本，返回client.tsx文件
  if (pathname === "/client.js") {
    try {
      const clientContent = await Deno.readFile("./client.tsx");
      return new Response(clientContent, {
        status: 200,
        headers: new Headers({
          "Content-Type": "application/javascript",
        }),
      });
    } catch (error) {
      console.error("Error reading client.tsx:", error);
      return new Response("Internal Server Error", {
        status: 500,
      });
    }
  }

  // 否则，进行SSR渲染
  try {
    // 渲染App组件，传递当前路径作为location
    const appHtml = renderToString(
      React.createElement(App, {
        location: pathname,
      })
    );

    // 构建完整的HTML响应
    const html = `
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>React + Wouter SSR</title>
          <style>
            body {
              font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f5f5f5;
            }
            .container {
              max-width: 1200px;
              margin: 0 auto;
              padding: 20px;
            }
            header {
              background-color: #2c3e50;
              color: white;
              padding: 1rem;
            }
            nav {
              display: flex;
              gap: 1rem;
            }
            nav a {
              color: white;
              text-decoration: none;
            }
            nav a:hover {
              text-decoration: underline;
            }
            main {
              background-color: white;
              padding: 2rem;
              border-radius: 8px;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
              margin-top: 1rem;
            }
            footer {
              text-align: center;
              margin-top: 2rem;
              padding: 1rem;
              color: #666;
            }
          </style>
        </head>
        <body>
          <div id="root">${appHtml}</div>
          <script src="/client.js"></script>
        </body>
      </html>
    `;

    // 返回HTML响应
    return new Response(html, {
      status: 200,
      headers: new Headers({
        "Content-Type": "text/html",
      }),
    });
  } catch (error) {
    console.error("Error rendering component:", error);
    return new Response("Internal Server Error", {
      status: 500,
    });
  }
});
