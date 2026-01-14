import { Dialect } from "../types/Dialect.ts";

export type IRes<T> = {
  ok: boolean;
  data: T;
  msg?: string;
};
function change_env(env: { DATABASE_URL: string; DIALECT: Dialect }) {
  return post<IRes<unknown>>("/api/change-env", { env });
}
function test_db(data: { url: string; dialect: Dialect }) {
  return post<IRes<unknown>>("/api/test-db", data);
}
function create_db(data: { url: string; dialect: Dialect }) {
  return post<IRes<unknown>>("/api/create-db", data);
}
function current_status() {
  return get<IRes<unknown>>("/api/current_status");
}
function post<TOutput>(url: string, data: any): Promise<TOutput> {
  return fetch(url, { method: "post", body: JSON.stringify(data) }).then((r) =>
    r.json()
  ).then((r) => r as TOutput);
}
function get<TOutput>(url: string) {
  return fetch(url).then((r) => r.json()).then((r) => r as TOutput);
}

function install_admin_module(data:{url:string}) {
  return post<IRes<unknown>>("/api/install_admin_module",data);
}

export const api = {
  change_env,
  test_db,
  create_db,
  current_status,
  install_admin_module,
};
