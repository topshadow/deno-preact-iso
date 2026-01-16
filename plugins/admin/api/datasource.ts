import { os } from "@orpc/server";
import { DataSouceSchema, type OContext, Output } from "./types.ts";

import z from "zod";

export const health = os
  .$context< OContext >()
  .output(Output)
  .handler(async ({ input, context }) => {
    console.log("env db_manager", context.db_manager);

    return { ok: true };
  });
export const list_datasource = os.output(
  Output.extend({ data: z.array(DataSouceSchema) }),
)
  .handler(async ({ input }) => {
    return { ok: true, data: [] };
  });
