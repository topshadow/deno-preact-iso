import { Button, Table } from "@24wings/shadcn";
import type { SysDatasource } from "@24wings/build/types";

interface DataSourceTableProps {
  datasources: SysDatasource[];
  onEdit: (item: SysDatasource) => void;
  onDelete: (id: number) => void;
  loading?: boolean;
}

export function DataSourceTable({
  datasources,
  onEdit,
  onDelete,
  loading = false,
}: DataSourceTableProps) {
  return (
    <div class="rounded-lg overflow-hidden">
      <Table>
        <Table.Header class="bg-muted">
          <Table.Row>
            <Table.Head>ID</Table.Head>
            <Table.Head>URL</Table.Head>
            <Table.Head>数据库类型</Table.Head>
            <Table.Head>域名</Table.Head>
            <Table.Head>状态</Table.Head>
            <Table.Head>创建时间</Table.Head>
            <Table.Head>操作</Table.Head>
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {datasources.length === 0
            ? (
              <Table.Row>
                <Table.Cell
                  colSpan={7}
                  class="text-center text-muted-foreground py-8"
                >
                  {loading ? "加载中..." : "暂无数据源"}
                </Table.Cell>
              </Table.Row>
            )
            : (
              datasources.map((ds) => (
                <Table.Row key={ds.id}>
                  <Table.Cell>{ds.id}</Table.Cell>
                  <Table.Cell class="max-w-xs truncate" title={ds.url}>
                    {ds.url}
                  </Table.Cell>
                  <Table.Cell>{ds.dialect}</Table.Cell>
                  <Table.Cell>{ds.domain || "-"}</Table.Cell>
                  <Table.Cell>
                    <span
                      class={`px-2 py-1 rounded-full text-xs ${ds.status === "active" ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"}`}
                    >
                      {ds.status === "active" ? "活跃" : "禁用"}
                    </span>
                  </Table.Cell>
                  <Table.Cell>
                    {new Date(ds.create_at).toLocaleString()}
                  </Table.Cell>
                  <Table.Cell>
                    <div class="flex gap-2">
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => onEdit(ds)}
                      >
                        编辑
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => onDelete(ds.id)}
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
