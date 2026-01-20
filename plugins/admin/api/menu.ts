import z from "zod";

import { os } from "@orpc/server";
import { MenuItem } from "@24wings/shadcn/pro";
import { type OContext, Output } from "@24wings/build/types";
import { menus } from "../app/data/menus.tsx";
/**
 * 加载菜单列表
 * @description 获取系统菜单列表，包括基础菜单和插件菜单
 * @returns {Promise<Output>} 返回菜单列表，包含菜单项的标题、图标、路径等信息
 */
export const loadMenus = os
  .$context<OContext>()
  .route({ description: "获取系统菜单列表，包括基础菜单和插件菜单" })
  .output(Output.extend({ data: z.array(MenuItem) }))
  .handler(async ({ context }) => {
    const data = menus.map((m) => structuredClone(m));
    const plugins = await context.db_manager.default_db.db
      .selectFrom("sys-plugin")
      .selectAll()
      .where("status", "=", "active").execute();
    data.push({
      title: "插件",
      children: plugins.map((p) => ({
        title: p.name || p.url,
        icon: "",
        path: p.pathname || p.default_pathname,
        external: true,
      })),
    });
    return { ok: true, data };
  });
