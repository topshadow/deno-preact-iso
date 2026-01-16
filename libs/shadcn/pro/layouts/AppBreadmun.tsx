import { Icons } from "../../components/Icons.tsx";
import type { MenuItem } from "./Menu.tsx";
export function AppBreadmun({ menus }: { menus: (MenuItem | undefined)[] }) {
  return (
    <div class="flex items-center text-sm h-16 p-4 bg-popover rounded-md ">
      {menus.map((m, i) => (
        <>
          <a
            href={m?.path}
            class="text-muted-foreground hover:text-foreground transition-colors flex items-center"
          >
            {m?.icon} 
            {m?.title} 
          </a>
          {i != menus.length - 1 && (
            <span class="mx-2 text-muted-foreground">
              <Icons.ChevronRight />
            </span>
          )}
        </>
      ))}
    </div>
  );
}
