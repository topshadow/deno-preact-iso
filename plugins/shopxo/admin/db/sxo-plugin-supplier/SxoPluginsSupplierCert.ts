import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商证书表
export interface SxoPluginsSupplierCertTable {
  /** 自增id */
  id: Generated<number>;
  /** 供应商id */
  supplier_id: number;
  /** 证书类型 */
  type: number;
  /** 证书名称 */
  name: string;
  /** 证书图片 */
  images: string;
  /** 证书到期时间 */
  expire_time: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierCert = Selectable<SxoPluginsSupplierCertTable>;

// Zod 验证模式
export const SxoPluginsSupplierCertSchema = z.object({
  id: z.number().optional(),
  supplier_id: z.number().optional(),
  type: z.number().optional(),
  name: z.string().optional(),
  images: z.string().optional(),
  expire_time: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
