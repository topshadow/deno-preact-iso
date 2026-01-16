import { useEffect } from "preact/hooks";

import { DashLayout } from "@24wings/shadcn/pro";
import { get_menus_with_module_path } from "../data/menus.tsx";
import { Button, Table } from "@24wings/shadcn";
import { orpc_client } from "../../orpc-client.ts";
import type { SysDatasource } from "@24wings/build/types";
import { useSignal } from "@preact/signals";
import type { Context } from "hono";

export const loader = (c: Context) => {
  const module_path = c.env.module_path as string;

  return { count: 1, menus: get_menus_with_module_path(module_path) };
};
export const Head = () => {
  return `<meta itemType={'keyword'} name="keywords" content="关键字">
  </meta>`;
};

export const Component = ({ menus }: Awaited<ReturnType<typeof loader>>) => {
  const datasource = useSignal<SysDatasource[]>([]);
  useEffect(() => {
  }, []);
  return (
    <DashLayout menus={menus}>
      主页内容
      <Button
        onClick={() =>
          orpc_client.datasource.list_datasource().then((r) =>
            datasource.value = r.data
          )}
      >
        检查健康
      </Button>

      <Table>
        <Table.Header class="bg-muted">
          <Table.Head>id</Table.Head>
          <Table.Head>数据类型</Table.Head>
        </Table.Header>
        <Table.Body>
          <Table.Row>
            <Table.Cell>d</Table.Cell>
          </Table.Row>
        </Table.Body>
      </Table>
    </DashLayout>
  );
};
