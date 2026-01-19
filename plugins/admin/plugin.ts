import { Hono } from "hono";
import config from "./deno.json" with { type: "json" };
import { compile_js, setup_openapi, ssrRoutes } from "@24wings/build";
import {
  deleteCookie,
  generateCookie,
  generateSignedCookie,
  getCookie,
  getSignedCookie,
  setCookie,
  setSignedCookie,
} from "hono/cookie";

import * as api from "./api/mod.ts";
import App from "./app/App.tsx";
const app = new Hono();

export const router = api;

let js = await compile_js(import.meta, config);
if (Array.isArray(js)) {
  console.error("buildjs", js);
  js = js.map((j) => j.text).join(",");
}
app.get("/", (c) => {
  const token = getCookie(c, "admin-token");
  if (token) return c.redirect("/admin/dash/datasource");
  else return c.redirect("/admin/passport/login");
});

app.use("/dash/*", async (c, next) => {
  const token = getCookie(c, "admin-token");
  if (token) {
    await next();
  } else {
    return c.redirect("/admin/passport/login");
  }
});

app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});
setup_openapi(app, api, {
  info: { title: "开发者管理后台", version: "0.1.1" },
});
ssrRoutes([{ path: "/*", Component: App }], app, App);

export default app;
