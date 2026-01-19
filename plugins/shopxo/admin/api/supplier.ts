import { os } from "@orpc/server";
import { db, SxoPluginsSupplierSchema } from "../db/mod.ts";
import { Output } from "@24wings/build/types";
import * as z from "zod";
import type { SxoPluginsSupplier } from "../db/SysSupplier.ts";



const GetSupplierSchema = z.object({ id: z.number() });
const ListSupplierSchema = z.object({
  page: z.number().optional().default(1),
  limit: z.number().optional().default(10),
  keyword: z.string().optional().default(""),
});

// 扩展 Output 类型，添加 data 字段


// 供应商列表输出 schema
 const SupplierListOutput = Output.extend({
  data: z.object({
    list: z.array(SxoPluginsSupplierSchema),
    pagination: z.object({
      page: z.number(),
      limit: z.number(),
      total: z.number(),
    }),
  }).optional(),
});

// 单个供应商输出 schema
 const SupplierItemOutput = Output.extend({
  data: SxoPluginsSupplierSchema.optional(),
});

// 供应商操作结果输出 schema
 const SupplierResultOutput = Output.extend({
  data: z.object().optional(),
});

// 获取供应商列表
export const list_supplier = os.input(ListSupplierSchema)
.output(
  SupplierListOutput,
)
  .handler(async ({ input }) => {
    const { page, limit, keyword } = input;
    const offset = (page - 1) * limit;

    let query = db.selectFrom("sxo_plugins_supplier");

    if (keyword) {
      query = query.where("name", "like", `%${keyword}%`);
    }

    let [data, total] = await Promise.all([
      query
        .selectAll()
        .limit(limit)
        .offset(offset)
        .execute(),
      query.select(db.fn.count("id").as("count")).executeTakeFirst(),
    ]);
    console.log(data);

    // data=data.map(i=>( {...i,settle_rate:i.settle_rate}))
    
    return {
      ok: true,
      data: {
        list: data,
        pagination: {
          page,
          limit,
          total: Number(total?.count || 0),
        },
      },
    };
  });

// 获取单个供应商
export const get_supplier = os.input(GetSupplierSchema).output(
  Output,
).handler(
  async ({ input }) => {
    const { id } = input;
    const data = await db.selectFrom("sxo_plugins_supplier")
      .selectAll()
      .where("id", "=", id)
      .executeTakeFirst();

    return { ok: true, data };
  },
);

// 创建供应商
export const create_supplier = os.input(SxoPluginsSupplierSchema.omit({id:true}))
.output(
  Output.extend({data:SxoPluginsSupplierSchema}),
)
  .handler(async ({ input }) => {
    const now = Date.now() / 1000;
    const data = await db.insertInto("sxo_plugins_supplier")
      .values({
        user_id: input.user_id || 0,
        code: input.code || "",
        status: input.status || 0,
        bond_status: input.bond_status || 0,
        serfee_status: input.serfee_status || 0,
        logo: input.logo || "",
        logo_long: input.logo_long || "",
        banner: input.banner || "",
        name: input.name,
        describe: input.describe || "",
        category_id: input.category_id || 0,
        expire_time: input.expire_time || 0,
        service_weixin_qrcode: input.service_weixin_qrcode || "",
        service_line_qrcode: input.service_line_qrcode || "",
        service_qq: input.service_qq || "",
        service_tel: input.service_tel || "",
        notice_mobile: input.notice_mobile || "",
        notice_email: input.notice_email || "",
        open_week: input.open_week || -1,
        close_week: input.close_week || -1,
        open_time: input.open_time || "00:00:00",
        close_time: input.close_time || "00:00:00",
        contacts_name: input.contacts_name || "",
        contacts_tel: input.contacts_tel || "",
        province: input.province || 0,
        city: input.city || 0,
        county: input.county || 0,
        address: input.address || "",
        lng: input.lng || 0,
        lat: input.lat || 0,
        auth_type: input.auth_type || -1,
        company_name: input.company_name || "",
        company_number: input.company_number || "",
        idcard_name: input.idcard_name || "",
        idcard_number: input.idcard_number || "",
        settle_rate: input.settle_rate || 0,
        is_user_settle: input.is_user_settle || 0,
        fail_reason: input.fail_reason || "",
        share_images: input.share_images || "",
        seo_title: input.seo_title || "",
        seo_keywords: input.seo_keywords || "",
        seo_desc: input.seo_desc || "",
        add_time: now,
        upd_time: now,
      })
      .executeTakeFirstOrThrow();

    return { ok: true, data };
  });

// 更新供应商
export const update_supplier = os.input(z.object({
  id: z.number(),
  data: SxoPluginsSupplierSchema.omit({id:true}),
})).output(SupplierResultOutput).handler(async ({ input }) => {
  const { id, data } = input;
  const now = Date.now() / 1000;

  const result = await db.updateTable("sxo_plugins_supplier")
    .set({
      ...data,
      upd_time: now,
    })
    .where("id", "=", id)
    .executeTakeFirst();

  return { ok: true, data: result };
});

// 删除供应商 - 按照要求不实现删除逻辑
