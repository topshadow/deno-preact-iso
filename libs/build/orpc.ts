import type { Context } from "node:vm";
import { RPCHandler } from "@orpc/server/fetch";
import type { Hono, Next } from "hono";
import { onError, type Router } from "@orpc/server";
import {
  OpenAPIGenerator,
  type OpenAPIGeneratorGenerateOptions,
} from "@orpc/openapi";
import { ZodToJsonSchemaConverter } from "@orpc/zod/zod4";
export function orpc_scalar_html(
  c: Context,
  opt?: { cdn?: string; endpoint?: string },
) {
  const cdn = opt?.cdn ||
    `https://cdn.bootcdn.net/ajax/libs/scalar-api-reference/1.36.2/standalone.min.js`;
  const html = `
    <!doctype html>
    <html>
      <head>
        <title>My Client</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/svg+xml" href="https://orpc.dev/icon.svg" />
      </head>
      <body>
        <div id="app"></div>

        <script src="${cdn}"> </script>
        

        <script type="module">
        console.log(Scalar)
          Scalar.createApiReference('#app', {
            url: '${opt?.endpoint || "spec.json"}',
            authentication: {
              securitySchemes: {
                bearerAuth: {
                  token: 'default-token',
                },
              },
            },
          })
        </script>
      </body>
    </html>
  `;
  return c.html(html);
}

export const orpc_handle =
  (handler: RPCHandler<Record<string, string>>) =>
  async (c: Context, next: Next) => {
    console.log("orpc_handle", c.env);
    const { matched, response } = await handler.handle(c.req.raw, {
      prefix: "/rpc",
      context: { ...c.env }, // Provide initial context if needed
    });

    if (matched) {
      return c.newResponse(response.body, response);
    }

    await next();
  };
// deno-lint-ignore no-explicit-any
export const orpc_router = <T extends Context>(router: Router<any, T>) => {
  const handler = new RPCHandler(router, {
    interceptors: [
      onError((error) => {
        console.error(error);
      }),
    ],
  });
  return orpc_handle(handler);
};

export const setup_openapi = <T extends Context>(
  app: Hono,
  // deno-lint-ignore no-explicit-any
  api: Router<any, T>,
  options?: OpenAPIGeneratorGenerateOptions,
) => {
  app.use("/rpc/*", orpc_router(api));
  const openAPIGenerator = new OpenAPIGenerator({
    schemaConverters: [
      new ZodToJsonSchemaConverter(),
    ],
  });
  app.get("/spec.json", async (c) => {
    const spec = await openAPIGenerator.generate(api, options);
    return c.json(spec);
  });
  app.get("/ui.html", (c) => orpc_scalar_html(c));
};
