import { JSX } from "preact/jsx-runtime";
import { cn } from "./utils/cn.tsx";
const Card = ({ class: className, ...props }: JSX.IntrinsicElements["div"]) => (
  <div
    class={cn(
      "rounded-xl border border-border bg-card text-card-foreground shadow",
      className,
    )}
    {...props}
  />
);

const CardHeader = (
  { class: className, ...props }: JSX.IntrinsicElements["div"],
) => (
  <div
    className={cn("flex flex-col space-y-1.5 p-6", className)}
    {...props}
  />
);
CardHeader.displayName = "CardHeader";

const CardTitle = (
  { class: className, ...props }: JSX.IntrinsicElements["div"],
) => (
  <div
    className={cn("font-semibold leading-none tracking-tight", className)}
    {...props}
  />
);

const CardDescription = (
  { class: className, ...props }: JSX.IntrinsicElements["div"],
) => (
  <div
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
);

const CardContent = (
  { class: className, ...props }: JSX.IntrinsicElements["div"],
) => <div className={cn("p-6 pt-0", className)} {...props} />;

const CardFooter = (
  { class: className, ...props }: JSX.IntrinsicElements["div"],
) => (
  <div
    className={cn("flex items-center p-6 pt-0", className)}
    {...props}
  />
);
Card.Content = CardContent;
Card.Header = CardHeader;
Card.Title = CardTitle;
Card.Description = CardDescription;
Card.Footer = CardFooter;
export { Card };
