import * as z from "zod";
export type IMenuItem = {
  title: string;
  
  icon?: any|null;
  path?: string|null;
  children?: IMenuItem[];
  external?:boolean|null
};
export const MenuItem = z.object({
  title: z.string(),
  icon: z.any().nullable().optional(),
  path: z.string().nullable().optional(),
  children:z.array(z.any()),
  external:z.boolean().nullable().optional()
}) satisfies z.ZodType<IMenuItem>;
