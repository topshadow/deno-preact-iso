import { useSignal } from "@preact/signals";
import { type IFilter, ProTable } from "@24wings/shadcn/pro";
import { Button, useDialog } from "@24wings/shadcn";
import { orpc_client } from "../../orpc-client.ts";

export function PluginSelectionComponent() {
  const filter = useSignal<IFilter>({});
  const { alert, confirm } = useDialog();
  const plugins = useSignal<
    { data: { url: string; name: string }[]; total: number }
  >({
    data: [{ url: "jsr:@24wings/admin@0.2.1/plugin", name: "推荐管理后台" }],
    total: 2,
  });

  const handleInstallPlugin = async (url: string) => {
    const result = await confirm("安装插件", `确定要安装插件 ${url} 吗？`);
    if (result) {
      orpc_client.plugin.install_admin_module({ url })
        .then((r: any) => {
          if (r.ok) {
            alert("插件安装成功！页面将刷新。");
            location.reload();
          } else {
            alert(r.msg || "安装失败");
          }
        });
    }
  };

  return (
    <div className="p-6 sm:p-8">
      <div className="max-w-6xl mx-auto">
        {/* 成功标题和说明 */}
        <div className="mb-8 text-center">
          <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-green-100 dark:bg-green-900 mb-4">
            <i className="fa fa-check text-green-600 dark:text-green-300 text-2xl">
            </i>
          </div>
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
            安装成功！
          </h2>
          <p className="text-gray-600 dark:text-gray-300">
            数据库配置已完成，您可以选择安装推荐的管理后台插件
          </p>
        </div>

        {/* 插件列表 */}
        <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4 sm:p-6">
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            推荐插件
          </h3>

          <ProTable
            table={plugins}
            cols={[
              {
                label: "插件名称",
                field: "name",
                render: (r) => (
                  <div className="flex items-center gap-3">
                    <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center">
                      <i className="fa fa-plug text-primary"></i>
                    </div>
                    <div>
                      <div className="font-medium text-gray-900 dark:text-white">
                        {r.name}
                      </div>
                      <div className="text-xs text-gray-500 dark:text-gray-400">
                        {r.url}
                      </div>
                    </div>
                  </div>
                ),
              },
              {
                label: "操作",
                render: (r) => (
                  <Button
                    onClick={() => handleInstallPlugin(r.url)}
                    className="w-full sm:w-auto"
                  >
                    <i className="fa fa-download mr-2"></i>安装
                  </Button>
                ),
              },
            ]}
            filter={filter}
            onReload={(f) => {
              return Promise.resolve(plugins.value);
            }}
          >
          </ProTable>
        </div>

        {/* 后续步骤说明 */}
        <div className="mt-8 bg-blue-50 dark:bg-blue-900/30 rounded-lg p-4 sm:p-6 border border-blue-100 dark:border-blue-800">
          <div className="flex items-start gap-3">
            <div className="h-8 w-8 rounded-full bg-blue-100 dark:bg-blue-800 flex items-center justify-center flex-shrink-0 mt-0.5">
              <i className="fa fa-info text-blue-600 dark:text-blue-300"></i>
            </div>
            <div>
              <h4 className="font-medium text-blue-800 dark:text-blue-200 mb-1">
                后续步骤
              </h4>
              <ul className="text-sm text-blue-700 dark:text-blue-300 space-y-1">
                <li>
                  <i className="fa fa-arrow-right mr-2">
                  </i>安装管理后台插件后，页面将自动刷新
                </li>
                <li>
                  <i className="fa fa-arrow-right mr-2">
                  </i>使用默认账户登录管理后台
                </li>
                <li>
                  <i className="fa fa-arrow-right mr-2">
                  </i>开始配置和使用您的应用
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
