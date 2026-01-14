// import { D1Database, Fetcher } from "@cloudflare/workers-types";
import { Hono } from "hono";

import { routes } from "./app/routes.tsx";


import config from "./deno.json" with { type: "json" };
import { Compile, ssrWithLoader } from "@24wings/build";
import { Root } from "./app/Root.tsx"; 
export type CloudflareBindings = {
    ASSETS: any;
    DB: any;
};

const app = new Hono<{ Bindings: CloudflareBindings }>();

app.use(async (c, next) => {
    console.log(c.req);
    await next();
});


const js = await Compile(import.meta.resolve("./app/client.tsx"), config);
if (Array.isArray(js)) {
    // console.log(js);
    Deno.exit();
}

app.get("/client.js", (c) => {
    c.header("Content-Type", "text/javascript");
    return c.body(js);
});
routes.forEach((route) => {
    app.get(route.path, ssrWithLoader(route, Root));
});
export const ROUTES = routes;

export default app;
