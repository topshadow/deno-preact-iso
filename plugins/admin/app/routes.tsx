import * as Dash from "./Dash.tsx";
import * as homeRoute from "./routes/home.tsx";
import * as Tasker from "./routes/tasker.tsx";
export const routes = [
  { path: "/", ...homeRoute },
  { path: "/dash/", ...Dash },
  { path: "/dash/tasker", ...Tasker },
] as const;
