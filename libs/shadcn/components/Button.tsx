import { cva, type VariantProps } from "class-variance-authority";

import { cn } from "../utils/cn.tsx";
import type { JSX } from "preact/jsx-runtime";
import type { ComponentChildren } from "preact";
export const button = cva([
  "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
], {
  variants: {
    variant: {
      default: [
        "bg-primary",
        "text-primary-foreground",
        "hover:bg-primary/90",
      ],
      destructive:
        "bg-destructive text-destructive-foreground hover:bg-destructive/90",
      red: "bg-red-700 text-destructive-foreground hover:bg-destructive/90",
      outline:
        "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
      secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
      ghost: "hover:bg-accent hover:text-accent-foreground",
      link: "text-primary underline-offset-4 hover:underline",
      success: "bg-success text-success-foreground hover:bg-success/90",
      warning: "bg-warning text-warning-foreground hover:bg-warning/90",
      info: "bg-info text-info-foreground hover:bg-info/90",
    },
    size: {
      xs: "h-8 rounded-md px-2 text-xs",
      sm: "h-9 rounded-md px-3 text-xs sm:text-sm",
      default: "h-10 px-4 py-2",
      lg: "h-11 rounded-md px-8",
      xl: "h-12 rounded-md px-10 text-base",
      icon: "h-10 w-10",
    },
    rounded: {
      sm: "rounded-sm",
      default: "rounded-md",
      lg: "rounded-lg",
      full: "rounded-full",
    },
    loading: {
      true: "relative overflow-hidden",
      false: "",
    },
  },
  compoundVariants: [
    { size: "icon", rounded: "default", class: "rounded-full" },
    { loading: true, class: "disabled:opacity-100" },
  ],
  defaultVariants: {
    variant: "default",
    size: "default",
    rounded: "default",
    loading: false,
  },
});

export type ButtonProps =
  & VariantProps<typeof button>
  & JSX.IntrinsicElements["button"]
  & {
    loading?: boolean;
    leftIcon?: ComponentChildren;
    rightIcon?: ComponentChildren;
  };

export const Button = (
  { size, variant, rounded, loading, leftIcon, rightIcon, children, type, ...opt }: ButtonProps = {},
) => {
  return (
    <button
      type={type || "button"}
      {...opt}
      class={cn(button({ size, variant, rounded, loading }), opt.class)}
    >
      {loading && (
        <span className="mr-2 h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" aria-hidden="true" />
      )}
      {leftIcon && <span className="mr-2">{leftIcon}</span>}
      {children}
      {rightIcon && <span className="ml-2">{rightIcon}</span>}
    </button>
  );
};
