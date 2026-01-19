import z from "zod";

import { os } from "@orpc/server";
import { MenuItem } from "@24wings/shadcn/pro";
import { type OContext, Output } from "@24wings/build/types";
import { menus } from "../app/data/menus.tsx";
export const loadMenus = os
  .$context<OContext>()
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
