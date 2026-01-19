import { Hono } from "hono";
import "@std/dotenv/load";
import { dev } from "@24wings/build/dev";
import { configure, getConsoleSink, getLogger } from "@logtape/logtape";
import { prettyFormatter } from "@logtape/pretty";
import plugin from "./plugin.ts";
await configure({
  sinks: { console: getConsoleSink({ formatter: prettyFormatter }) },
  loggers: [
    { category: "boot", lowestLevel: "debug", sinks: ["console"] },
    { category: ["logtape", "meta"], lowestLevel: "error", sinks: ["console"] },
  ],
});

const app = new Hono();

await dev(app, {
  // defaultModulePath: "./plugin.ts",
  customDefaultModule: plugin,
});
Deno.serve(app.fetch);
