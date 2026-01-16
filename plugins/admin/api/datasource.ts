import { os } from "@orpc/server";
import { DataSouceSchema, type OContext, Output } from "@24wings/build/types";

import z from "zod";

export const health = os
  .$context<OContext>()
  .output(Output)
  .handler(async ({ input, context }) => {
    console.log("env db_manager", context.db_manager);
    const data = await context.db_manager.default_db.db.selectFrom("sys-db")
      .selectAll().execute();

    return { ok: true, data };
  });
export const list_datasource = os.output(
  Output.extend({ data: z.array(DataSouceSchema) }),
)
  .handler(async ({ input }) => {
    return { ok: true, data: [] };
  });
