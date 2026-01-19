import { cn } from "../utils/cn.tsx";
import {
  type ComponentChild,
  type ComponentChildren,
  createContext,
  type JSX,
} from "preact";
import { useContext, useEffect, useRef } from "preact/hooks";
import { type Signal, useSignal } from "@preact/signals";
import { Button } from "./Button.tsx";

// ============ Dialog Provider Context ============

type AlertDialogPosition = "top" | "center" | "bottom";

type AlertDialogConfig = {
  message: string;
  duration?: number;
  position?: AlertDialogPosition;
};

type ConfirmDialogConfig = {
  title: string;
  message: string;
  resolve: (value: boolean) => void;
};

type PromptDialogConfig = {
  title: string;
  message: string;
  placeholder: string;
  resolve: (value: string | null) => void;
};

type DialogProviderContextType = {
  alertConfig: Signal<AlertDialogConfig | null>;
  confirmConfig: Signal<ConfirmDialogConfig | null>;
  promptConfig: Signal<PromptDialogConfig | null>;
  showAlert: (message: string, options?: {
    duration?: number;
    position?: AlertDialogPosition;
  }) => Promise<void>;
  showConfirm: (title: string, message: string, options?: {
    onSuccess?: () => void;
    onError?: () => void;
  }) => Promise<boolean>;
  showPrompt: (
    title: string,
    message: string,
    placeholder?: string,
    options?: {
      onSuccess?: (value: string | null) => void;
      onError?: () => void;
    },
  ) => Promise<string | null>;
};

const DialogProviderContext = createContext<DialogProviderContextType | null>(
  null,
);

export function useDialogProvider() {
  const context = useContext(DialogProviderContext);
  if (!context) {
    throw new Error("Dialog hooks must be used within DialogProvider");
  }
  return context;
}

// ============ Dialog Provider Component ============

export function DialogProvider({ children }: { children: ComponentChild }) {
  const alertConfig = useSignal<AlertDialogConfig | null>(null);
  const confirmConfig = useSignal<ConfirmDialogConfig | null>(null);
  const promptConfig = useSignal<PromptDialogConfig | null>(null);

  const showAlert = (message: string, options?: {
    duration?: number;
    position?: AlertDialogPosition;
  }): Promise<void> => {
    return new Promise((resolve) => {
      const duration = options?.duration || 3000;
      const position = options?.position || "center";

      alertConfig.value = {
        message,
        duration,
        position,
      };
      // 自动在显示后清除
      setTimeout(() => {
        alertConfig.value = null;
        resolve();
      }, duration);
    });
  };

  const showConfirm = (title: string, message: string, options?: {
    onSuccess?: () => void;
    onError?: () => void;
  }): Promise<boolean> => {
    return new Promise((resolve) => {
      confirmConfig.value = {
        title,
        message,
        resolve: (value: boolean) => {
          confirmConfig.value = null;
          if (value) {
            options?.onSuccess?.();
          } else {
            options?.onError?.();
          }
          resolve(value);
        },
      };
    });
  };

  const showPrompt = (
    title: string,
    message: string,
    placeholder: string = "",
    options?: {
      onSuccess?: (value: string | null) => void;
      onError?: () => void;
    },
  ): Promise<string | null> => {
    return new Promise((resolve) => {
      promptConfig.value = {
        title,
        message,
        placeholder,
        resolve: (value: string | null) => {
          promptConfig.value = null;
          if (value !== null) {
            options?.onSuccess?.(value);
          } else {
            options?.onError?.();
          }
          resolve(value);
        },
      };
    });
  };

  const contextValue: DialogProviderContextType = {
    alertConfig,
    confirmConfig,
    promptConfig,
    showAlert,
    showConfirm,
    showPrompt,
  };

  return (
    <DialogProviderContext.Provider value={contextValue}>
      {children}
      <AlertDialogRenderer config={alertConfig} />
      <ConfirmDialogRenderer config={confirmConfig} />
      <PromptDialogRenderer config={promptConfig} />
    </DialogProviderContext.Provider>
  );
}

// ============ Dialog Renderers ============

