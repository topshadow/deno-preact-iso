import * as Dash from "./routes/dash/Dash.tsx";
import * as homeRoute from "./routes/home.tsx";
import * as Tasker from "./routes/tasker.tsx";
import * as PluginManager from "./routes/dash/PluginManager.tsx";
export const routes = [
  { path: "/", ...homeRoute },
  { path: "/dash", ...Dash },
  { path: "/dash/tasker", ...Tasker },
  { path: "/dash/plugin-manage", ...PluginManager },
];
