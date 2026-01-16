export type MenuItem = {
  title: string;
  // deno-lint-ignore no-explicit-any
  icon?: any;
  path?: string;
  children?: MenuItem[];
};
