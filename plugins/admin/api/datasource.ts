import { os } from "@orpc/server";
import {
  DataSouceSchema,
  Dialect,
  type OContext,
  Output,
  SysDbStatus,
} from "@24wings/build/types";

import z from "zod";

// 创建数据源
export const create_datasource = os
  .$context<OContext>()
  .input(
    z.object({
      url: z.string().optional().nullable(),
      dialect: z.enum([Dialect.Mysql, Dialect.Sqlite]),
      domain: z.string().optional().nullable(),
      status: z.enum([SysDbStatus.active, SysDbStatus.disabled]).default(
        SysDbStatus.active,
      ),
    }),
  )
  .output(
    Output.extend({
      data: DataSouceSchema.optional(),
      id: z.number().optional(),
    }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      const create_at = Date.now();

      const result = await db
        .insertInto("sys-db")
        .values({
          url: input.url,
          dialect: input.dialect,
          domain: input.domain ?? null,
          status: input.status,
          create_at,
        })
        .executeTakeFirstOrThrow();

      return {
        ok: true,
        msg: "数据源创建成功",
        id: Number(result.numInsertedOrUpdatedRows),
      };
    } catch (error) {
      console.error("创建数据源失败:", error);
      return { ok: false, msg: `创建数据源失败: ${error.message}` };
    }
  });

// 查询所有数据源
export const list_datasource = os
  .$context<OContext>()
  .input(
    z.object({
      status: z.enum([SysDbStatus.active, SysDbStatus.disabled]).optional(),
      domain: z.string().optional(),
    }).optional(),
  )
  .output(
    Output.extend({ data: z.array(DataSouceSchema) }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      let query = db.selectFrom("sys-db").selectAll();

      if (input?.status) {
        query = query.where("status", "=", input.status);
      }
      if (input?.domain) {
        query = query.where("domain", "=", input.domain);
      }

      const data = await query.execute();
      return { ok: true, data };
    } catch (error) {
      console.error("查询数据源失败:", error);
      return { ok: false, msg: `查询数据源失败: ${error.message}`, data: [] };
    }
  });

// 查询单个数据源
export const get_datasource = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(
    Output.extend({ data: DataSouceSchema.optional() }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      const data = await db
        .selectFrom("sys-db")
        .selectAll()
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!data) {
        return { ok: false, msg: "数据源不存在" };
      }

      return { ok: true, data };
    } catch (error) {
      console.error("查询数据源失败:", error);
      return { ok: false, msg: `查询数据源失败: ${error.message}` };
    }
  });

// 更新数据源
export const update_datasource = os
  .$context<OContext>()
  .input(
    z.object({
      id: z.number(),
      url: z.string().url("数据库URL必须是有效的URL格式").optional(),
      domain: z.string().optional().nullable(),
      status: z.enum([SysDbStatus.active, SysDbStatus.disabled]).optional(),
    }),
  )
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查数据源是否存在
      const existing = await db
        .selectFrom("sys-db")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "数据源不存在" };
      }

      // 构建更新对象
      const updateData: Record<string, any> = {};
      if (input.url) updateData.url = input.url;
      if (input.status) updateData.status = input.status;
      if (input.domain !== undefined) updateData.domain = input.domain;

      await db
        .updateTable("sys-db")
        .set(updateData)
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "数据源更新成功" };
    } catch (error) {
      console.error("更新数据源失败:", error);
      return { ok: false, msg: `更新数据源失败: ${error.message}` };
    }
  });

// 删除数据源
export const delete_datasource = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查数据源是否存在
      const existing = await db
        .selectFrom("sys-db")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "数据源不存在" };
      }

      await db
        .deleteFrom("sys-db")
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "数据源删除成功" };
    } catch (error) {
      console.error("删除数据源失败:", error);
      return { ok: false, msg: `删除数据源失败: ${error.message}` };
    }
  });

// 健康检查
export const health = os
  .$context<OContext>()
  .output(Output)
  .handler(async ({ input, context }) => {
    console.log("env db_manager", context.db_manager);
    const data = await context.db_manager.default_db.db.selectFrom("sys-db")
      .selectAll().execute();

    return { ok: true, data };
  });
