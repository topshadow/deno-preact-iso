// import { D1Database, Fetcher } from "@cloudflare/workers-types";
import { Hono } from "hono";

import { routes } from "./app/routes.tsx";

import config from "./deno.json" with { type: "json" };
import { compile_js, ssrWithLoader } from "@24wings/build";
import { Root } from "./app/Root.tsx";

const app = new Hono();

let js = await compile_js(import.meta, config);
if (Array.isArray(js)) {
  console.error(js);
  js = js.map((j) => j.text).join(",");
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
