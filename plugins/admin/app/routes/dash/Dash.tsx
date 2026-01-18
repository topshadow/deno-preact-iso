import { DashLayout } from "@24wings/shadcn/pro";

import { useMenus } from "../../data/menus.tsx";
import { DialogProvider } from "@24wings/shadcn";
export default function Dash({ children,  }) {
  const menus = useMenus();

  return (
    <DialogProvider>
      <DashLayout
        menus={menus}
      >
        {children}
      </DashLayout>
    </DialogProvider>
  );
}
