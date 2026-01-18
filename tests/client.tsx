import { createElement } from "react";
import { hydrateRoot } from "react-dom/client";

// 导入App组件
import App from "./components/App.tsx";

// 获取根元素
const rootElement = document.getElementById("root");

if (!rootElement) {
  throw new Error("Root element not found");
}

// 水合React应用
hydrateRoot(
  rootElement,
  createElement(App)
);
