import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 供应商商品表
export interface SxoPluginsSupplierGoodsTable {
  /** 自增id */
  id: Generated<number>;
  /** 供应商id */
  supplier_id: number;
  /** 分类id */
  category_id: number;
  /** 品牌id */
  brand_id: number;
  /** 商品标题 */
  title: string;
  /** 商品描述 */
  describe: string;
  /** 商品图片 */
  images: string;
  /** 商品价格 */
  price: string;
  /** 商品原价 */
  original_price: string;
  /** 商品库存 */
  stock: number;
  /** 商品销量 */
  sales_count: number;
  /** 商品状态（0待审核，1已审核，2已拒绝，3已下架） */
  status: number;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplierGoods = Selectable<SxoPluginsSupplierGoodsTable>;

// Zod 验证模式
export const SxoPluginsSupplierGoodsSchema = z.object({
  id: z.number().optional(),
  supplier_id: z.number().optional(),
  category_id: z.number().optional(),
  brand_id: z.number().optional(),
  title: z.string().optional(),
  describe: z.string().optional(),
  images: z.string().optional(),
  price: z.string().optional(),
  original_price: z.string().optional(),
  stock: z.number().optional(),
  sales_count: z.number().optional(),
  status: z.number().optional(),
  add_time: z.number().optional(),
  upd_time: z.number().optional(),
});
