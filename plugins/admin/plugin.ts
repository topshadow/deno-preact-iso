import { Hono } from "hono";
import { routes } from "./app/routes.tsx";
import config from "./deno.json" with { type: "json" };
import { compile_js, setup_openapi, ssrRoutes } from "@24wings/build";



import * as api from "./api/mod.ts";
const app = new Hono();

export const router = api;


let js = await compile_js(import.meta, config);
if (Array.isArray(js)) {
  console.error(js);
  js = js.map((j) => j.text).join(",");
}

app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});

ssrRoutes(routes, app);
setup_openapi(app, api, {
  info: { title: "开发者管理后台", version: "0.1.1" },
});
export default app;
