import { os } from "@orpc/server";
import {
  SysPlugin,
  SysPluginStatus,
  type OContext,
  Output,
} from "@24wings/build/types";

import z from "zod";

// 创建插件
export const create_plugin = os
  .$context<OContext>()
  .input(
    z.object({
      name: z.string().min(1, "插件名称不能为空"),
      url: z.string().min(1, "插件URL不能为空"),

      pathname: z.string().optional().nullable(),
      default_pathname: z.string().min(1, "默认路径不能为空"),
      status: z.enum([SysPluginStatus.active, SysPluginStatus.disabled]).default(
        SysPluginStatus.active,
      ),
      tenant_id: z.number().optional().nullable(),

    }) ,
  )
  .output(
    Output.extend({
      data: z.any().optional(),
      id: z.number().optional(),
    }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      const create_at = Date.now();

      const result = await db
        .insertInto("sys-plugin")
        .values({
          name: input.name,
          url: input.url,
          
          pathname: input.pathname ?? null,
          default_pathname: input.default_pathname,
          status: input.status,
          create_at,
        })
        .executeTakeFirstOrThrow();

      return {
        ok: true,
        msg: "插件创建成功",
        id: Number(result.numInsertedOrUpdatedRows),
      };
    } catch (error) {
      console.error("创建插件失败:", error);
      return { ok: false, msg: `创建插件失败: ${error.message}` };
    }
  });

// 查询所有插件
export const list_plugin = os
  .$context<OContext>()
  .input(
    z.object({
      status: z.enum([SysPluginStatus.active, SysPluginStatus.disabled]).optional(),
      domain: z.string().optional(),
      keyword: z.string().optional(),
    }).optional(),
  )
  .output(
    Output.extend({ data: z.array(z.any()) }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      let query = db.selectFrom("sys-plugin").selectAll();

      if (input?.status) {
        query = query.where("status", "=", input.status);
      }
      if (input?.domain) {
        query = query.where("domain", "=", input.domain);
      }
      if (input?.keyword) {
        query = query.where("name", "like", `%${input.keyword}%`).orWhere("url", "like", `%${input.keyword}%`);
      }

      const data = await query.execute();
      return { ok: true, data };
    } catch (error) {
      console.error("查询插件失败:", error);
      return { ok: false, msg: `查询插件失败: ${error.message}`, data: [] };
    }
  });

// 查询单个插件
export const get_plugin = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(
    Output.extend({ data: z.any().optional() }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      const data = await db
        .selectFrom("sys-plugin")
        .selectAll()
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!data) {
        return { ok: false, msg: "插件不存在" };
      }

      return { ok: true, data };
    } catch (error) {
      console.error("查询插件失败:", error);
      return { ok: false, msg: `查询插件失败: ${error.message}` };
    }
  });

// 更新插件
export const update_plugin = os
  .$context<OContext>()
  .input(
    z.object({
      id: z.number(),
      name: z.string().optional(),
      url: z.string().optional(),
      domain: z.string().optional().nullable(),
      pathname: z.string().optional().nullable(),
      default_pathname: z.string().optional(),
      status: z.enum([SysPluginStatus.active, SysPluginStatus.disabled]).optional(),
    }),
  )
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查插件是否存在
      const existing = await db
        .selectFrom("sys-plugin")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "插件不存在" };
      }

      // 构建更新对象
      const updateData: Record<string, any> = {};
      if (input.name) updateData.name = input.name;
      if (input.url) updateData.url = input.url;
      if (input.status) updateData.status = input.status;
      if (input.domain !== undefined) updateData.domain = input.domain;
      if (input.pathname !== undefined) updateData.pathname = input.pathname;
      if (input.default_pathname) updateData.default_pathname = input.default_pathname;

      await db
        .updateTable("sys-plugin")
        .set(updateData)
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "插件更新成功" };
    } catch (error) {
      console.error("更新插件失败:", error);
      return { ok: false, msg: `更新插件失败: ${error.message}` };
    }
  });

// 删除插件
export const delete_plugin = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查插件是否存在
      const existing = await db
        .selectFrom("sys-plugin")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "插件不存在" };
      }

      await db
        .deleteFrom("sys-plugin")
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "插件删除成功" };
    } catch (error) {
      console.error("删除插件失败:", error);
      return { ok: false, msg: `删除插件失败: ${error.message}` };
    }
  });
