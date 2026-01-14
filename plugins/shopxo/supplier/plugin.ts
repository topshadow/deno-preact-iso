// import { D1Database, Fetcher } from "@cloudflare/workers-types";
import { Hono } from "hono";
// import api from "./api";

import { routes } from "./src/routes.tsx";
import { resolve } from "@std/path";

import config from "./deno.json" with { type: "json" };
import { Compile, ssrWithLoader } from "@24wings/build";
import { Root } from "./src/Root.tsx";
export type CloudflareBindings = {
  ASSETS: any;
  DB: any;
};

const app = new Hono<{ Bindings: CloudflareBindings }>();

app.use(async (c, next) => {
  console.log(c.req);
  await next();
});
console.log(import.meta.url);
// let dist_path = new URL("src/client.js", import.meta.url).href;
// console.log(dist_path);
// const dist_js = dist_path;
// const js = Deno.readTextFileSync(dist_js); //
const js = await Compile(import.meta.resolve("./src/client.tsx"), config);
if (Array.isArray(js)) {
  // console.log(js);
  Deno.exit();
}
// app.route("/api", api);
app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});
routes.forEach((route) => {
  app.get(route.path, ssrWithLoader(route, Root));
});
export const ROUTES = routes;

export default app;
