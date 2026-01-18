import { Button, Table } from "@24wings/shadcn";
import type { SysPlugin } from "@24wings/build/types";
import { SysPluginStatus } from "@24wings/build/types";

interface PluginTableProps {
  plugins: SysPlugin[];
  onEdit: (item: SysPlugin) => void;
  onDelete: (id: number) => void;
  loading?: boolean;
}

export function PluginTable({
  plugins,
  onEdit,
  onDelete,
  loading = false,
}: PluginTableProps) {
  return (
    <div className="overflow-hidden rounded-lg border border-border">
      <Table>
        <Table.Header>
          <Table.Row>
            <Table.Head className="w-80">ID</Table.Head>
            <Table.Head>插件名称</Table.Head>
            <Table.Head>插件URL</Table.Head>
            <Table.Head className="w-150">自定义路径</Table.Head>
            <Table.Head className="w-150">默认路径</Table.Head>
            <Table.Head className="w-100">状态</Table.Head>
            <Table.Head className="w-150">创建时间</Table.Head>
            <Table.Head className="w-150">操作</Table.Head>
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {loading
            ? (
              <Table.Row>
                <Table.Cell
                  colSpan={8}
                  className="text-center py-8"
                >
                  加载中...
                </Table.Cell>
              </Table.Row>
            )
            : plugins.length === 0
            ? (
              <Table.Row>
                <Table.Cell
                  colSpan={8}
                  className="text-center py-8"
                >
                  暂无数据
                </Table.Cell>
              </Table.Row>
            )
            : (
              plugins.map((plugin) => (
                <Table.Row key={plugin.id}>
                  <Table.Cell>{plugin.id}</Table.Cell>
                  <Table.Cell>{plugin.name}</Table.Cell>
                  <Table.Cell>{plugin.url}</Table.Cell>
                  <Table.Cell>{plugin.pathname || "-"}</Table.Cell>
                  <Table.Cell>{plugin.default_pathname || "-"}</Table.Cell>
                  <Table.Cell>
                    <span
                      className={`px-2 py-1 rounded-full text-xs font-medium ${plugin.status === SysPluginStatus.active
                        ? "bg-green-100 text-green-800"
                        : "bg-red-100 text-red-800"}`}
                    >
                      {plugin.status === SysPluginStatus.active ? "激活" : "禁用"}
                    </span>
                  </Table.Cell>
                  <Table.Cell>{new Date(plugin.create_at).toLocaleString()}</Table.Cell>
                  <Table.Cell>
                    <div className="flex gap-2">
                      <Button
                        variant="secondary"
                        size="sm"
                        onClick={() => onEdit(plugin)}
                      >
                        编辑
                      </Button>
                      <Button
                        variant="destructive"
                        size="sm"
                        onClick={() => onDelete(plugin.id!)}
                      >
                        删除
                      </Button>
                    </div>
                  </Table.Cell>
                </Table.Row>
              ))
            )}
        </Table.Body>
      </Table>
    </div>
  );
}
