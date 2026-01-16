import type { ComponentChildren } from "preact";
import { AppSidebar } from "./AppSidebar.tsx";
import { BaseLayout } from "./Base.tsx";
import type { MenuItem } from "./Menu.tsx";
import { useSignal } from "@preact/signals";

export function DashLayout(
  { children, title, menus }: {
    children: ComponentChildren;
    title?: string;
    menus: MenuItem[];
  },
) {
  const menus_context = useSignal<MenuItem[]>(menus);

  return (
    <BaseLayout>
      <AppSidebar open title={title} menus={menus_context}>
        {children}
      </AppSidebar>
    </BaseLayout>
  );
}
