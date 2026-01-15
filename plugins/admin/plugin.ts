// import { D1Database, Fetcher } from "@cloudflare/workers-types";
import { Hono } from "hono";

import { routes } from "./app/routes.tsx";

import config from "./deno.json" with { type: "json" };
import {  compile_js, ssrWithLoader } from "@24wings/build";
import { Root } from "./app/Root.tsx";
export type CloudflareBindings = {
  ASSETS: any;
  DB: any;
}; 

const app = new Hono<{ Bindings: CloudflareBindings }>();

app.use(async (c, next) => {
  console.log(c.req.url);
  await next();
});
const client_tsx_path = import.meta.resolve("./app/client.tsx");
const config_path = import.meta.resolve("./client.json");
console.log(
  "admin_plugin_config_path",
  config_path,
  "client_tsx_path:",
  client_tsx_path,
);
let cwd = import.meta.resolve("./").slice(0, -1);
console.log(`cwd:`, cwd);

// const js = await Compile(import.meta.resolve("./app/client.tsx"), config, {
//   cwd:  new URL('.',import.meta.url.replace('plugin.ts','')),
//   config_path:new URL('./client.tsx',import.meta.url.replaceAll('plugin.ts','')).href.replace('file:///',''),
//   sourcemap:true

// });
const js =await compile_js(import.meta, config);
if (Array.isArray(js)) {
  // console.log(js);
  Deno.exit();
}

app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});
routes.forEach((route) => {
  app.get(
    route.path,
    ssrWithLoader(route, Root),
  );
});
export const ROUTES = routes;

export default app;
