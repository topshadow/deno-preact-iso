import { platform, ThemeContext, ThemeEnum } from "@24wings/shadcn";
import { useSignal, useSignalEffect } from "@preact/signals";
import type { ComponentChildren } from "preact";
export function BaseLayout({ children }: { children: ComponentChildren }) {
  const is_dark = useSignal<boolean>(false);
  const color = useSignal(ThemeEnum.default);
  useSignalEffect(() => {
    if (platform.is_browser) {
      is_dark.value = !!localStorage.getItem("is_dark");
      if (!color.value) {
        color.value = localStorage.getItem("color") as ThemeEnum ||
          ThemeEnum.default;
      }

      if (is_dark.value) {
        document.body.classList.add("dark");
      } else {
        document.body.classList.remove("dark");
      }
      if (color.value) {
        console.log("change color", color.value);
        localStorage.setItem('color',color.value)
        const theme_el = document.getElementById("theme") as HTMLLinkElement;
        if (theme_el) {
          theme_el.href = `/static/themes/${color.value}.css`;
        }
      }
    }
  });
  return (
    <ThemeContext value={{ is_dark, color }}>
      {children}
    </ThemeContext>
  );
}
