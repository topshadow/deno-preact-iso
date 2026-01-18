import { useSignal } from "@preact/signals";
import { Button, Input, useDialog } from "@24wings/shadcn";
import { Dialect } from "../types/Dialect.ts";
import { orpc_client } from "@24wings/server/orpc-client";

interface DatabaseConfigComponentProps {
  onSuccess: () => void;
}

export function DatabaseConfigComponent(
  { onSuccess }: DatabaseConfigComponentProps,
) {
  const valid = useSignal(false);
  const dialect = useSignal(Dialect.Sqlite);
  const database_url = useSignal("");
  const is_create_new = useSignal(false);
  const { alert, confirm } = useDialog();

  const handleTestConnection = () => {
    orpc_client.env.test_db({
      url: database_url.value,
      dialect: dialect.value,
    })
      .then((r: any) => {
        if (r.ok) {
          valid.value = true;
          if (r.data) {
            if (!r.data.exsit) {
              is_create_new.value = true;
            }
          }
          alert("测试连接成功！");
        } else {
          alert(r.msg || "测试连接失败");
        }
      });
  };

  const handleCreateDatabase = async () => {
    const result = await confirm("创建数据库", "确定要创建新数据库吗？");
    if (result) {
      orpc_client.env.create_db({
        url: database_url.value,
        dialect: Dialect.Sqlite,
      }).then((r: any) => {
        alert(r.msg || "操作完成");
        if (r.ok) onSuccess();
      });
    }
  };

  const handleSaveConfig = async () => {
    const result = await confirm("保存配置", "确定要保存数据库配置吗？");
    if (result) {
      orpc_client.env.change_env({
        env: {
          DATABASE_URL: database_url.value,
          DIALECT: dialect.value,
        },
      }).then((r: any) => {
        if (r.ok) {
          alert("配置保存成功！");
          onSuccess();
        } else {
          alert(r.msg || "保存失败");
        }
      });
    }
  };

  return (
    <div className="p-6 sm:p-8">
      <div className="max-w-2xl mx-auto">
        {/* 标题和说明 */}
        <div className="mb-8 text-center">
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
            数据库配置
          </h2>
          <p className="text-gray-600 dark:text-gray-300">
            请配置数据库连接信息，以便继续使用应用
          </p>
        </div>

        {/* 配置表单 */}
        <form className="space-y-6">
          {/* 数据库类型 */}
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
              数据库类型
            </label>
            <select
              defaultValue={dialect.value}
              value={dialect.value}
              onChange={(e) => {
                const target = e.target as HTMLSelectElement;
                dialect.value = target.value as Dialect;
                valid.value = false;
              }}
              className="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent"
            >
              <option
                value={Dialect.Sqlite}
                selected={dialect.value == Dialect.Sqlite}
              >
                SQLite
              </option>
              <option
                value={Dialect.Mysql}
                selected={dialect.value == Dialect.Mysql}
              >
                MySQL
              </option>
            </select>
          </div>

          {/* 数据库URL */}
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
              数据库URL
            </label>
            <Input
              value={database_url}
              placeholder={dialect.value === Dialect.Sqlite
                ? "sqlite://db.sqlite"
                : "mysql://user:password@localhost:3306/dbname"}
              className="w-full"
            />
            <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
              当前数据库类型: {dialect.value}
            </p>
          </div>

          {/* 创建数据库按钮 */}
          {is_create_new.value && (
            <div className="text-center">
              <Button
                onClick={handleCreateDatabase}
                variant="outline"
                className="w-full sm:w-auto"
              >
                <i className="fa fa-database mr-2"></i>创建数据库
              </Button>
            </div>
          )}

          {/* 操作按钮 */}
          <div className="flex flex-col sm:flex-row gap-3">
            <Button
              onClick={handleTestConnection}
              disabled={!database_url.value}
              variant="outline"
              className="flex-1"
            >
              <i className="fa fa-plug mr-2"></i>测试连接
            </Button>
            <Button
              onClick={handleSaveConfig}
              disabled={!valid.value}
              className="flex-1"
            >
              <i className="fa fa-check mr-2"></i>保存配置
            </Button>
          </div>
        </form>
      </div>
    </div>
  );
}
