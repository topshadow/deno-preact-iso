import { Dialect, Generated, Kysely, Selectable } from "kysely";

export enum SysPluginStatus {
  active = "active",
  disabled = "disabled",
}
export interface SysPluginTable {
  id: Generated<number>;

  create_at: string;
  status: SysPluginStatus;
  domain?: string;
  // 插件地址
  url: string;
  name?: string;
}

export type SysPlugin = Selectable<SysPluginTable>;
