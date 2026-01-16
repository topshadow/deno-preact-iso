import { Context } from "node:vm";

export function orpc_scalar_html(c: Context) {
  let cdn = `https://cdn.jsdelivr.net/npm/@scalar/api-reference`;
  let cdn_1_36 =
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
            url: '/spec.json',
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
