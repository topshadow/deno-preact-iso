import type{ ModuleManager } from "../src/module-manager/ModuleManager.ts";
import type { DbManager } from "../src/db/db-manager.ts";
import type { Hono } from "hono";

export type OContext = {
  db_manager: DbManager;
  module_path: string;
  hono: Hono;
  modManager: ModuleManager;
};
