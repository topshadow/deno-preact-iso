import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商分类表
export interface SxoPluginsSupplierCategoryTable {
  /** 自增id */
  id: Generated<number>;
  /** 分类名称 */
  name: string;
  /** 是否启用（0否，1是） */
  is_enable: number;
  /** 排序 */
  sort: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierCategory = Selectable<SxoPluginsSupplierCategoryTable>;

// Zod 验证模式
export const SxoPluginsSupplierCategorySchema = z.object({
  id: z.number().optional(),
  name: z.string().optional(),
  is_enable: z.number().optional(),
  sort: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
