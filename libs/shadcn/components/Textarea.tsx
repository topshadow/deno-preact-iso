import type { JSX } from "preact/jsx-runtime";
import { cn } from "../utils/cn.tsx";
import type { Signal } from "@preact/signals";

const Textarea = (
  { value, ...props }: JSX.IntrinsicElements["textarea"] & {
    value: Signal<string | number>;
  },
) => {
  return (
    <textarea
      {...props}
      class={cn(
        "flex min-h-[80px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-base shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
        props.class,
      )}
      value={value.value}
      onChange={(e) => value.value = (e.target as HTMLTextAreaElement).value}
    />
  );
};

export { Textarea };