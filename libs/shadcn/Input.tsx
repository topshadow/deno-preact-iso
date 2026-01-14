import type { JSX } from "preact/jsx-runtime";
import { cn } from "./utils/cn.tsx";
import type { Signal } from "@preact/signals";

const Input = (
  { type, ...props }: JSX.IntrinsicElements["input"] & {
    value: Signal<string | number>;
  },
) => {
  return (
    <input
      type={type}
      {...props}
      class={cn(
        "flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-base shadow-sm transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
        props.class,
      )}
      value={props.value}
      defaultValue={props.value}
      onChange={(e) => props.value.value = (e.target as HTMLInputElement).value}
    />
  );
};

export { Input };
