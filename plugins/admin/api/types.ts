import * as z from "zod";
import type { DbManager } from "@24wings/build/db-manager";

export const Output = z.object({
  ok: z.boolean(),
  msg: z.string().optional(),
});
export const DataSouceSchema = z.object({
  id: z.number(),
  dialect: z.string(),
});

