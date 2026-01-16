import { os } from "@orpc/server";
import * as z from "zod";
import { db_manager } from "../db/mod.tsx";
import { modManager } from "../manager.ts";
import { OutPut } from "./types.ts";
import { SysPluginStatus } from "@24wings/build/types";




export const install_admin_module = os
  .input(z.object({ url: z.string() }))
  .output(OutPut)
  .handler(async ({ input }) => {
    const { url } = input;
    // 如果插件已经安装 则返回错误
    const exsit = await db_manager.default_db.db.selectFrom("sys-plugin")
      .selectAll().where("url", "=", url).limit(1).execute();
    if (exsit.length > 0) {
      return { ok: false, msg: "插件已经安装" };
    }

    await db_manager.default_db.db.insertInto("sys-plugin").values({
      name: "引导模块",
      url: "./plugin.ts",
      create_at: Date.now(),
      status: SysPluginStatus.active,
      default_pathname: "/plugins/base",
    }).execute();
    const install_module_result = await modManager.install_module({
      url: url,
      name: "默认管理系统",
   
    });
    if (install_module_result.ok) {
      await modManager.reset_default_module(url);
      await db_manager.default_db.db.insertInto("sys-plugin").values({
        name: "默认管理系统",
        url: url,
        create_at: Date.now(),
        status: SysPluginStatus.active,
        pathname: "/admin",
        default_pathname: "/plugins/admin",
      }).execute();
      return { ok: true };
    }
    return { ok: false, msg: install_module_result.msg };
  });
