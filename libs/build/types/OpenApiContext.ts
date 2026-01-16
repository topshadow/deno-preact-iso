import type { DbManager } from "@24wings/build/db-manager";

export type OContext = {
  db_manager: DbManager;
  module_path: string;
};
