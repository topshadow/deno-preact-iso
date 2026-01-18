import { os } from "@orpc/server";
import {
  type OContext,
  Output,
  SysTenant,
  SysTenantStatus,
  SysTenantStrategy,
} from "@24wings/build/types";

import z from "zod";

// 创建租户
export const create_tenant = os
  .$context<OContext>()
  .input(
    z.object({
      name: z.string().min(1, "租户名称不能为空"),
      url: z.string().min(1, "租户URL不能为空"),
      status: z.enum([SysTenantStatus.active, SysTenantStatus.disabled])
        .default(
          SysTenantStatus.active,
        ),
      strategy: z.enum([
        SysTenantStrategy.Domain,
        SysTenantStrategy.SubDomain,
        SysTenantStrategy.Default,
      ]).default(
        SysTenantStrategy.Default,
      ),
      is_default: z.boolean().default(false),
    }),
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

      // 如果设置为默认租户，先将其他租户的is_default设置为false
      if (input.is_default) {
        await db
          .updateTable("sys-tenant")
          .set({ is_default: false })
          .execute();
      }

      const result = await db
        .insertInto("sys-tenant")
        .values({
          name: input.name,
          url: input.url,
          status: input.status,
          strategy: input.strategy,
          is_default: input.is_default ? 1 : 0,
          create_at,
        })
        .executeTakeFirstOrThrow();

      return {
        ok: true,
        msg: "租户创建成功",
        id: Number(result.numInsertedOrUpdatedRows),
      };
    } catch (error) {
      console.error("创建租户失败:", error);
      return { ok: false, msg: `创建租户失败: ${error.message}` };
    }
  });

// 查询所有租户
export const list_tenant = os
  .$context<OContext>()
  .input(
    z.object({
      status: z.enum([SysTenantStatus.active, SysTenantStatus.disabled])
        .optional(),
      keyword: z.string().optional(),
    }).optional(),
  )
  .output(
    Output.extend({ data: z.array(z.any()) }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      let query = db.selectFrom("sys-tenant").selectAll();

      if (input?.status) {
        query = query.where("status", "=", input.status);
      }
      if (input?.keyword) {
        query = query.where("name", "like", `%${input.keyword}%`).orWhere(
          "url",
          "like",
          `%${input.keyword}%`,
        );
      }

      const data = await query.execute();
      return { ok: true, data };
    } catch (error) {
      console.error("查询租户失败:", error);
      return { ok: false, msg: `查询租户失败: ${error.message}`, data: [] };
    }
  });

// 查询单个租户
export const get_tenant = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(
    Output.extend({ data: z.any().optional() }),
  )
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;
      const data = await db
        .selectFrom("sys-tenant")
        .selectAll()
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!data) {
        return { ok: false, msg: "租户不存在" };
      }

      return { ok: true, data };
    } catch (error) {
      console.error("查询租户失败:", error);
      return { ok: false, msg: `查询租户失败: ${error.message}` };
    }
  });

// 更新租户
export const update_tenant = os
  .$context<OContext>()
  .input(
    z.object({
      id: z.number(),
      name: z.string().optional(),
      url: z.string().optional(),
      status: z.enum([SysTenantStatus.active, SysTenantStatus.disabled])
        .optional(),
      strategy: z.enum([
        SysTenantStrategy.Domain,
        SysTenantStrategy.SubDomain,
        SysTenantStrategy.Default,
      ]).optional(),
      is_default: z.boolean().optional(),
    }),
  )
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查租户是否存在
      const existing = await db
        .selectFrom("sys-tenant")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "租户不存在" };
      }

      // 如果设置为默认租户，先将其他租户的is_default设置为false
      if (input.is_default) {
        await db
          .updateTable("sys-tenant")
          .set({ is_default: false })
          .execute();
      }

      // 构建更新对象
      const updateData: Record<string, any> = {};
      if (input.name) updateData.name = input.name;
      if (input.url) updateData.url = input.url;
      if (input.status) updateData.status = input.status;
      if (input.strategy) updateData.strategy = input.strategy;
      if (input.is_default !== undefined) {
        updateData.is_default = input.is_default;
      }

      await db
        .updateTable("sys-tenant")
        .set(updateData)
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "租户更新成功" };
    } catch (error) {
      console.error("更新租户失败:", error);
      return { ok: false, msg: `更新租户失败: ${error.message}` };
    }
  });

// 删除租户
export const delete_tenant = os
  .$context<OContext>()
  .input(z.object({ id: z.number() }))
  .output(Output)
  .handler(async ({ input, context }) => {
    try {
      const { db } = context.db_manager.default_db;

      // 检查租户是否存在
      const existing = await db
        .selectFrom("sys-tenant")
        .select("id")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (!existing) {
        return { ok: false, msg: "租户不存在" };
      }

      // 不允许删除默认租户
      const tenant = await db
        .selectFrom("sys-tenant")
        .select("is_default")
        .where("id", "=", input.id)
        .executeTakeFirst();

      if (tenant?.is_default) {
        return { ok: false, msg: "不允许删除默认租户" };
      }

      await db
        .deleteFrom("sys-tenant")
        .where("id", "=", input.id)
        .execute();

      return { ok: true, msg: "租户删除成功" };
    } catch (error) {
      console.error("删除租户失败:", error);
      return { ok: false, msg: `删除租户失败: ${error.message}` };
    }
  });
