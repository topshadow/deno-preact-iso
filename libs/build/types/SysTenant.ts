import { Dialect, Generated, Kysely, Selectable } from "kysely";

export enum SysTenantStatus {
  active = "active",
  disabled = "disabled",
}
export enum SysTenantStrategy{
    Domain='Domain',
    SubDomain='SubDomain',
    Default='Default'
}
export interface SysTenantTable {
  id: Generated<number>;

  create_at: number;
  status: SysTenantStatus;
  strategy?: SysTenantStrategy
  // 插件地址
  url: string;
  name?: string;
  is_default:boolean
}

export type SysTenant = Selectable<SysTenantTable>;
