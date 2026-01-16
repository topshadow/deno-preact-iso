import { Dialect, Generated, Kysely, Selectable } from "kysely";

export enum SysPluginStatus {
  active = "active",
  disabled = "disabled",
}
export interface SysPluginTable {
  id: Generated<number>;

  create_at: number;
  status: SysPluginStatus;
  domain?: string;
  // 插件地址
  url: string;
  name?: string;
  // 插件自定义的处理地址
  pathname?: string;
  // 插件默认处理地址
  default_pathname: string;
  tenant_id?:number;
}

export type SysPlugin = Selectable<SysPluginTable>
export type SysPluginWithModule=SysPlugin&{mod?:any};
