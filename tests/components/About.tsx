import * as React from "react";

const About = () => {
  return (
    <div>
      <h2>About React + Wouter SSR</h2>
      <p>
        This application demonstrates how to build a Server-Side Rendered (SSR)
        React application with Wouter for routing, running on Deno.
      </p>

      <div style={{ marginTop: "20px" }}>
        <h3>Technologies Used:</h3>
        <ul>
          <li>
            <strong>React 18</strong>{" "}
            - A JavaScript library for building user interfaces
          </li>
          <li>
            <strong>Wouter</strong> - A small and fast router for React
          </li>
          <li>
            <strong>Deno</strong>{" "}
            - A modern runtime for JavaScript and TypeScript
          </li>
          <li>
            <strong>React DOM Server</strong> - For Server-Side Rendering
          </li>
        </ul>
      </div>

      <div style={{ marginTop: "20px" }}>
        <h3>Project Structure:</h3>
        <pre
          style={{
            backgroundColor: "#f5f5f5",
            padding: "10px",
            borderRadius: "8px",
            overflowX: "auto",
          }}
        >
{`tests/
├── deno.json          # Project configuration
├── server.tsx         # SSR server
├── client.tsx         # Client-side hydration
└── components/
    ├── App.tsx        # Main application component
    ├── Layout.tsx     # Layout component with navigation
    ├── Home.tsx       # Home page
    ├── About.tsx      # About page
    └── Blog/
        ├── Blog.tsx   # Blog index page
        └── BlogPost.tsx # Blog post detail page`}
        </pre>
      </div>
    </div>
  );
};

export default About;
