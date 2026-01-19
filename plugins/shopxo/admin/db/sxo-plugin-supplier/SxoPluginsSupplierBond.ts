import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商保证金表
export interface SxoPluginsSupplierBondTable {
  /** 自增id */
  id: Generated<number>;
  /** 供应商id */
  supplier_id: number;
  /** 保证金金额 */
  amount: number;
  /** 状态（0待缴纳，1已缴纳，2已退保） */
  status: number;
  /** 支付时间 */
  pay_time: number;
  /** 退保时间 */
  refund_time: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierBond = Selectable<SxoPluginsSupplierBondTable>;

// Zod 验证模式
export const SxoPluginsSupplierBondSchema = z.object({
  id: z.number().optional(),
  supplier_id: z.number().optional(),
  amount: z.number().optional(),
  status: z.number().optional(),
  pay_time: z.number().optional(),
  refund_time: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