function AlertDialogRenderer(
  { config }: { config: Signal<AlertDialogConfig | null> },
) {
  const isOpen = useSignal(false);

  useEffect(() => {
    isOpen.value = config.value !== null;
  }, [config.value]);

  if (!config.value) return null;

  const positionClasses = {
    top: "items-start",
    center: "items-center",
    bottom: "items-end",
  };

  return (
    <Dialog
      open={isOpen}
      class={cn(positionClasses[config.value.position || "center"])}
    >
      <Dialog.Content>
        <Dialog.Header title="提示" />
        <Dialog.Body>{config.value.message}</Dialog.Body>
        <Dialog.Footer>
          <Button
            variant="default"
            onClick={() => {
              isOpen.value = false;
            }}
          >
            确定
          </Button>
        </Dialog.Footer>
      </Dialog.Content>
    </Dialog>
  );
}

function ConfirmDialogRenderer(
  { config }: { config: Signal<ConfirmDialogConfig | null> },
) {
  const isOpen = useSignal(false);

  useEffect(() => {
    isOpen.value = config.value !== null;
  }, [config.value]);

  if (!config.value) return null;

  const handleConfirm = () => {
    config.value!.resolve(true);
    isOpen.value = false;
  };

  const handleCancel = () => {
    config.value!.resolve(false);
    isOpen.value = false;
  };

  return (
    <Dialog open={isOpen}>
      <Dialog.Content>
        <Dialog.Header title={config.value.title} />
        <Dialog.Body>{config.value.message}</Dialog.Body>
        <Dialog.Footer>
          <Button variant="outline" onClick={handleCancel}>
            取消
          </Button>
          <Button variant="default" onClick={handleConfirm}>
            确定
          </Button>
        </Dialog.Footer>
      </Dialog.Content>
    </Dialog>
  );
}

function PromptDialogRenderer(
  { config }: { config: Signal<PromptDialogConfig | null> },
) {
  const isOpen = useSignal(false);
  const inputValue = useSignal("");

  useEffect(() => {
    if (config.value !== null) {
      isOpen.value = true;
      inputValue.value = "";
    }
  }, [config.value]);

  if (!config.value) return null;

  const handleConfirm = () => {
    config.value!.resolve(inputValue.value);
    isOpen.value = false;
  };

  const handleCancel = () => {
    config.value!.resolve(null);
    isOpen.value = false;
  };

  return (
    <Dialog open={isOpen}>
      <Dialog.Content>
        <Dialog.Header title={config.value.title} />
        <Dialog.Body>
          <p class="text-sm text-muted-foreground mb-3">
            {config.value.message}
          </p>
          <input
            type="text"
            value={inputValue.value}
            onInput={(e) => (inputValue.value = e.currentTarget.value)}
            placeholder={config.value.placeholder}
            class="w-full px-3 py-2 border border-input rounded-md bg-transparent text-sm placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
            onKeyDown={(e) => {
              if (e.key === "Enter") handleConfirm();
              if (e.key === "Escape") handleCancel();
            }}
            autofocus
          />
        </Dialog.Body>
        <Dialog.Footer>
          <Button variant="outline" onClick={handleCancel}>
            取消
          </Button>
          <Button variant="default" onClick={handleConfirm}>
            确定
          </Button>
        </Dialog.Footer>
      </Dialog.Content>
    </Dialog>
  );
}

// ============ Base Dialog Component ============

export type DialogContextType = {
  open: Signal<boolean>;
  title?: string;
  description?: string;
};

export const DialogContext = createContext<DialogContextType>({
  open: { value: false } as Signal<boolean>,
});

export type DialogProps = {
  open: Signal<boolean>;
  title?: string;
  description?: string;
  onOpenChange?: (open: boolean) => void;
  children: ComponentChild;
} & JSX.IntrinsicElements["div"];

