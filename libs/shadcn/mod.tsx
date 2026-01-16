export * from "./components/Accordion.tsx";
export * from "./components/Button.tsx";
export * from "./utils/cn.tsx";
export * from "./components/Icons.tsx";
export * from "./components/Theme.tsx";
export * from "./components/Sidebar.tsx";
export * from "./components/DropdownMenu.tsx";
export * from "./components/Input.tsx";
export * from "./components/Divider.tsx";
export * from "./components/Table.tsx";
// export * from './Select.tsx'
const platform: { is_browser: Readonly<boolean> } = {
  get is_browser() {
    return typeof window == "object";
  },
};
export { platform };
