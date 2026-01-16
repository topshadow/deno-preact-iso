import type { MenuItem } from "@24wings/shadcn/pro";

export const menus: MenuItem[] = [
  {
    title: "开发者",
    children: [
      { path: "/", title: "数据源" },
      { path: "/dash", title: "插件管理" },
      { path: "/tenant", title: "租户管理" },
    ],
  },
];
export function get_menus_with_module_path(module_path: string) {
  const data = menus.map((m) => structuredClone(m));
  data.forEach((m) =>
    m.children?.forEach((sub) => sub.path = module_path + sub.path)
  );
  return data;
}
