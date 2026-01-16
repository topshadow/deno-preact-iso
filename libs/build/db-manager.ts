import { Kysely, SqliteDialect } from "kysely";
import SQLite from "libsql";
import type { EnvObj } from "./config.ts";
import type { SysDataSourceTable } from "./db/SysDb.ts";
import type { SysPluginTable } from "./db/SysPlugin.ts";
import type { SysTenantTable } from "./db/SysTenant.ts";
export interface IDatabase {
  "sys-db": SysDataSourceTable;
  "sys-plugin": SysPluginTable;
  "sys-tenant": SysTenantTable;
}
export enum Dialect {
  Mysql = "Mysql",
  Sqlite = "Sqlite",
}

enum TenantStrage {
  Domain = "Domain",
  SubDomain = "SubDomain",
  Subpath = "Subpath",
}
export type IDb = {
  db: Kysely<IDatabase>;
  dialect: Dialect;
};
export class DbManager {
  dbs: IDb[] = [];
  default_db!: IDb;

  constructor(public strage: TenantStrage = TenantStrage.Domain) {
  }

  addDb(db: IDb) {
    this.dbs.push(db);
  }
  getDb(req: Request) {
    return this.dbs[0];
  }
  connectDbFromEnv(env: EnvObj) {
    if (env.DIALECT == Dialect.Sqlite) {
      const sqlite_dialect = new SqliteDialect({
        database: new SQLite(env.DATABASE_URL),
      });
      const kysely_db = new Kysely<IDatabase>({ dialect: sqlite_dialect });
      this.default_db = { db: kysely_db, dialect: Dialect.Sqlite };
      this.addDb(this.default_db);
      console.log("连接成功");
    } else {
      console.log("尚未实现");
    }
  }
}
