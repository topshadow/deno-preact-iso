import type { JSX } from "preact/jsx-runtime";
import { cn } from "../utils/cn.tsx";
import type { Signal } from "@preact/signals";
import { computed, signal, useSignal } from "@preact/signals";
import { useEffect, useRef } from "preact/hooks";
import { Icons } from "./Icons.tsx";

export type SelectOption = {
  value: string | number;
  label: string;
  disabled?: boolean;
};

export type SelectProps = JSX.IntrinsicElements["select"] & {
  value: Signal<string | number>;
  options?: SelectOption[];
  placeholder?: string;
  disabled?: boolean;
  isOpen?: Signal<boolean>;
};

const Select = (
  {
    value,
    options = [],
    placeholder = "选择一个选项",
    disabled = false,
    isOpen: externalIsOpen,
    class: className,
    children,
    ...props
  }: SelectProps,
) => {
  const isOpen = externalIsOpen || useSignal(false);
  const containerRef = useRef<HTMLDivElement>(null);

  // 计算选中的标签
  const selectedLabel = computed(() => {
    const selected = options.find((opt) => opt.value === value.value);
    return selected?.label || placeholder;
  });

  // 处理外部点击关闭下拉菜单
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        containerRef.current &&
        !containerRef.current.contains(event.target as Node)
      ) {
        isOpen.value = false;
      }
    };

    if (isOpen.value) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const handleSelect = (val: string | number) => {
    value.value = val;
    isOpen.value = false;
  };

  return (
    <div
      ref={containerRef}
      class={cn("relative w-full", className)}
      {...props}
    >
      {/* 选择框 */}
      <button
        type="button"
        class={cn(
          "flex h-9 w-full items-center justify-between rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50",
          isOpen.value && "ring-1 ring-ring",
        )}
        onClick={() => isOpen.value = true}
      >
        <span
          class={cn(
            value.value ? "text-foreground" : "text-muted-foreground",
          )}
        >
          {selectedLabel}
        </span>

        <Icons.MoveDown
          class={cn(
            "h-4 w-4 opacity-50 transition-transform",
            isOpen.value && "rotate-180",
          )}
          data-lucide="chevron-down"
        />
      </button>

      {/* 下拉菜单 */}
      {isOpen.value && (
        <div
          class={cn(
            "absolute top-full left-0 right-0 z-50 mt-1 rounded-md border border-input bg-popover shadow-md",
          )}
        >
          <div class="max-h-60 overflow-y-auto">
            {options.length === 0
              ? (
                <div class="px-2 py-6 text-center text-sm text-muted-foreground">
                  暂无选项
                </div>
              )
              : (
                options.map((option) => (
                  <button
                    key={option.value}
                    type="button"
                    onClick={() =>
                      !option.disabled && handleSelect(option.value)}
                    disabled={option.disabled}
                    class={cn(
                      "w-full px-2 py-2 text-left text-sm transition-colors",
                      "hover:bg-accent hover:text-accent-foreground",
                      "focus-visible:outline-none focus-visible:bg-accent",
                      value.value === option.value &&
                        "bg-accent text-accent-foreground",
                      option.disabled &&
                        "cursor-not-allowed opacity-50 hover:bg-transparent hover:text-foreground",
                    )}
                  >
                    {option.label}
                  </button>
                ))
              )}
          </div>
        </div>
      )}

      {/* 隐藏的 select 元素用于兼容性 */}
      {children &&
        (
          <select
            {...props}
            value={value.value}
            onChange={(e) => handleSelect(e.currentTarget.value)}
            class="hidden"
          >
            {children}
          </select>
        )}
    </div>
  );
};

export { Select };
