export * from "./Accordion.tsx";
export * from "./Button.tsx";
export * from "./utils/cn.tsx";
export * from "./Icons.tsx";
export * from "./Theme.tsx";
export * from "./Sidebar.tsx";
export * from "./DropdownMenu.tsx";
export * from "./Input.tsx";
export * from "./Divider.tsx";
export * from './Table.tsx'
// export * from './Select.tsx'
const platform: { is_browser: Readonly<boolean> } = {
  get is_browser() {
    return typeof window == "object";
  },
};
export { platform };
