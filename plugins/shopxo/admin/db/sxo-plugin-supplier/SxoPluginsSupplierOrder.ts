import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商订单表
export interface SxoPluginsSupplierOrderTable {
  /** 自增id */
  id: Generated<number>;
  /** 供应商id */
  supplier_id: number;
  /** 订单编号 */
  order_no: string;
  /** 订单状态（0待支付，1已支付，2已发货，3已完成，4已取消） */
  status: number;
  /** 订单总金额 */
  total_amount: number;
  /** 实际支付金额 */
  pay_amount: number;
  /** 支付时间 */
  pay_time: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierOrder = Selectable<SxoPluginsSupplierOrderTable>;

// Zod 验证模式
export const SxoPluginsSupplierOrderSchema = z.object({
  id: z.number().optional(),
  supplier_id: z.number().optional(),
  order_no: z.string().optional(),
  status: z.number().optional(),
  total_amount: z.number().optional(),
  pay_amount: z.number().optional(),
  pay_time: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
