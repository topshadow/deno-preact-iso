import { cn } from "../utils/cn.tsx";
import { type ComponentChild, createContext, type JSX } from "preact";
import { useContext, useEffect, useRef } from "preact/hooks";
import { type Signal } from "@preact/signals";

// Drawer Context Type
export type DrawerContextType = {
  open: Signal<boolean>;
  position: DrawerProps["position"];
  title?: string;
  description?: string;
};

// Create Drawer Context
export const DrawerContext = createContext<DrawerContextType>({
  open: { value: false } as Signal<boolean>,
  position: "right",
});

// Drawer Props
export type DrawerProps = {
  open: Signal<boolean>;
  position?: "left" | "right";
  effect?: "overlay" | "push";
  size?: "sm" | "md" | "lg" | "xl" | "full";
  onOpenChange?: (open: boolean) => void;
  title?: string;
  description?: string;
  children: ComponentChild;
} & JSX.IntrinsicElements["div"];

// Drawer Component
export function Drawer({
  open,
  position = "right",
  effect = "overlay",
  size = "md",
  onOpenChange,
  title,
  description,
  children,
  class: className,
  ...props
}: DrawerProps) {
  // Refs
  const overlayRef = useRef<HTMLDivElement>(null);
  const drawerRef = useRef<HTMLDivElement>(null);
  const contentRef = useRef<HTMLDivElement>(null);

  // Size mapping
  const sizeMap = {
    sm: "w-80",
    md: "w-96",
    lg: "w-[640px]",
    xl: "w-[800px]",
    full: "w-full",
  };

  // Position mapping
  const positionMap = {
    left: "left-0 right-auto transform -translate-x-full",
    right: "right-0 left-auto transform translate-x-full",
  };

  // Effect mapping
  const effectMap = {
    overlay: "fixed inset-0 z-50",
    push: "fixed inset-0 z-50",
  };

  // Handle ESC key
  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape" && open.value) {
        open.value = false;
        onOpenChange?.(false);
      }
    };

    if (open.value) {
      document.addEventListener("keydown", handleEscape);
      document.body.style.overflow = "hidden";
    }

    return () => {
      document.removeEventListener("keydown", handleEscape);
      document.body.style.overflow = "auto";
    };
  }, [open.value]);

  // Handle overlay click
  useEffect(() => {
    const handleOverlayClick = (e: MouseEvent) => {
      if (e.target === overlayRef.current) {
        open.value = false;
        onOpenChange?.(false);
      }
    };

    if (open.value && overlayRef.current) {
      overlayRef.current.addEventListener("click", handleOverlayClick);
    }

    return () => {
      if (overlayRef.current) {
        overlayRef.current.removeEventListener("click", handleOverlayClick);
      }
    };
  }, [open.value]);

  // Effect: push
  useEffect(() => {
    if (effect === "push") {
      const content = contentRef.current;
      if (!content) return;

      if (open.value) {
        const drawerWidth = drawerRef.current?.offsetWidth || 0;
        const transform = position === "left" ? `translateX(${drawerWidth}px)` : `translateX(-${drawerWidth}px)`;
        content.style.transform = transform;
      } else {
        content.style.transform = "translateX(0)";
      }
    }
  }, [open.value, effect, position]);

  if (!open.value) return null;

  return (
    <>
      {/* Overlay */}
      <div
        ref={overlayRef}
        class={cn(
          effectMap[effect],
          effect === "overlay" && "bg-black/50",
          "transition-opacity duration-300",
          "opacity-100",
          className,
        )}
        {...props}
      />

      {/* Drawer */}
      <div
        ref={drawerRef}
        class={cn(
          "fixed inset-y-0 z-50 flex flex-col",
          positionMap[position],
          sizeMap[size],
          "bg-background border border-border shadow-2xl",
          "transition-transform duration-300 ease-in-out",
          open.value ? "transform translate-x-0" : positionMap[position],
        )}
      >
        <DrawerContext.Provider value={{ open, position, title, description }}>
          {children}
        </DrawerContext.Provider>
      </div>

      {/* Content wrapper for push effect */}
      {effect === "push" && (
        <div
          ref={contentRef}
          class="fixed inset-0 z-40 transition-transform duration-300 ease-in-out"
          style={{ transform: "translateX(0)" }}
        />
      )}
    </>
  );
}

// Drawer Content Component
function DrawerContent({
  children,
  class: className,
  ...props
}: {
  children: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  return (
    <div
      class={cn(
        "flex-1 flex flex-col h-full",
        className,
      )}
      {...props}
    >
      {children}
    </div>
  );
}

// Drawer Header Component
function DrawerHeader({
  children,
  class: className,
  ...props
}: {
  children?: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  const { title, description } = useContext(DrawerContext);

  return (
    <div class={cn("flex items-center justify-between p-4 border-b", className)} {...props}>
      <div class="space-y-1">
        {(title || children) && (
          <h2 class="text-lg font-semibold leading-none tracking-tight">
            {title || children}
          </h2>
        )}
        {description && (
          <p class="text-sm text-muted-foreground">{description}</p>
        )}
      </div>
      <DrawerCloseButton />
    </div>
  );
}

// Drawer Body Component
function DrawerBody({
  children,
  class: className,
  ...props
}: {
  children: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  return (
    <div class={cn("flex-1 p-4 overflow-y-auto", className)} {...props}>
      {children}
    </div>
  );
}

// Drawer Footer Component
function DrawerFooter({
  children,
  class: className,
  ...props
}: {
  children: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  return (
    <div class={cn("p-4 border-t flex justify-end gap-2", className)} {...props}>
      {children}
    </div>
  );
}

// Drawer Close Button Component
function DrawerCloseButton({
  class: className,
  ...props
}: JSX.IntrinsicElements["button"]) {
  const { open } = useContext(DrawerContext);

  return (
    <button
      type="button"
      onClick={() => (open.value = false)}
      class={cn(
        "inline-flex items-center justify-center rounded-md text-muted-foreground hover:text-foreground hover:bg-accent p-2 transition-colors",
        className,
      )}
      {...props}
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <path d="M18 6 6 18" />
        <path d="m6 6 12 12" />
      </svg>
    </button>
  );
}

// Attach subcomponents to Drawer
Drawer.Content = DrawerContent;
Drawer.Header = DrawerHeader;
Drawer.Body = DrawerBody;
Drawer.Footer = DrawerFooter;
Drawer.CloseButton = DrawerCloseButton;
