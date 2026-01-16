import type { ComponentChildren } from "preact";
import { AppSidebar } from "./AppSidebar.tsx";
import { BaseLayout } from "./Base.tsx";
import type { MenuItem } from "./Menu.tsx";

export function DashLayout(
  { children, title,menus }: { children: ComponentChildren; title?: string ,menus:MenuItem[]},
) {
  if(menus){
    menus.forEach(m=>m.children?.forEach(sub=>sub.path= (typeof window !='undefined'&& window.module_path) ?window.module_path+sub.path:sub.path))
  }
  return (
    <BaseLayout>
      <AppSidebar open title={title} menus={menus}> 
        {children}
      </AppSidebar>
    </BaseLayout>
  );
}
