import { Kysely } from "kysely";
import { SysDb, SysDbTable } from "./SysDb.ts";
import { SysPluginTable } from "./SysPlugin.ts";

export interface IDatabase {
  "sys-db": SysDbTable;
  "sys-plugin": SysPluginTable;
}

async function createSysDbTable(db: Kysely<IDatabase>) {
  await db.schema.createTable("sys-db")
    .addColumn("id", "integer", (c) => c.autoIncrement().primaryKey())
    .addColumn("domain" satisfies keyof SysDb, "text")
    .addColumn("dialect" satisfies keyof SysDb, "text")
    .addColumn("status" satisfies keyof SysDb, "text")
    .addColumn("url" satisfies keyof SysDb, "text")
    .addColumn("create_at" satisfies keyof SysDb, "text")
    .execute();
}
async function createSysPluginTable(db: Kysely<IDatabase>) {
  await db.schema.createTable("sys-plugin")
    .addColumn("id", "integer", (c) => c.autoIncrement().primaryKey());
}

export const seed = {
  createSysDbTable,
  createSysPluginTable,
};
