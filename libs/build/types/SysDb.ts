import type { Generated, Selectable } from "kysely";
import { Dialect } from "./Dialect.ts";
import * as z from "zod";
export const SysDbStatus = {
  active: "active",
  disabled: "disabled",
} as const;
export interface SysDataSourceTable {
  id: Generated<number>;
  dialect: keyof typeof Dialect;
  create_at: number;
  status: keyof typeof SysDbStatus;
  domain: string | null;
  url: string;
}

export type SysDatasource = Selectable<SysDataSourceTable>;

export const DataSouceSchema = z.object({
  "id": z.number(),
  "create_at": z.number(),
  dialect: z.enum([Dialect.Mysql, Dialect.Sqlite]),
  url: z.string(),
  status: z.enum([SysDbStatus.active, SysDbStatus.disabled]),
  domain: z.string().nullable(),
}) satisfies z.ZodType<SysDatasource>;
