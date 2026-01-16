import type { Kysely } from "kysely";
import type { SysDatasource } from "./types/SysDb.ts";
import type { SysPlugin } from "./types/SysPlugin.ts";
import type { SysTenant } from "./types/SysTenant.ts";
import type { IDatabase } from "./types/db.ts";

async function createSysDbTable(db: Kysely<IDatabase>) {
  await db.schema.createTable("sys-db")
    .addColumn("id", "integer", (c) => c.autoIncrement().primaryKey())
    .addColumn("domain" satisfies keyof SysDatasource, "text")
    .addColumn("dialect" satisfies keyof SysDatasource, "text")
    .addColumn("status" satisfies keyof SysDatasource, "text")
    .addColumn("url" satisfies keyof SysDatasource, "text")
    .addColumn("create_at" satisfies keyof SysDatasource, "integer")
    .execute();
}
async function createSysPluginTable(db: Kysely<IDatabase>) {
  await db.schema.createTable("sys-plugin")
    .addColumn("id", "integer", (c) => c.autoIncrement().primaryKey())
    .addColumn("status" satisfies keyof SysPlugin, "text")
    .addColumn("name" satisfies keyof SysPlugin, "text")
    .addColumn("url" satisfies keyof SysPlugin, "text")
    .addColumn("create_at" satisfies keyof SysPlugin, "integer")
    .addColumn("pathname" satisfies keyof SysPlugin, "text")
    .addColumn(
      "default_pathname" satisfies keyof SysPlugin,
      "text",
      (c) => c.notNull(),
    )
    .addColumn("tenant_id" satisfies keyof SysPlugin, "integer")
    // .addColumn(''  satisfies keyof SysPlugin ,'text')
    .execute();
}
async function createSysTenantTable(db: Kysely<IDatabase>) {
  await db.schema.createTable("sys-tenant")
    .addColumn("id", "integer", (c) => c.autoIncrement().primaryKey())
    .addColumn("status" satisfies keyof SysTenant, "text")
    .addColumn("name" satisfies keyof SysTenant, "text")
    .addColumn("url" satisfies keyof SysTenant, "text")
    .addColumn("is_default" satisfies keyof SysTenant, "boolean")
    .addColumn("create_at" satisfies keyof SysTenant, "integer")
    // .addColumn(''  satisfies keyof SysPlugin ,'text')
    .execute();
}

export const seed = {
  createSysDbTable,
  createSysPluginTable,
  createSysTenantTable,
};
