import type { JSX } from "preact";
import { cn } from "../utils/cn.tsx";

export function Divider(
  { vertical, class: className, ...props }:
    & { vertical?: boolean }
    & JSX.IntrinsicElements["div"],
) {
  if (vertical) {
    return (
      <div
        class={cn("h-4 border-l border-border border", className)}
        {...props}
      >
      </div>
    );
  } else {
    return (
      <div class={cn("border-t border-border border", className)} {...props}>
      </div>
    );
  }
}
