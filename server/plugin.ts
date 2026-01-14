import { resolve } from "@std/path";
import { Compile, ssrWithLoader } from "@24wings/build";
import { Root } from "./app/Root.tsx";
import config from "./deno.json" with { type: "json" };
import { routes } from "./app/routes.tsx";
import { Hono } from "hono";
import { change_env, create_db, sys_api, test_db } from "./api/sys/env.ts";
import { BlankEnv, BlankInput, H } from "hono/types";

const app = new Hono();
const js = await Compile(
  import.meta.resolve("./app/client.tsx"),
  config,
  {
    config_path: resolve(Deno.cwd(), "client.json"),
    // sourcemap:true
  }, 
);
if (Array.isArray(js)) {
  console.error(js);
  Deno.exit(1);
}
routes.forEach((route) => {
  app.get(route.path, ssrWithLoader(route, Root));
});
app.post("/api/change-env", change_env);
app.post("/api/test-db", test_db);
app.post("/api/create-db", create_db);
app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});
for (const key in sys_api.GET) {
  app.get(`/api/${key}`, sys_api.GET[key] as any);
}
for (const key in sys_api.post) {
  app.post(`/api/${key}`, sys_api.post[key] as any);
}
export default app;
