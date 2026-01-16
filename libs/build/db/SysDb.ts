import { Dialect, Generated, Kysely, Selectable } from "kysely";

export enum SysDbStatus {
  active = "active",
  disabled = "disabled",
}
export interface SysDataSourceTable {
  id: Generated<number>;
  dialect: Dialect;
  create_at: number;
  status: SysDbStatus;
  domain?: string;
  url: string;
}

export type SysDatasource = Selectable<SysDataSourceTable>;
