import { cn } from "../utils/cn.tsx";
import { type ComponentChild, type ComponentChildren, createContext, type JSX } from "preact";
import { useContext } from "preact/hooks";

export const DialogContext = createContext<Omit<DialogProps, "children">>({
  signlar_name: "",
  title: "",
  summary: "",
  open: false,
});
export type DialogProps = {
  signlar_name?: string;
  children: ComponentChild;
  title?: ComponentChild;
  summary?: ComponentChild;
  open?: boolean;
} & JSX.IntrinsicElements["div"];
export function Dialog(
  { children, title, summary, open, ...props }: DialogProps,
) {
  return (
    <DialogContext.Provider
      value={{ title, summary, open: !!open }}
    >
      <div {...props}>
        <div
          id="dialogOverlay"
          class="fixed inset-0 bg-black/60 z-40 "
        >
        </div>

        {children}
      </div>
    </DialogContext.Provider>
  );
}

function DialogTrigger(
  { children, class: className, ...props }:
    & { children: ComponentChild }
    & JSX.IntrinsicElements["div"],
) {
  const { signlar_name } = useContext(DialogContext);
  return (
    <div
      {...props}
      class={cn("absolute  right-1 top-1 cursor-pointer", className)}
    >
      {children}
    </div>
  );
}

function DialogContent(
  { children, class: className, ...props }:
    & { children: ComponentChild }
    & JSX.IntrinsicElements["div"],
) {
  const { title, summary, open } = useContext(DialogContext);
  return (
    <div
      class={cn(
        "fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-background rounded-lg border border-border shadow-xl  z-50 p-6 ",
        className,
      )}
      {...props}
    >
      {children}
    </div>
  );
}
function DialogHeader(
  { class: className, ...props }:
    & { children: ComponentChild }
    & JSX.IntrinsicElements["div"],
) {
  return (
    <div class={cn("space-y-1.5", className)} {...props}>
      <h3 class="text-lg font-semibold text-foreground">{props.title}</h3>
      <p class="text-sm text-mutedForeground">
        {props.summary}
      </p>
    </div>
  );
}

function DialogFooter(
  { children, class: className, ...props }:
    & { children: ComponentChildren }
    & JSX.IntrinsicElements["div"],
) {
  return (
    <div class={cn(" absolute bottom-4  right-4 w-full", className)} {...props}>
      {children}
    </div>
  );
}

Dialog.Trigger = DialogTrigger;
Dialog.Content = DialogContent;
Dialog.Footer = DialogFooter;
