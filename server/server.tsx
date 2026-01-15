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
import { SysPluginStatus } from "./db/SysPlugin.ts";

app.use(async(c,next)=>{
  c.set('default_db',db_manager.default_db);
  await next()
})

// 刷新所有可使用插件
// await modManager.load_all_variable_modules();
const builtin_module = {
  name: "默认模块",
  url: "./plugin.ts",
  mod: default_module,
};
const load_env_result = await load_env();
// 有配置,连接数据库,并且加载对应数据库中的模块
if (load_env_result.ok) {
  const env = load_env_result.data;
  await db_manager.connectDbFromEnv(env);
  const active_plugins = await db_manager.default_db.db.selectFrom("sys-plugin")
    .selectAll().where("status", "=", SysPluginStatus.active).execute();
  // 当已经有安装插件时 使用安装的插件,没有时启用内置插件
  console.table(active_plugins);
  if (active_plugins.length > 0) {
    // await modManager.refresh_all_plugin(active_plugins);
    for (let p of active_plugins) {
      console.log('starting install plugin',p)
      if(p.url.startsWith('./')){
        p.mod=await import (p.url)
      }
    let result=   await modManager.install_module(p);
    if(!result.ok){console.log('loading error:',result.msg)}
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
}

app.all("*", (r) => modManager.handle_request(r));


// const module_plugins = {
//   "shopxo-supplier": "jsr:@24wings/plugins-shopxo-supplier@0.1.7/plugin",
// };

// console.log(modManager.module_list)
Deno.serve(app.fetch);
