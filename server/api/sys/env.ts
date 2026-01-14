import { BlankEnv } from "hono/types";
import { Context } from "hono";
import { load_env, reset_env, write_env } from "../../config.ts";
import { Dialect } from "../../app/types/Dialect.ts";
import { exists } from "@std/fs";
import { DatabaseSync } from "node:sqlite";
import { createConnection } from "mysql2/promise";
import { SqliteDialect } from "kysely";
import SQLite from "libsql";

import { db_manager } from "../../db/mod.tsx";
import { Kysely } from "kysely";
import { IDatabase, seed } from "../../db/db.ts";
import { SysDbStatus } from "../../db/SysDb.ts";
import { modManager } from "../../manager.ts";
export async function change_env(c: Context<BlankEnv>) {
  const { env } = await c.req.json();
  console.log("found api");
  if (typeof env == "object") {
    await write_env(env);
    await reset_env(env);
  }
  return c.json({ ok: true });
}

export async function test_db(c: Context<BlankEnv>) {
  const { url, dialect } = await c.req.json();
  if (dialect == Dialect.Sqlite) {
    const is_exsit = await exists(url);
    if (is_exsit) {
      // 检查系统表是否存在
      return c.json({ ok: true });
    } else {
      return c.json({
        ok: true,
        msg: "数据库不存在,是否创建",
        data: { exsit: false },
      });
    }
  } else {
    const is_connect_success = await testConnection(url);
    if (!is_connect_success) {
      return c.json({ ok: false, msg: "连接失败", data: { exists: false } });
    } else {
      return c.json({ ok: true, msg: "连接成功" });
    }
  }
}

export async function create_db(c: Context<BlankEnv>) {
  const { url, dialect } = await c.req.json();
  if (dialect == Dialect.Sqlite) {
    try {
      const db = new DatabaseSync(url);
      const sqlite_dialect = new SqliteDialect({
        database: new SQLite(url),
      });
      const kysely_db = new Kysely<IDatabase>({ dialect: sqlite_dialect });

      await seed.createSysDbTable(kysely_db);
      await kysely_db.insertInto("sys-db").values({
        status: SysDbStatus.active,
        create_at: new Date().toString(),
        url,
        dialect,
      }).execute();

      await db_manager.addDb({ db: kysely_db, dialect: Dialect.Sqlite });
    } catch (e) {
      return c.json({ ok: false, msg: e.message });
    }
    // await db.close()
  }

  return c.json({ ok: true, msg: "创建成功" });
}

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

async function current_status(c: Context) {
  const { ok } = await load_env();
  return c.json({ ok });
}

async function install_admin_module(c: Context) {
  const { url } = await c.req.json();
  const install_module_result = await modManager.install_module({
    module_url: url,
    name: "默认管理员",
    "description": "描述",
  });
  if (install_module_result.ok) {
    await modManager.reset_default_module(url);
    return c.json({ ok: true });
  }
  return c.json({ ok: false, msg: install_module_result.msg });
}

export const sys_api = {
  GET: { current_status,  },
  post: {install_admin_module},
};
