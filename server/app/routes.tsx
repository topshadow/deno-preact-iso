import * as homeRoute from "./routes/home.tsx";

export const routes = [
  { path: "/", ...homeRoute },
] as const;
