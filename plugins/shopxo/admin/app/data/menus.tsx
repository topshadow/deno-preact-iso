import type { IMenuItem } from "@24wings/shadcn/pro";
import { type Signal, useSignal } from "@preact/signals";
import { useEffect } from "preact/hooks";
import { orpc_client } from "../../orpc-client.ts";

export const menus: IMenuItem[] = [
  {
    title: "供应商",
    children: [
      { path: "/shopxo/dash/supplier", title: "供应商" },

      { path: "/shopxo/tenant", title: "租户管理" },
      { path: "/shopxo/tasker", title: "任务管理" },
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

export function useMenus(): Signal<IMenuItem[]> {
  const menus = useSignal<IMenuItem[]>([]);
  useEffect(() => {
    orpc_client.menu.loadMenus().then((r) => menus.value = r.data);
  }, []);
  return menus;
}
