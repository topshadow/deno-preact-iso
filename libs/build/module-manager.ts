import type { Context, Hono } from "hono";
import type { BlankEnv, BlankSchema } from "hono/types";

const API_ENDPOINT = `https://api.jsr.io`;
export type Package = { scope: string; name: string };
export type Module = {
  name: string;
  description?: string;
  version?: string;
  // 模块的导入url 例如 jsr:@24wings/shadcn/plugin 或者 npm:shadcn/plugin 或者其他
  module_url: string;

  mod?: Hono<BlankEnv, BlankSchema>;
};
/**模块管理器 */
export class ModuleManager {
  packages: Package[] = [];
  default_module!: Module;
  module_list: Module[] = [];

  async install_module(mod: Module): Promise<{ ok: boolean; msg?: string }> {
    const result = { ok: true, msg: "" };
    let new_mod!: Hono<BlankEnv, BlankSchema>;
    try {
      const mod_exports = await import(mod.module_url);
      if (mod_exports && mod_exports.default) {
        new_mod = mod_exports.default;
      }
    } catch (e: Error) {
      result.ok = false;
      result.msg = e.message;
    }

    if (result.ok&&new_mod) {
      mod.mod = new_mod;
      this.module_list.push(mod);
    }

    return result;
  }
  // 将模块设置为默认模块 ,首页可以直接访问到该模块
  reset_default_module(mod_url: string) {
    const exsit_mod = this.module_list.find((m) => m.module_url = mod_url);
    if (exsit_mod) {
      this.default_module = exsit_mod;
      return { ok: true };
    } else {
      return { ok: false, msg: "找不到改模块" };
    }
  }

  async fetch_module_metada(
    mod_name: string,
  ): Promise<{ ok: boolean; data?: Record<string, any>; msg?: string }> {
    const res = await fetch(`https://jsr.io/${mod_name}/meta.json`);
    if (res.headers.get("content-type")?.includes("application/json")) {
      return { ok: true, data: await res.json() };
    }

    return { ok: false, msg: await res.text() };
  }
  async load_all_modules() {
    const res = await fetch(`${API_ENDPOINT}/scopes/24wings/packages`, {})
      .then((r) => r.json()).then((r) => r as { items: Package[] });
    this.packages = res.items.filter((n) => n.name.includes("plugin"));
  }
  async handle_request(c: Context<BlankEnv>) {
    const pathname = new URL(c.req.url).pathname;
    // 转发插件
    if (pathname.includes("plugins")) {
    } else {
      console.log(pathname);
      if (this.default_module && this.default_module.mod) {
        console.log("ok dispatch request", c.req.url);
        return await this.default_module.mod.request(c.req.url, c.req.raw);
      }
    }
  }
}

Deno.test("module fetch metadata", async () => {
  const manager = new ModuleManager();

  const meta = await manager.fetch_module_metada("@24wings/shadcn");
  console.log(meta);
});

Deno.test("fetch not content accept", async () => {
  const res = await fetch(`https://api.jsr.io/scopes/24wings/packages`, {})
    .then((
      r,
    ) => r.text());
  console.log(res);
});
