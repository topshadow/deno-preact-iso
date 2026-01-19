

// 导入所有Zod验证模式
import { assert } from "https://deno.land/std@0.224.0/assert/mod.ts";
import { SxoPluginsSupplierSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplier.ts";
import { SxoPluginsSupplierBondSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierBond.ts";
import { SxoPluginsSupplierBusCategorySchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierBusCategory.ts";
import { SxoPluginsSupplierCategorySchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierCategory.ts";
import { SxoPluginsSupplierCertSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierCert.ts";
import { SxoPluginsSupplierContractSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierContract.ts";
import { SxoPluginsSupplierGoodsSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierGoods.ts";
import { SxoPluginsSupplierOrderSchema } from "../db/sxo-plugin-supplier/SxoPluginsSupplierOrder.ts";

Deno.test("SxoPluginsSupplierSchema: should validate a valid supplier object", () => {
  const validSupplier = {
    id: 1,
    user_id: 100,
    code: "SUP001",
    status: 2,
    bond_status: 1,
    serfee_status: 1,
    logo: "logo.png",
    logo_long: "logo_long.png",
    banner: "banner.png",
    name: "Test Supplier",
    describe: "Test supplier description",
    category_id: 1,
    expire_time: 0,
    service_weixin_qrcode: "weixin.png",
    service_line_qrcode: "line.png",
    service_qq: "123456789",
    service_tel: "13800138000",
    notice_mobile: "13800138000",
    notice_email: "test@example.com",
    open_week: 1,
    close_week: 5,
    open_time: "09:00",
    close_time: "18:00",
    contacts_name: "Test Contact",
    contacts_tel: "13800138000",
    province: 1,
    city: 1,
    county: 1,
    address: "Test Address",
    lng: 116.4074,
    lat: 39.9042,
    auth_type: 1,
    company_name: "Test Company",
    company_number: "123456789012345678",
    idcard_name: "Test User",
    idcard_number: "110101199001011234",
    settle_rate: "80",
    is_user_settle: 1,
    fail_reason: "",
    share_images: "share.png",
    seo_title: "Test SEO Title",
    seo_keywords: "test, supplier",
    seo_desc: "Test SEO Description",
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierSchema.safeParse(validSupplier);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierSchema: should allow optional fields to be undefined", () => {
  const minimalSupplier = {};
  
  const result = SxoPluginsSupplierSchema.safeParse(minimalSupplier);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierBondSchema: should validate a valid supplier bond object", () => {
  const validBond = {
    id: 1,
    supplier_id: 1,
    amount: 10000,
    status: 1,
    pay_time: Date.now(),
    refund_time: 0,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierBondSchema.safeParse(validBond);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierBondSchema: should allow optional fields to be undefined", () => {
  const minimalBond = {};
  
  const result = SxoPluginsSupplierBondSchema.safeParse(minimalBond);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierBusCategorySchema: should validate a valid supplier business category object", () => {
  const validCategory = {
    id: 1,
    name: "Test Category",
    is_enable: 1,
    sort: 1,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierBusCategorySchema.safeParse(validCategory);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierBusCategorySchema: should allow optional fields to be undefined", () => {
  const minimalCategory = {};
  
  const result = SxoPluginsSupplierBusCategorySchema.safeParse(minimalCategory);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierCategorySchema: should validate a valid supplier category object", () => {
  const validCategory = {
    id: 1,
    name: "Test Category",
    is_enable: 1,
    sort: 1,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierCategorySchema.safeParse(validCategory);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierCategorySchema: should allow optional fields to be undefined", () => {
  const minimalCategory = {};
  
  const result = SxoPluginsSupplierCategorySchema.safeParse(minimalCategory);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierCertSchema: should validate a valid supplier cert object", () => {
  const validCert = {
    id: 1,
    supplier_id: 1,
    type: 1,
    name: "Test Certificate",
    images: "cert.png",
    expire_time: Date.now() + 365 * 24 * 60 * 60 * 1000,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierCertSchema.safeParse(validCert);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierCertSchema: should allow optional fields to be undefined", () => {
  const minimalCert = {};
  
  const result = SxoPluginsSupplierCertSchema.safeParse(minimalCert);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierContractSchema: should validate a valid supplier contract object", () => {
  const validContract = {
    id: 1,
    supplier_id: 1,
    name: "Test Contract",
    file: "contract.pdf",
    start_time: Date.now(),
    end_time: Date.now() + 365 * 24 * 60 * 60 * 1000,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierContractSchema.safeParse(validContract);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierContractSchema: should allow optional fields to be undefined", () => {
  const minimalContract = {};
  
  const result = SxoPluginsSupplierContractSchema.safeParse(minimalContract);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierGoodsSchema: should validate a valid supplier goods object", () => {
  const validGoods = {
    id: 1,
    supplier_id: 1,
    category_id: 1,
    brand_id: 1,
    title: "Test Product",
    describe: "Test product description",
    images: "product.png",
    price: "99.99",
    original_price: "129.99",
    stock: 100,
    sales_count: 0,
    status: 1,
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierGoodsSchema.safeParse(validGoods);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierGoodsSchema: should allow optional fields to be undefined", () => {
  const minimalGoods = {};
  
  const result = SxoPluginsSupplierGoodsSchema.safeParse(minimalGoods);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierOrderSchema: should validate a valid supplier order object", () => {
  const validOrder = {
    id: 1,
    supplier_id: 1,
    order_no: "ORD001",
    status: 1,
    total_amount: 99.99,
    pay_amount: 99.99,
    pay_time: Date.now(),
    add_time: Date.now(),
    upd_time: Date.now()
  };
  
  const result = SxoPluginsSupplierOrderSchema.safeParse(validOrder);
  assert(result.success);
});

Deno.test("SxoPluginsSupplierOrderSchema: should allow optional fields to be undefined", () => {
  const minimalOrder = {};
  
  const result = SxoPluginsSupplierOrderSchema.safeParse(minimalOrder);
  assert(result.success);
});
