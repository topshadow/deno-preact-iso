import * as React from "react";
import { ReactNode } from "react";
 
interface LayoutProps {
  children: ReactNode;
}

const Layout = ({ children }: LayoutProps) => {
  return (
    <div className="container">
      <header>
        <h1>React + Wouter SSR</h1>
        <nav>
          <a href="/">Home</a>
          <a href="/about">About</a>
          <a href="/blog">Blog</a>
        </nav>
      </header>
      <main>
        {children}
      </main>
      <footer>
        <p>&copy; 2026 React + Wouter SSR Example</p>
      </footer>
    </div>
  );
};

export default Layout;
