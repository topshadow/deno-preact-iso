import { compile_js, setup_openapi, ssrRoutes } from "@24wings/build";

import config from "./deno.json" with { type: "json" };
import { routes } from "./app/routes.tsx";
import { Hono } from "hono";
import * as router from "./api/mod.ts";
const app = new Hono();
export {router}
const js = await compile_js(import.meta, config);
if (Array.isArray(js)) {
  console.error(js);
  Deno.exit(1);
}

ssrRoutes(routes, app);

app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});

setup_openapi(app, router, {
  commonSchemas: {},
  info: {
    title: "引导程序api",
    version: "1.0.0",
  },
  servers: [
    { url: "/plugins/base/rpc" },
  ],
});
export default app;
