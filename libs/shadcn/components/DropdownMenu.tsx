import { button } from "./Button.tsx";

import { cn } from "../utils/cn.tsx";

import { Icons } from "./Icons.tsx";
import { ComponentChildren, createContext, JSX } from "preact";
import { useContext } from "preact/hooks";
import { Signal, useSignal } from "@preact/signals";
const DropdownMenuContext = createContext<{ open: Signal<boolean> }>({
  open: new Signal(false),
});

function DropdownMenuTrigger(
  { children, class: className, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["button"],
) {
  const data = useContext(DropdownMenuContext);
  return (
    <button
      type="button"
      class={cn(
        button({ variant: "ghost", size: "sm" }),
        "flex items-center",
        className,
      )}
      onClick={() => data.open.value = !data.open.value}
      {...props}
    >
      {children}

      <Icons.ChevronDown />
    </button>
  );
}
function DropdownMenuContent(
  { children, class: className, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["div"],
) {
  const { open } = useContext(DropdownMenuContext);
  return (
    <div
      {...props}
      class={cn(
        "absolute w-40 bg-popover border-border border rounded-lg text-popover-foreground shadow-md z-50 ",
        open.value ? "" : "hidden",
        className,
      )}
    >
      {children}
    </div>
  );
}
function DropdownMenuItem(
  { children, class: className, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["a"],
) {
  return (
    <a
      {...props}
      class={cn(
        "relative flex cursor-pointer select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors hover:bg-accent hover:text-accent-foreground",
        className,
      )}
    >
      {children}
    </a>
  );
}
export function DropdownMenu(
  props: { children: ComponentChildren } & { open?: boolean; id: string },
) {
  const open = useSignal(!!props.open);

  return (
    <DropdownMenuContext.Provider
      value={{ open }}
    >
      <div
        class="relative inline-block text-left"
        id={props.id}
      >
        {props.children}
      </div>
    </DropdownMenuContext.Provider>
  );
}
DropdownMenu.Trigger = DropdownMenuTrigger;
DropdownMenu.Content = DropdownMenuContent;
DropdownMenu.Item = DropdownMenuItem;

export function DropdownMenuSample() {
  return (
    <>
      <a
        href="#"
        class="relative flex cursor-pointer select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors hover:bg-accent hover:text-accent-foreground"
      >
        <i class="fas fa-download mr-2 w-4 text-center"></i>
        导出数据
      </a>

      <div class="h-[1px] bg-muted my-1"></div>

      <div class="relative group">
        <a
          href="#"
          class="relative flex cursor-pointer select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors hover:bg-accent hover:text-accent-foreground justify-between"
        >
          <span>
            <i class="fas fa-trash-alt mr-2 w-4 text-center"></i>
            删除选项
          </span>
          <i class="fas fa-chevron-right text-xs"></i>
        </a>

        <div class="absolute left-full top-0 ml-1 w-48 rounded-md border bg-popover text-popover-foreground shadow-md z-50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200">
          <div class="p-1">
            <a
              href="#"
              class="relative flex cursor-pointer select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors hover:bg-accent hover:text-accent-foreground text-destructive"
            >
              永久删除
            </a>
            <a
              href="#"
              class="relative flex cursor-pointer select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors hover:bg-accent hover:text-accent-foreground"
            >
              移至回收站
            </a>
          </div>
        </div>
      </div>
    </>
  );
}
