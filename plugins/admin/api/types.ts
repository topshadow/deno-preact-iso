import * as z from "zod";
import type { DbManager } from "../../../libs/build/src/db/db-manager.ts";

export const Output = z.object({
  ok: z.boolean(),
  msg: z.string().optional(),
});
export const DataSouceSchema = z.object({
  id: z.number(),
  dialect: z.string(),
});

