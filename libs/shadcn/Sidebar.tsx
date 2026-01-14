import type { ComponentChildren, JSX } from "preact";
import { cn } from "./utils/cn.tsx";
import { Signal } from "@preact/signals";
// import { SampleDash } from "../SampleDash.tsx";

export function SidebarContent(
  { children, ...props }: JSX.IntrinsicElements["div"] & {
    children: ComponentChildren;
  },
) {
  return (
    <div {...props} class={cn("flex-1 p-4", props.class)}>
      {children}
    </div>
  );
}

export function SidebarPanel(
  { children, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["div"],
) {
  return (
    <div
      {...props}
      class={cn(
        "w-64 min-h-screen flex flex-col bg-card border-r border-border shadow-lg transition-all duration-300 ease-in-out",
        props.class,
      )}
    >
      {children}
    </div>
  );
}
export function Sidebar(
  { children, open, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["div"]
    & { open: Signal<boolean> },
) {
  return (
    <div {...props} class="bg-background text-foreground min-h-screen flex">
      {children}
    </div>
  );
}
Sidebar.Panel = SidebarPanel;
Sidebar.Content = SidebarContent;
