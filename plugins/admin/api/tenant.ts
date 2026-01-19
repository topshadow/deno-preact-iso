import { os } from "@orpc/server";
import {
  type OContext,
  Output,
  SysTenant,
  SysTenantStatus,
  SysTenantStrategy,
} from "@24wings/build/types";

import z from "zod";

/**
 * 创建租户
 * @description 创建新的租户配置
 * @param {Object} input - 租户创建参数
 * @param {string} input.name - 租户名称，不能为空
 * @param {string} input.url - 租户URL，不能为空
 * @param {SysTenantStatus} [input.status] - 租户状态，默认为active
 * @param {SysTenantStrategy} [input.strategy] - 租户策略，支持Domain、SubDomain或Default，默认为Default
 * @param {number} [input.is_default] - 是否为默认租户，默认为0（非默认）
 * @returns {Promise<Output>} 返回创建结果，包含创建的租户ID
 */
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
      is_default: z.number().default(0),
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
          .set({ is_default: 0 })
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

/**
 * 查询所有租户
 * @description 获取租户列表，支持按状态和关键词筛选
 * @param {Object} [input] - 查询参数
 * @param {SysTenantStatus} [input.status] - 租户状态筛选
 * @param {string} [input.keyword] - 关键词搜索，匹配租户名称或URL
 * @returns {Promise<Output>} 返回租户列表
 */
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

/**
 * 查询单个租户
 * @description 根据ID获取租户详情
 * @param {Object} input - 查询参数
 * @param {number} input.id - 租户ID
 * @returns {Promise<Output>} 返回租户详情
 */
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

/**
 * 更新租户
 * @description 根据ID更新租户配置
 * @param {Object} input - 更新参数
 * @param {number} input.id - 租户ID
 * @param {string} [input.name] - 租户名称
 * @param {string} [input.url] - 租户URL
 * @param {SysTenantStatus} [input.status] - 租户状态
 * @param {SysTenantStrategy} [input.strategy] - 租户策略，支持Domain、SubDomain或Default
 * @param {boolean} [input.is_default] - 是否为默认租户
 * @returns {Promise<Output>} 返回更新结果
 */
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
          .set({ is_default: 0 })
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

/**
 * 删除租户
 * @description 根据ID删除租户，不允许删除默认租户
 * @param {Object} input - 删除参数
 * @param {number} input.id - 租户ID
 * @returns {Promise<Output>} 返回删除结果
 */
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
