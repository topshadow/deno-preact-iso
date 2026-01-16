import { compile_js, orpc_scalar_html, ssrWithLoader } from "@24wings/build";
import { Root } from "./app/Root.tsx";
import config from "./deno.json" with { type: "json" };
import { routes } from "./app/routes.tsx";
import { Hono } from "hono";
import {
  change_env,
  create_db,
  current_status,
  test_db,
} from "./api/sys/env.ts";
import { RPCHandler } from "@orpc/server/fetch";
import { onError } from "@orpc/server";

import { OpenAPIGenerator } from "@orpc/openapi";
import { ZodToJsonSchemaConverter } from "@orpc/zod/zod4";

const app = new Hono();

import { install_admin_module } from "./api/sys/plugin.ts";

export const router = {
  plugin: {
    install_admin_module,
  },
  env: {
    change_env,
    create_db,
    test_db,
    current_status,
  },
};

const handler = new RPCHandler(router, {
  interceptors: [
    onError((error) => {
      console.error(error);
    }),
  ],
});
const js = await compile_js(import.meta, config, { sourcemap: true });
if (Array.isArray(js)) {
  console.error(js);
  Deno.exit(1);
}
routes.forEach((route) => {
  app.get(route.path, ssrWithLoader(route, Root));
});

app.get("/client.js", (c) => {
  c.header("Content-Type", "text/javascript");
  return c.body(js);
});

app.use("/rpc/*", async (c, next) => {
  const { matched, response } = await handler.handle(c.req.raw, {
    prefix: "/rpc",
    context: {}, // Provide initial context if needed
  });

  if (matched) {
    return c.newResponse(response.body, response);
  }

  await next();
});
const openAPIGenerator = new OpenAPIGenerator({
  schemaConverters: [
    new ZodToJsonSchemaConverter(),
  ],
});
app.get("/spec.json", async (c) => {
  const spec = await openAPIGenerator.generate(router, {
    commonSchemas: {},
    info: {
      title: "引导程序api",
      version: "1.0.0",
    },
    servers: [
      {
        url: "/plugins/base/rpc",
      }, /** Should use absolute URLs in production */
    ],
    security: [{ bearerAuth: [] }],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: "http",
          scheme: "bearer",
        },
      },
    },
  });
  return c.json(spec);
});
app.get("/api/ui.html", orpc_scalar_html);
export default app;
