import { Table } from "@24wings/shadcn";
import { Button } from "@24wings/shadcn";
import type { SysTenant } from "@24wings/build/types";
import { SysTenantStatus, SysTenantStrategy } from "@24wings/build/types";

import type { ComponentChild } from "preact";

interface TableColumn {
  key: string;
  title: string;
  width?: number;
  render?: (value: any, record: SysTenant) => ComponentChild;
}

interface TenantTableProps {
  data: SysTenant[];
  loading: boolean;
  onEdit: (tenant: SysTenant) => void;
  onDelete: (id: number) => void;
}

export default function TenantTable({
  data,
  loading,
  onEdit,
  onDelete,
}: TenantTableProps) {
  const columns: TableColumn[] = [
    { key: "id", title: "ID", width: 80 },
    { key: "name", title: "租户名称" },
    { key: "url", title: "租户URL" },
    {
      key: "strategy",
      title: "策略",
      width: 120,
      render: (strategy: string) => {
        const strategyMap: Record<string, string> = {
          [SysTenantStrategy.Domain]: "域名",
          [SysTenantStrategy.SubDomain]: "子域名",
          [SysTenantStrategy.Default]: "默认",
        };
        return strategyMap[strategy] || strategy;
      },
    },
    {
      key: "status",
      title: "状态",
      width: 100,
      render: (status: string) => (
        <span
          className={`px-2 py-1 rounded-full text-xs font-medium ${
            status === SysTenantStatus.active
              ? "bg-green-100 text-green-800"
              : "bg-red-100 text-red-800"
          }`}
        >
          {status === SysTenantStatus.active ? "激活" : "禁用"}
        </span>
      ),
    },
    {
      key: "is_default",
      title: "默认",
      width: 80,
      render: (isDefault: boolean) => (
        <span
          className={`px-2 py-1 rounded-full text-xs font-medium ${
            isDefault
              ? "bg-blue-100 text-blue-800"
              : "bg-gray-100 text-gray-800"
          }`}
        >
          {isDefault ? "是" : "否"}
        </span>
      ),
    },
    {
      key: "create_at",
      title: "创建时间",
      width: 150,
      render: (time: number) => new Date(time).toLocaleString(),
    },
    {
      key: "actions",
      title: "操作",
      width: 150,
      render: (_: any, record: SysTenant) => (
        <div className="flex gap-2">
          <Button
            variant="secondary"
            size="sm"
            onClick={() => onEdit(record)}
          >
            编辑
          </Button>
          <Button
            variant="destructive"
            size="sm"
            onClick={() => onDelete(record.id!)}
          >
            删除
          </Button>
        </div>
      ),
    },
  ];

  return (
    <div className="overflow-hidden rounded-lg border border-border">
      <Table>
        <Table.Header>
          <Table.Row>
            {columns.map((column) => (
              <Table.Head
                key={column.key}
                className={column.width ? `w-${column.width}` : ""}
              >
                {column.title}
              </Table.Head>
            ))}
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {loading
            ? (
              <Table.Row>
                <Table.Cell
                  colSpan={columns.length}
                  className="text-center py-8"
                >
                  加载中...
                </Table.Cell>
              </Table.Row>
            )
            : data.length === 0
            ? (
              <Table.Row>
                <Table.Cell
                  colSpan={columns.length}
                  className="text-center py-8"
                >
                  暂无数据
                </Table.Cell>
              </Table.Row>
            )
            : (
              data.map((tenant) => (
                <Table.Row key={tenant.id}>
                  {columns.map((column) => (
                    <Table.Cell key={column.key}>
                      {column.render
                        ? column.render((tenant as any)[column.key], tenant)
                        : (tenant as any)[column.key]}
                    </Table.Cell>
                  ))}
                </Table.Row>
              ))
            )}
        </Table.Body>
      </Table>
    </div>
  );
}
