import type { Generated, Selectable } from "kysely";

export enum SysPluginStatus {
  active = "active",
  disabled = "disabled",
}
export interface SysPluginTable {
  id: Generated<number>;

  create_at: number;
  status: SysPluginStatus;
  // 插件地址
  url: string;
  name: string|undefined;
  // 插件自定义的处理地址
  pathname: string|undefined;
  // 插件默认处理地址
  default_pathname: string;
  tenant_id?: number;
}

export type SysPlugin = Selectable<SysPluginTable>;
export type SysPluginWithModule = SysPlugin & { mod?: any };
