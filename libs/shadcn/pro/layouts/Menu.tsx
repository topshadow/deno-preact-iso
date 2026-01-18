import * as z from "zod";
export type IMenuItem = {
  title: string;
  
  icon?: any|null;
  path?: string|null;
  children?: IMenuItem[];
};
export const MenuItem = z.object({
  title: z.string(),
  icon: z.any().nullable().optional(),
  path: z.string().nullable().optional(),
  children:z.array(z.any())
}) satisfies z.ZodType<IMenuItem>;
