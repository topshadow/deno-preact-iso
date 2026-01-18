import * as React from "react";

const Home = () => {
  return (
    <div>
      <h2>Welcome to React + Wouter SSR</h2>
      <p>
        This is a simple example of a React application with Wouter for routing,
        running on Deno with Server-Side Rendering (SSR).
      </p>

      <div
        style={{
          marginTop: "20px",
          padding: "15px",
          backgroundColor: "#e8f0fe",
          borderRadius: "8px",
        }}
      >
        <h3>Features:</h3>
        <ul>
          <li>Server-Side Rendering with React</li>
          <li>Client-Side Hydration</li>
          <li>Nested Routes with Layout</li>
          <li>Wouter for Routing</li>
          <li>Deno as Runtime</li>
        </ul>
      </div>

      <div style={{ marginTop: "20px" }}>
        <h3>Getting Started:</h3>
        <p>
          Use the navigation menu above to explore the different pages of this
          application.
        </p>
      </div>
    </div>
  );
};

export default Home;
