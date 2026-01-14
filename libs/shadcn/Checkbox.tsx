"use client";

import { JSX } from "preact/jsx-runtime";
import { cn } from "./utils/cn.tsx";
const Checkbox = (
  { class: className, name, checked, ...props }: {
    class?: string;
    name?: string;
    checked: boolean;
  } & JSX.IntrinsicElements["button"],
) => {
  return (
    <button
      {...props}
      className={cn(
        "peer h-4 w-4 shrink-0 rounded-sm border border-primary shadow focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50  relative  cursor-pointer",
        className,
        checked ? "text-primary-foreground" : "",
      )}
      // data-class={JSON.stringify({ "text-primary-foreground": name })}
    >
      {/* <p data-text={name}></p> */}
      {checked && (
        <span
          // data-show={`${name}`}
          className={cn(
            "flex items-center justify-center text-current bg-primary absolute top-0 left-0",
          )}
        >
          <i className="h-4 w-4" data-lucide="check" />
        </span>
      )}
    </button>
  );
};

export { Checkbox };
