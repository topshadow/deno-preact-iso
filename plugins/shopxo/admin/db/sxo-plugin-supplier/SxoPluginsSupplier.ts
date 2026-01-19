import type { Generated, Selectable } from "kysely";
import { z } from "zod";

// 主供应商表
export interface SxoPluginsSupplierTable {
  /** 自增id */
  id: Generated<number>;
  /** 用户id */
  user_id: number;
  /** 编码 */
  code: string;
  /** 状态（0待提交，1待审核，2已审核，3已拒绝，4已关闭） */
  status: number;
  /** 保证金状态（0待缴纳，1已缴纳，2已退保） */
  bond_status: number;
  /** 服务费状态（0未使用，1结算比例，2服务费，3已退费） */
  serfee_status: number;
  /** 正方形店铺logo */
  logo: string;
  /** 长方形店铺logo */
  logo_long: string;
  /** 店铺banner */
  banner: string;
  /** 名称 */
  name: string;
  /** 简介 */
  describe: string;
  /** 店铺分类id */
  category_id: number;
  /** 到期时间（0则永久） */
  expire_time: number;
  /** 客服微信二维码 */
  service_weixin_qrcode: string;
  /** 客服line二维码 */
  service_line_qrcode: string;
  /** 客服QQ */
  service_qq: string;
  /** 客服电话 */
  service_tel: string;
  /** 接收通知手机号码 */
  notice_mobile: string;
  /** 接收通知电子邮箱 */
  notice_email: string;
  /** 工作日起始 */
  open_week: number;
  /** 工作日结束 */
  close_week: number;
  /** 在线时间起始 */
  open_time: string;
  /** 在线时间结束 */
  close_time: string;
  /** 联系人 */
  contacts_name: string;
  /** 联系电话 */
  contacts_tel: string;
  /** 所在省 */
  province: number;
  /** 所在市 */
  city: number;
  /** 所在县/区 */
  county: number;
  /** 详细地址 */
  address: string;
  /** 经度 */
  lng: number;
  /** 纬度 */
  lat: number;
  /** 认证类型（-1未认证，0个人，1企业） */
  auth_type: number;
  /** 企业名称 */
  company_name: string;
  /** 企业统一社会信用代码 */
  company_number: string;
  /** 身份证姓名 */
  idcard_name: string;
  /** 身份证号码 */
  idcard_number: string;
  /** 结算比例0~100的值 */
  settle_rate: string;
  /** 用户是否可以配置结算信息（针对商品中） */
  is_user_settle: number;
  /** 失败原因 */
  fail_reason: string;
  /** 分享图片 */
  share_images: string;
  /** SEO标题 */
  seo_title: string;
  /** SEO关键字 */
  seo_keywords: string;
  /** SEO描述 */
  seo_desc: string;
  /** 添加时间 */
  add_time: number;
  /** 更新时间 */
  upd_time: number;
}

export type SxoPluginsSupplier = Selectable<SxoPluginsSupplierTable>;

// Zod 验证模式
export const SxoPluginsSupplierSchema = z.object({
  id: z.number().optional().meta({ description: "自增id" }),
  user_id: z.number().optional().meta({ description: "用户id" }),
  code: z.string().optional().meta({ description: "编码" }),
  status: z.number().optional().meta({
    description: "状态（0待提交，1待审核，2已审核，3已拒绝，4已关闭）",
  }),
  bond_status: z.number().optional().meta({
    description: "保证金状态（0待缴纳，1已缴纳，2已退保）",
  }),
  serfee_status: z.number().optional().meta({
    description: "服务费状态（0未使用，1结算比例，2服务费，3已退费）",
  }),
  logo: z.string().optional().meta({ description: "正方形店铺logo" }),
  logo_long: z.string().optional().meta({ description: "长方形店铺logo" }),
  banner: z.string().optional().meta({ description: "店铺banner" }),
  name: z.string().optional().meta({ description: "名称" }),
  describe: z.string().optional().meta({ description: "简介" }),
  category_id: z.number().optional().meta({ description: "店铺分类id" }),
  expire_time: z.number().optional().meta({
    description: "到期时间（0则永久）",
  }),
  service_weixin_qrcode: z.string().optional().meta({
    description: "客服微信二维码",
  }),
  service_line_qrcode: z.string().optional().meta({
    description: "客服line二维码",
  }),
  service_qq: z.string().optional().meta({ description: "客服QQ" }),
  service_tel: z.string().optional().meta({ description: "客服电话" }),
  notice_mobile: z.string().optional().meta({
    description: "接收通知手机号码",
  }),
  notice_email: z.string().optional().meta({ description: "接收通知电子邮箱" }),
  open_week: z.number().optional().meta({ description: "工作日起始" }),
  close_week: z.number().optional().meta({ description: "工作日结束" }),
  open_time: z.string().optional().meta({ description: "在线时间起始" }),
  close_time: z.string().optional().meta({ description: "在线时间结束" }),
  contacts_name: z.string().optional().meta({ description: "联系人" }),
  contacts_tel: z.string().optional().meta({ description: "联系电话" }),
  province: z.number().optional().meta({ description: "所在省" }),
  city: z.number().optional().meta({ description: "所在市" }),
  county: z.number().optional().meta({ description: "所在县/区" }),
  address: z.string().optional().meta({ description: "详细地址" }),
  lng: z.string().optional().meta({ description: "经度" }),
  lat: z.string().optional().meta({ description: "纬度" }),
  auth_type: z.number().optional().meta({
    description: "认证类型（-1未认证，0个人，1企业）",
  }),
  company_name: z.string().optional().meta({ description: "企业名称" }),
  company_number: z.string().optional().meta({
    description: "企业统一社会信用代码",
  }),
  idcard_name: z.string().optional().meta({ description: "身份证姓名" }),
  idcard_number: z.string().optional().meta({ description: "身份证号码" }),
  settle_rate: z.string().optional().meta({ description: "结算比例0~100的值" }),
  is_user_settle: z.number().optional().meta({
    description: "用户是否可以配置结算信息（针对商品中）",
  }),
  fail_reason: z.string().optional().meta({ description: "失败原因" }),
  share_images: z.string().optional().meta({ description: "分享图片" }),
  seo_title: z.string().optional().meta({ description: "SEO标题" }),
  seo_keywords: z.string().optional().meta({ description: "SEO关键字" }),
  seo_desc: z.string().optional().meta({ description: "SEO描述" }),
  add_time: z.number().optional().meta({ description: "添加时间" }),
  upd_time: z.number().optional().meta({ description: "更新时间" }),
});
