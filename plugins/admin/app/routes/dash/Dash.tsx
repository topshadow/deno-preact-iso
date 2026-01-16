import { DashLayout } from "@24wings/shadcn/pro";
import { get_menus_with_module_path } from "../../data/menus.tsx";
import type { Context } from "hono";
export const loader = (c: Context) => {
  const module_path = c.env.module_path as string;

  return { count: 1, menus: get_menus_with_module_path(module_path) };
};
export const Component = ({ menus }: Awaited<ReturnType<typeof loader>>) => {
  return (
    <DashLayout
      menus={menus}
    >
      内容
    </DashLayout>
  );
};
