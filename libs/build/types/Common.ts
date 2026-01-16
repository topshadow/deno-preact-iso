import * as z from "zod";
export const Output = z.object({
  ok: z.boolean(),
  msg: z.string().optional(),
});
