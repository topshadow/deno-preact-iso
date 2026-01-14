import * as homeRoute from "./app/routes/home.tsx";
 
export const routes = [
  { path: "/", ...homeRoute },
  //   { path: "/about", ...aboutRoute },
] as const;
   