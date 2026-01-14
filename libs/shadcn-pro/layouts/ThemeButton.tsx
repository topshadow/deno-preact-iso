import { useContext } from "preact/hooks";
import { Button, Icons, ThemeContext } from "@24wings/shadcn";
import type { JSX } from "preact";

export function ThemeButton(props: JSX.IntrinsicElements["button"]) {
  const { is_dark } = useContext(ThemeContext);
  
  return (
    <Button
      variant="ghost"
      size="sm"
      type="button"
      {...props}
      class={props.class}
      onClick={() => {
        localStorage.setItem('is_dark',!is_dark.value?'true':'')
        is_dark.value = !is_dark.value;
      }}
    >
      {is_dark && <Icons.Sun></Icons.Sun>}
      {!is_dark && <Icons.Moon></Icons.Moon>}
    </Button>
  );
}
