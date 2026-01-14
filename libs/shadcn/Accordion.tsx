import { useContext } from "preact/hooks";
import { type ComponentChildren, createContext } from "preact";
import { Signal } from "@preact/signals";
import { cn } from "./utils/cn.tsx";
import { Button, button } from "./Button.tsx";
export type AccordionProps = { value: Signal<string> };

const AccordionContext = createContext<{ value: Signal<string> }>({
  value: new Signal(""),
});
const AccordionItemContext = createContext({ name: "" });
export function AccordionItem(
  props: { name: string } & { children: ComponentChildren },
) {
  return (
    <AccordionItemContext.Provider value={{ name: props.name }}>
      <div class="accordion-item border-b border-border  overflow-hidden">
        {props.children}
      </div>
    </AccordionItemContext.Provider>
  );
}
export function AccordionTrigger(
  props: { children: ComponentChildren },
) {
  const { name } = useContext(AccordionItemContext);
  const { value } = useContext(AccordionContext);
  return (
    <button
      type="button"
      class={cn(
        button({ variant: "link" }),
        "w-full flex justify-between px-4 py-6 hover:underline-offset-4 transition-colors text-left hover:underline border-b border-border",
      )}
      onClick={() => {
        if (value.value == name) {
          value.value = "";
        } else {
          value.value = name;
        }
      }}
    >
      <span class="font-medium text-foreground">{props.children}</span>
      <svg
        class="h-5 w-5 text-muted-foreground accordion-icon transition-transform"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
      >
        <path d="M6 9l6 6 6-6" />
      </svg>
    </button>
  );
}
export function AccordionContent(
  props: { children: ComponentChildren },
) {
  const { value } = useContext(AccordionContext);
  const { name } = useContext(AccordionItemContext);
  return (
    <>
      <div
        class={cn(
          " overflow-hidden transition-all   duration-500  ",
          value.value == name ? "max-h-screen" : "max-h-0",
        )}
      >
        {value.value}
        {props.children}
      </div>
    </>
  );
}

export function Accordion(
  props: AccordionProps & { children: ComponentChildren },
) {
  return (
    <AccordionContext.Provider
      value={{ value: props.value }}
    >
      {props.value}
      <div class="  rounded-md overflow-hidden shadow-lg  shadow-muted-foreground">
        {props.children}
      </div>
    </AccordionContext.Provider>
  );
}
Accordion.Trigger = AccordionTrigger;
Accordion.Item = AccordionItem;
Accordion.Content = AccordionContent;
