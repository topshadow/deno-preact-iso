import type { Context, Hono } from "hono";
import type { BlankEnv, BlankSchema } from "hono/types";
import { relative, resolve } from "@std/path";
const API_ENDPOINT = `https://api.jsr.io`;
export type Package = { scope: string; name: string };

export interface SysPlugin {
  id: number;

  create_at: number;
  status: "active" | "disabled";
  domain?: string;
  // 插件地址
  url: string;
  name?: string;
  // 插件自定义的处理地址
  pathname?: string;
  // 插件默认处理地址
  default_pathname: string;
  tenant_id?: number;
}
export type Module = {
  mod?: Hono<BlankEnv, BlankSchema>;
} & SysPlugin;
/**模块管理器 */
export class ModuleManager {
  packages: Package[] = [];
  default_module!: Module;
  module_list: Module[] = [];

  async install_module(mod: Module): Promise<{ ok: boolean; msg?: string }> {
    const result = { ok: true, msg: "" };
    let new_mod!: Hono<BlankEnv, BlankSchema>;
    if (!mod.mod) {
      try {
        const mod_exports = await import(mod.url);
        if (mod_exports && mod_exports.default) {
          new_mod = mod_exports.default;
        }
      } catch (e: Error) {
        result.ok = false;
        result.msg = e.message;
      }
    }
    if (result.ok && new_mod) {
      mod.mod = new_mod;
      this.module_list.push(mod);
    }

    return result;
  }
  // 将模块设置为默认模块 ,首页可以直接访问到该模块
  reset_default_module(mod_url: string) {
    const exsit_mod = this.module_list.find((m) => m.url = mod_url);
    if (exsit_mod) {
      this.default_module = exsit_mod;
      return { ok: true };
    } else {
      return { ok: false, msg: "找不到改模块" };
    }
  }
  // 刷新所有插件
  // async refresh_all_plugin(plugins: Module[]) {
  //   for (let p of plugins) {
  //     if (!p.mod) {
  //       p.mod = await import(p.url);
  //     }
  //     if (p.mod) {
  //       if (p.mod.default) {
  //         await this.install_module({ mod: m.default, ...p });
  //       }
  //     } else {
  //       console.error(" install module error, url is:", p.url);
  //     }
  //   }
  // }

  /**通过jsr 获取安装包的元数据 */
  async fetch_module_metada(
    mod_name: string,
  ): Promise<{ ok: boolean; data?: Record<string, any>; msg?: string }> {
    const res = await fetch(`https://jsr.io/${mod_name}/meta.json`);
    if (res.headers.get("content-type")?.includes("application/json")) {
      return { ok: true, data: await res.json() };
    }

    return { ok: false, msg: await res.text() };
  }
  /**列举所有可用包 */
  async load_all_variable_modules() {
    const res = await fetch(`${API_ENDPOINT}/scopes/24wings/packages`, {})
      .then((r) => r.json()).then((r) => r as { items: Package[] });
    this.packages = res.items.filter((n) => n.name.includes("plugin"));
  }
  async handle_request(c: Context<BlankEnv>) {
    const pathname = new URL(c.req.url).pathname;
    // 转发插件
    let handle_mod = this.module_list.find((m) => {
      let r;
      // 有限匹配 模块路径
      if (m.pathname) {
        r = pathname.includes(m.pathname);
      }
      if (!r) {
        r = pathname.includes(m.default_pathname);
      }
      return r;
    });
    handle_mod = handle_mod || this.default_module;

    // console.log(pathname, handle_mod, this.module_list);
    if (handle_mod) {
      if (handle_mod.mod) {
        console.log("ok dispatch request", c.req.url);
        return await handle_mod.mod.request(
          c.req.url.replace(
            handle_mod.pathname || handle_mod.default_pathname,
            "",
          ),
          c.req.raw,
          {
            "module_path": "/admin",
            Bindings: {
              module_path: "/admin",
              default_db: c.get("default_db"),
            },
          },
        );
      }
    }
    return c.notFound();
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
