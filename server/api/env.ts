import { load_env, reset_env, write_env } from "../config.ts";
import { Dialect } from "../app/types/Dialect.ts";
import { exists } from "@std/fs";
import { DatabaseSync } from "node:sqlite";
import { createConnection } from "mysql2/promise";
import { SqliteDialect } from "kysely";
import SQLite from "libsql";
import * as z from "zod";
import { db_manager } from "../db/mod.tsx";
import { Kysely } from "kysely";

import { seed } from "@24wings/build/db-manager";
import { type IDatabase, SysDbStatus } from "@24wings/build/types";

import { os } from "@orpc/server";
import { OutPut } from "./types.ts";
export const change_env = os.input(z.object({ env: z.any() })).output(OutPut)
  .handler(async ({ input }) => {
    const { env } = input;
    if (typeof env == "object") {
      await write_env(env);
      await reset_env(env);
    }
    return { ok: true };
  });

export const test_db = os
  .route({ description: "测试连接数据库" })
  .input(
    z.object({ url: z.string(), dialect: z.string() }),
  )
  .output(OutPut)
  .handler(async ({ input }) => {
    const { url, dialect } = input;
    if (dialect == Dialect.Sqlite) {
      const is_exsit = await exists(url);
      if (is_exsit) {
        // 检查系统表是否存在
        return { ok: true };
      } else {
        return {
          ok: true,
          msg: "数据库不存在,是否创建",
          data: { exsit: false },
        };
      }
    } else {
      const is_connect_success = await testConnection(url);
      if (!is_connect_success) {
        return { ok: false, msg: "连接失败", data: { exists: false } };
      } else {
        return { ok: true, msg: "连接成功" };
      }
    }
  });

export const create_db = os
  .input(z.object({ url: z.string(), dialect: z.string() }))
  .output(OutPut)
  .handler(async ({ input }) => {
    const { url, dialect } = input;
    if (dialect == Dialect.Sqlite) {
      try {
        const db = new DatabaseSync(url);
        const sqlite_dialect = new SqliteDialect({
          database: new SQLite(url),
        });
        const kysely_db = new Kysely<IDatabase>({ dialect: sqlite_dialect });

        await seed.createSysDbTable(kysely_db);
        await seed.createSysPluginTable(kysely_db);
        await seed.createSysTenantTable(kysely_db);
        await kysely_db.insertInto("sys-db").values({
          status: SysDbStatus.active,
          create_at: new Date().getTime(),
          url,
          dialect,
        }).execute();

        await db_manager.addDb({ db: kysely_db, dialect: Dialect.Sqlite });
        db_manager.default_db = { db: kysely_db, dialect: Dialect.Sqlite };
      } catch (e) {
        return { ok: false, msg: e.message };
      }
      // await db.close()
    }

    return { ok: true, msg: "创建成功" };
  });

async function testConnection(url: string) {
  let connection;
  try {
    connection = await createConnection(url);

    console.log("✅ 成功连接到 MySQL 服务器");

    // 可选：执行测试查询
    // const [rows] = await connection.execute("SELECT 1 + 1 AS solution");
    // console.log(`🔍 测试查询结果: ${rows[0].solution}`); // 输出 2
    return true;
  } catch (err) {
    console.error("❌ 连接失败:", err.message);
    return false;
  } finally {
    if (connection) await connection.end();
  }
}

export const current_status = os.output(OutPut).handler(async ({ input }) => {
  const { ok } = await load_env();
  return { ok };
});
