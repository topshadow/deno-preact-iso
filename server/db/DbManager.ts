import { Kysely, SqliteDialect } from "kysely";
import { Dialect } from "../app/types/Dialect.ts";
import { IDatabase } from "./db.ts";
import SQLite from "libsql";
import { EnvObj } from "../config.ts";
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
      console.log('连接成功')
    }else{
      console.log('尚未实现')
    }
  }
}
