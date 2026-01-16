import type { SysDataSourceTable } from "./SysDb.ts";
import type { SysPluginTable } from "./SysPlugin.ts";
import type { SysTenantTable } from "./SysTenant.ts";
export interface IDatabase {
  "sys-db": SysDataSourceTable;
  "sys-plugin": SysPluginTable;
  "sys-tenant": SysTenantTable;
}
export * from "./SysDb.ts";
export * from "./SysPlugin.ts";
export * from "./SysTenant.ts";
