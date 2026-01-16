import { Hono } from "hono";
import "@std/dotenv/load";
const app = new Hono();
import default_module from "./plugin.ts";
import { load_env } from "./config.ts";
import { modManager } from "./manager.ts";
import { db_manager } from "./db/mod.tsx";
import { parseArgs } from "@std/cli";
import { SysPluginStatus, type SysPluginWithModule } from "./db/SysPlugin.ts";

const args = parseArgs<{ m: string; d?: string; help?: boolean }>(Deno.args);
if (args.help) {
  console.log(`
-m  设置默认模块
-d  禁用其他模块
`);
}
app.use(async (c, next) => {
  c.set("db_manager", db_manager);
  await next();
});

// 刷新所有可使用插件
// await modManager.load_all_variable_modules();
const builtin_module = {
  name: "默认模块",
  url: args.m || "./plugin.ts",
  mod: default_module,
  pathname: "/",
};
// await modManager.install_module(builtin_module);
if (args.m) {
  const import_mod = await import(args.m);
  builtin_module.mod = import_mod.default;
}

const load_env_result = await load_env();
// 有配置,连接数据库,并且加载对应数据库中的模块
if (load_env_result.ok && !args.d) {
  const env = load_env_result.data;
  await db_manager.connectDbFromEnv(env);
  const active_plugins: SysPluginWithModule[] = await db_manager.default_db.db
    .selectFrom("sys-plugin")
    .selectAll().where("status", "=", SysPluginStatus.active).execute();
  // 当已经有安装插件时 使用安装的插件,没有时启用内置插件
  console.table(active_plugins);
  if (active_plugins.length > 0) {
    // await modManager.refresh_all_plugin(active_plugins);
    for (const p of active_plugins) {
      console.log(
        "starting install plugin, url:",
        p.url,
        "  status:",
        p.status,
      );
      if (p.url.startsWith("./")) {
        p.mod = await import(p.url);
      }
      const result = await modManager.install_module(p);
      if (!result.ok) console.error("loading error:", result.msg);
    }
  } else {
    set_buildin_default_module();
  }
} else {
  set_buildin_default_module();
}
function set_buildin_default_module() {
  modManager.default_module = {
    id: 0,
    ...builtin_module,
    default_pathname: "/plugins/base",
  };
  console.log("设置内置模块", modManager.default_module);
}
app.all("*", (r) => modManager.handle_request(r));
console.table(modManager.module_list.map((m) => {
  const { mod, ...print } = m;
  return print;
}));
Deno.serve(app.fetch);
