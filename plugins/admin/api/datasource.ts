import { os } from "@orpc/server";
import { Output } from "./types.ts";

export const health = os.output(Output)
  .handler(async ({ input }) => {
    return { ok: true };
  });
