// import route from "jsr:@24wings/plugins-shopxo-supplier@0.1.7/plugin";
import { Hono } from "hono";

// import { BlankEnv, BlankSchema } from "hono/types";

import "@std/dotenv/load";
const app = new Hono();
import default_module from "./plugin.ts";
import { load_env } from "./config.ts";
import { modManager } from "./manager.ts";
import { db_manager } from "./db/mod.tsx";
import { SysDbStatus } from "./db/SysDb.ts";

// 刷新所有可使用插件
await modManager.load_all_modules();

const load_env_result = await load_env();
// 有配置,连接数据库,并且加载对应数据库中的模块
if (load_env_result.ok) {
  const env = load_env_result.data;
  await db_manager.connectDbFromEnv(env);
  const active_plugins = await db_manager.default_db.db.selectFrom("sys-db")
    .selectAll().where("status", "=", SysDbStatus.active).execute();
    // 当已经有安装插件时 使用安装的插件,没有时启用内置插件
    console.log(active_plugins)
  if (active_plugins.length > 0) {
    for (let p of active_plugins) {
      await modManager.install_module({ module_url: p.url, name: p.url });
      modManager.reset_default_module(active_plugins[0].url);
      
    }
  }else{
    set_buildin_default_module()
  }
} else {
  set_buildin_default_module();
}
function set_buildin_default_module() {
  modManager.default_module = {
    name: "默认模块",
    module_url: "./plugin.ts",
    mod: default_module,
  };
}

app.all("*", (r) => modManager.handle_request(r));

// const module_plugins = {
//   "shopxo-supplier": "jsr:@24wings/plugins-shopxo-supplier@0.1.7/plugin",
// };

Deno.serve(app.fetch);
