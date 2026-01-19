import {
  ColumnType,
  Generated,
  Insertable,
  JSONColumnType,
  Kysely,
  MysqlDialect,
  Selectable,
  Updateable,
} from "kysely";
import { createPool } from "mysql2";
import type { SxoPluginsSupplierTable } from "./sxo-plugin-supplier/SxoPluginsSupplier.ts";

export interface Database {
  "sxo_plugins_supplier": SxoPluginsSupplierTable;
}

const dialect = new MysqlDialect({
  pool: createPool({
    database: "sql287102",
    host: "8.152.216.126",
    user: "sql287102",
    password: "hJFbYGryTe",
    port: 3306,
    connectionLimit: 10,
  }),
});

export const db = new Kysely<Database>({
  dialect,
});
export * from './sxo-plugin-supplier/SxoPluginsSupplier.ts'
export * from './sxo-plugin-supplier/SxoPluginsSupplierBusCategory.ts'
export * from './sxo-plugin-supplier/SxoPluginsSupplierBond.ts'
export * from './sxo-plugin-supplier/SxoPluginsSupplierOrder.ts'