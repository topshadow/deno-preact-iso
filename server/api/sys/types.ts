import * as z from "zod";

// 标准输出对象
export const OutPut = z.object({ ok: z.boolean(), msg: z.string().optional() });
