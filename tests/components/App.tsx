import * as React from "react";
 
// 导入组件
import Layout from "./Layout.tsx";
import Home from "./Home.tsx";
import About from "./About.tsx";
import Blog from "./Blog/Blog.tsx";
import BlogPost from "./Blog/BlogPost.tsx";

interface AppProps {
  location?: string;
}

const App = ({ location: initialLocation }: AppProps) => {
  // 根据初始位置渲染不同的组件
  const renderContent = () => {
    if (!initialLocation) return <Home />;
    
    if (initialLocation === "/about") return <About />;
    if (initialLocation === "/blog") return <Blog />;
    
    // 处理博客详情页，如 /blog/1
    if (initialLocation.startsWith("/blog/")) {
      const id = initialLocation.split("/")[2] || "1";
      return <BlogPost id={id} />;
    }
    
    // 默认返回首页
    return <Home />;
  };
  
  return (
    <Layout>
      {renderContent()}
    </Layout>
  );
};

export default App;
