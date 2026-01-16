import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "../utils/cn.tsx";
import type { JSX } from "preact";

const labelVariants = cva(
  "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70",
);

export type LabelProps =
  & JSX.IntrinsicElements["label"]
  & VariantProps<typeof labelVariants>
  & {
    children?: unknown;
  };

const Label = ({ class: className, ...props }: LabelProps) => (
  <label
    className={cn(labelVariants(), className)}
    {...props}
  />
);

export { Label };
