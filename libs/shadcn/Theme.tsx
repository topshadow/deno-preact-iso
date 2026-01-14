//  应用的主题context

import { Signal, useSignalEffect } from "@preact/signals";
import { createContext } from "preact";
import { useContext } from "preact/hooks";
// import { IS_BROWSER } from "fresh/runtime";
// import Cookies from "js-cookie";

export type ThemeProps = {
  is_dark: Signal<boolean>;
  color: Signal<ThemeEnum>;
};

export enum ThemeEnum {
  default = "default",
  blue = "blue",
  green = "green",
  orange = "orange",
  red = "red",
  rose = "rose",
  violet = "violet",
  yellow = "yellow",
}

export const ThemeContext = createContext<ThemeProps>({
  is_dark: new Signal(false),
  color: new Signal(ThemeEnum.default),
});

export function Theme() {
  // const is_dark=useSignal(props.is_dark)
  const { is_dark, color } = useContext(ThemeContext);
  console.log(`is dark:${is_dark} color:${color}`);
  useSignalEffect(() => {
    if (typeof document == "object") {
      console.log("theme component current theme");
      if (is_dark.value) {
        document.body.classList.add("dark");
        // Cookies.set("is_dark", "true");
      } else {
        document.body.classList.remove("dark");
        // Cookies.set("is_dark", "");
      }
      if (color.value) {
        (document.getElementById("color") as HTMLLinkElement).href =
          `/themes/${color.value}.css`;
        // Cookies.set("color", color.value);
      }
    }
  });
  return (
    <div>
    </div>
  );
}