export function Dialog({
  open,
  title,
  description,
  onOpenChange,
  children,
  ...props
}: DialogProps) {
  // 使用useEffect监听open.value的变化，确保组件重新渲染


  // 处理外部点击关闭
  const overlayRef = useRef<HTMLDivElement>(null);

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
  }, []);

  // 处理ESC键关闭
  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape" && open.value) {
        open.value = false;
        onOpenChange?.(false);
      }
    };

    if (open.value) {
      document.addEventListener("keydown", handleEscape);
    }

    return () => {
      document.removeEventListener("keydown", handleEscape);
    };
  }, [open.value]);

  if (!open.value) return null;

  return (
    <DialogContext.Provider value={{ open, title, description }}>
      <div
        ref={overlayRef}
        {...props}
        class={cn(
          "fixed inset-0 z-50 bg-black/50 flex items-center justify-center",
          props.class,
        )}
      >
        {children}
      </div>
    </DialogContext.Provider>
  );
}

function DialogContent({
  children,

  ...props
}: {
  children: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  const contentRef = useRef<HTMLDivElement>(null);

  // 阻止点击内容区域时关闭
  useEffect(() => {
    const handleContentClick = (e: MouseEvent) => {
      e.stopPropagation();
    };

    if (contentRef.current) {
      contentRef.current.addEventListener("click", handleContentClick);
    }

    return () => {
      if (contentRef.current) {
        contentRef.current.removeEventListener("click", handleContentClick);
      }
    };
  }, []);

  return (
    <div
      ref={contentRef}
      {...props}
      class={cn(
        "relative bg-background rounded-lg border border-border shadow-2xl w-full max-w-sm mx-4 p-6 animate-in fade-in-50 zoom-in-95 duration-200",
        props.class,
      )}
    >
      {children}
    </div>
  );
}

function DialogHeader({
  class: className,
  children,
  ...props
}: {
  children?: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  const { title, description } = useContext(DialogContext);

  return (
    <div class={cn("space-y-2 mb-4", className)} {...props}>
      {(title || children) && (
        <h2 class="text-lg font-semibold leading-none tracking-tight text-foreground">
          {title || children}
        </h2>
      )}
      {description && <p class="text-sm text-muted-foreground">{description}
      </p>}
    </div>
  );
}

function DialogBody({
  class: className,
  children,
  ...props
}: {
  children: ComponentChild;
} & JSX.IntrinsicElements["div"]) {
  return (
    <div class={cn("py-4", className)} {...props}>
      {children}
    </div>
  );
}

function DialogFooter({
  children,
  class: className,
  ...props
}: {
  children: ComponentChildren;
} & JSX.IntrinsicElements["div"]) {
  return (
    <div class={cn("flex justify-end gap-2 pt-6", className)} {...props}>
      {children}
    </div>
  );
}

Dialog.Content = DialogContent;
Dialog.Header = DialogHeader;
Dialog.Body = DialogBody;
Dialog.Footer = DialogFooter;

// ============ Dialog Hooks ============

/**
 * Alert Dialog Hook
 * 显示提示消息，需要在DialogProvider内使用
 *
 * @example
 * const { alert } = useAlertDialog();
 * await alert("操作成功!");
 */
export function useAlertDialog() {
  const { showAlert } = useDialogProvider();
  return { alert: showAlert };
}

/**
 * Confirm Dialog Hook
 * 显示确认对话框，需要在DialogProvider内使用
 *
 * @example
 * const { confirm } = useConfirmDialog();
 * const result = await confirm("删除确认", "确定要删除吗?");
 */
export function useConfirmDialog() {
  const { showConfirm } = useDialogProvider();
  return { confirm: showConfirm };
}

/**
 * Prompt Dialog Hook
 * 显示输入对话框，需要在DialogProvider内使用
 *
 * @example
 * const { prompt } = usePromptDialog();
 * const name = await prompt("输入名称", "请输入:", "默认值");
 */
export function usePromptDialog() {
  const { showPrompt } = useDialogProvider();
  return { prompt: showPrompt };
}

/**
 * 统一对话框Hook
 * 包含所有对话框功能，需要在DialogProvider内使用
 *
 * @example
 * const { alert, confirm, prompt } = useDialog();
 * await alert("操作成功!");
 * const result = await confirm("删除确认", "确定要删除吗?");
 * const name = await prompt("输入名称", "请输入:", "默认值");
 */
export function useDialog() {
  const { showAlert, showConfirm, showPrompt } = useDialogProvider();
  return {
    alert: showAlert,
    confirm: showConfirm,
    prompt: showPrompt,
  };
}
