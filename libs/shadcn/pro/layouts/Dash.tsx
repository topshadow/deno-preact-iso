import type { ComponentChildren } from "preact";
import { AppSidebar } from "./AppSidebar.tsx";
import { BaseLayout } from "./Base.tsx";
import type { IMenuItem } from "./Menu.tsx";
import type { Signal } from "@preact/signals";


export function DashLayout(
  { children, title, menus }: {
    children: ComponentChildren;
    title?: string;
    menus: Signal<IMenuItem[]>;
  },
) {
  return (
    <BaseLayout>
      <AppSidebar open title={title} menus={menus}>
        <div class="p-4">
        {children}
        </div>
      </AppSidebar>
    </BaseLayout>
  );
}
