import { Hono } from "hono";
import supplier from "./plugin.ts";

const app = new Hono();

app.route("/plugins/shopxo-supplier", supplier);

Deno.serve(app.fetch);
