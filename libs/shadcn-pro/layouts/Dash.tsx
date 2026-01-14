import type { ComponentChildren } from "preact";
import { AppSidebar } from "./AppSidebar.tsx";
import { BaseLayout } from "./Base.tsx";

export function DashLayout(
  { children, title }: { children: ComponentChildren; title?: string },
) {
  return (
    <BaseLayout>
      <AppSidebar open title={title}>
        {children}
      </AppSidebar>
    </BaseLayout>
  );
}
