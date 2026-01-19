import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商合同表
export interface SxoPluginsSupplierContractTable {
  /** 自增id */
  id: Generated<number>;
  /** 供应商id */
  supplier_id: number;
  /** 合同名称 */
  name: string;
  /** 合同文件 */
  file: string;
  /** 合同开始时间 */
  start_time: number;
  /** 合同结束时间 */
  end_time: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierContract = Selectable<SxoPluginsSupplierContractTable>;

// Zod 验证模式
export const SxoPluginsSupplierContractSchema = z.object({
  id: z.number().optional(),
  supplier_id: z.number().optional(),
  name: z.string().optional(),
  file: z.string().optional(),
  start_time: z.number().optional(),
  end_time: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
