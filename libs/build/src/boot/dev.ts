import type { Hono } from "hono";
import { getLogger } from "@logtape/logtape";
import { ModuleManager } from "../module-manager/ModuleManager.ts";
import { DbManager } from "../db/db-manager.ts";
import { SysPluginStatus, type SysPluginWithModule } from "../../types/SysPlugin.ts";
import { load_env } from "../../config.ts"; 
const logger = getLogger(["@24wings/build", "boot"]);
export const modManager = new ModuleManager();
/**
 * 服务器开发启动函数
 * 用于封装服务器启动逻辑，便于子项目独立启动
 *
 * @param app Hono 对象实例
 * @param options 启动配置选项
 * @param options.defaultModulePath 默认模块路径
 * @param options.disableOtherModules 是否禁用其他模块
 * @param options.customDefaultModule 自定义默认模块
 * @param options.envPath 环境变量文件路径
 */
export async function dev(
  app: Hono<
    {
      Bindings: { db_manager: DbManager };
      Variables: { db_manager: DbManager };
    }
  >,
  options?: {
    defaultModulePath?: string;
    disableOtherModules?: boolean;
    customDefaultModule?: any;
    envPath?: string;
  },
): Promise<void> {
  // 处理选项，设置默认值
  const defaultModulePath = options?.defaultModulePath || "./plugin.ts";
  const disableOtherModules = options?.disableOtherModules || false;
  const customDefaultModule = options?.customDefaultModule;
  const db_manager = new DbManager();

  // 动态导入默认模块
  let default_module;
  if (customDefaultModule) {
    default_module = customDefaultModule;
  } else {
    const defaultModuleExports = await import(defaultModulePath);
    default_module = defaultModuleExports.default;
  }

  // 中间件：设置数据库管理器
  app.use(async (c, next) => {
    c.set("db_manager", db_manager);
    await next();
  });

  // 构建内置模块配置
  const builtin_module = {
    name: "默认模块",
    url: defaultModulePath,
    mod: default_module,
    pathname: "/",
  };
  // 设置内置默认模块
  async function set_buildin_default_module() {
    modManager.default_module = {
      id: 0,
      ...builtin_module,
      default_pathname: "/plugins/base",
    };
    // await modManager.install_module(builtin_module);
    await modManager.module_list.push(builtin_module);
    console.log("设置内置模块 成功 /plugins/base 或者 / 访问");
  }

  // 执行内置模块设置
  await set_buildin_default_module();

  // 加载环境变量
  const load_env_result = await load_env();

  // 有配置，连接数据库，并且加载对应数据库中的模块
  if (load_env_result.ok && !disableOtherModules) {
    const env = load_env_result.data;
    await db_manager.connectDbFromEnv(env);
    const active_plugins: SysPluginWithModule[] = await db_manager.default_db.db
      .selectFrom("sys-plugin")
      .selectAll().where("status", "=", SysPluginStatus.active).execute();

    // 当已经有安装插件时 使用安装的插件,没有时启用内置插件
    console.table(active_plugins);
    if (active_plugins.length > 0) {
      for (const p of active_plugins) {
        logger.info(
          `starting install plugin, url:${p.url}status:${p.status}`,
        );
        if (p.url.startsWith("./")) {
          p.mod = await import(p.url);
        }
        const result = await modManager.install_module(p);
        if (!result.ok) console.error("loading error:", result.msg);
      }
    }
  }

  // 设置所有请求由模块管理器处理
  app.all("*", (r) => modManager.handle_request(r));
}
