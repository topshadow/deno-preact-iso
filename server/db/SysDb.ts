import { Dialect, Generated, Kysely, Selectable } from "kysely";

export enum SysDbStatus {
  active = "active",
  disabled = "disabled",
}
export interface SysDbTable {
  id: Generated<number>;
  dialect: Dialect;
  create_at: string;
  status: SysDbStatus;
  domain?: string;
  url: string;
}

export type SysDb = Selectable<SysDbTable>;


