import { useEffect } from "preact/hooks";
import { type IFilter, ProTable } from "@24wings/shadcn/pro";
import { Button, Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";
import { Dialect } from "../types/Dialect.ts";

import { orpc_client } from "@24wings/server/orpc-client";
//  import { orpc_client } from "@24wings/server/orpc-client";

// import { counter } from "../../db/schema";
// import type { CloudflareBindings } from "../../server";
// import type { ApiType } from "../../api";
// import Header from "../components/Header";

// loader: SSR時にデータ取得
export const loader = () => {
  return { count: 1 };
};
export const Head = () => {
  return `<meta itemType={'keyword'}><span>关键字</span>
  </meta>`;
};
export type LoaderData = Awaited<ReturnType<typeof loader>>;

// Component: ページコンポーネント
export const Component = ({}: LoaderData) => {
  const valid = useSignal(false);
  const dialect = useSignal(Dialect.Sqlite);
  const database_url = useSignal("");
  const is_success = useSignal(false);
  const is_create_new = useSignal(false);
  const selected_plugin = useSignal<{ url: string; name: string }>();
  const filter = useSignal<IFilter>({});
  const plugins = useSignal<
    { data: { url: string; name: string }[]; total: number }
  >({
    data: [{ url: "@24wings/admin/plugin", name: "推荐管理后台" }],
    total: 2,
  });
  const refresh_status = () =>
    orpc_client.env.current_status().then((r) => is_success.value = r.ok);

  useEffect(() => {
    console.log("is server running");

    // alert('1')
    refresh_status();
  }, []);

  return (
    <div className="">
      {/* <Header /> */}
      {/* 引导配置页面 */}
      {!is_success.value && (
        <main className="max-w-4xl mx-auto px-4 py-16">
          <div class="w-100 ">
            <div>
              <Input value={database_url} />
              {dialect.value}
            </div>
            <div>
              <select
                defaultValue={dialect.value}
                value={dialect.value}
                onChange={(e) => {
                  console.log(e);
                  dialect.value = e.target.value;
                  valid.value = false;
                }}
              >
                <option
                  onSelect={() => dialect.value = Dialect.Mysql}
                  value={Dialect.Mysql}
                  selected={dialect.value == Dialect.Mysql}
                >
                  Mysql
                </option>
                <option
                  onSelect={() => dialect.value = Dialect.Sqlite}
                  value={Dialect.Sqlite}
                  selected={dialect.value == Dialect.Sqlite}
                >
                  Sqlite
                </option>
              </select>
            </div>
          </div>
          <div class="mt-4">
            <div>
              <span>请配置数据库:</span>
            </div>
            {is_create_new.value && (
              <div>
                <Button
                  onClick={() =>
                    orpc_client.env.create_db({
                      url: database_url.value,
                      dialect: Dialect.Sqlite,
                    }).then((r) => {
                      alert(r.msg);
                    })}
                >
                  创建数据库
                </Button>
              </div>
            )}

            <div class="text-right">
              <Button
                onClick={() =>
                  orpc_client.env.test_db({
                    url: database_url.value,
                    dialect: dialect.value,
                  })
                    .then((r) => {
                      if (r.ok) {
                        valid.value = true;
                        if (r.data) {
                          if (!r.data.exsit) {
                            is_create_new.value = true;
                          }
                        }
                      } else {
                        alert(r.msg);
                      }
                    })}
                disabled={!database_url.value}
                size="sm"
                class="mr-2"
              >
                测试
              </Button>
              <Button
                onClick={() =>
                  orpc_client.env.change_env({
                    env: {
                      DATABASE_URL: database_url.value,
                      DIALECT: dialect.value,
                    },
                  }).then((r) => {
                    if (r.ok) {
                      refresh_status();
                    } else {
                      alert(r.msg);
                    }
                  })}
                disabled={!valid.value}
                size="sm"
              >
                确定
              </Button>
            </div>
          </div>
        </main>
      )}

      {is_success.value && (
        <main>
          <h1>安装成功 是否安装推荐的后台管理界面 选择模板 安装</h1>
          <div class="mt-10">
            <ProTable
              table={plugins}
              cols={[{ label: "地址", render: (r) => r.url }, {
                label: "名称",
                field: "name",
                render: (r) => r.name,
              }, {
                label: "操作",
                render: (r) => (
                  <Button
                    size="sm"
                    onClick={() =>
                      orpc_client.plugin.install_admin_module({ url: r.url })
                        .then((r) => {
                          if (r.ok) location.reload();
                        })}
                  >
                    安装
                  </Button>
                ),
              }]}
              filter={filter}
              onReload={(f) => {
                return Promise.resolve(plugins.value);
              }}
            >
            </ProTable>
          </div>
        </main>
      )}
    </div>
  );
};
