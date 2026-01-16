import { useEffect } from "preact/hooks";
import { useSignal } from "@preact/signals";
import { api } from "../api/mod.ts";
import { DashLayout } from "@24wings/shadcn/pro";
import { get_menus_with_module_path } from "../data/menus.tsx";
import { Button } from "@24wings/shadcn";
import { orpc_client } from "../../orpc-client.ts";

export const loader = (c) => {
  const module_path = c.env.module_path as string;

  return { count: 1, menus: get_menus_with_module_path(module_path) };
};
export const Head = async () => {
  return `<meta itemType={'keyword'} name="keywords" content="关键字">
  </meta>`;
};

// Component: ページコンポーネント
export const Component = ({ menus }: Awaited<ReturnType<typeof loader>>) => {
  const count = useSignal(0);
  useEffect(() => {
  }, []);
  return (
    <DashLayout menus={menus}>
      主页内容
      <Button onClick={()=>orpc_client.datasource.health().then(r=>alert(r.ok))}> 检查健康</Button>
      <button onClick={() => count.value--}>-</button>
      {count.value}
      <button onClick={() => count.value++}>+</button>
    </DashLayout>
  );
};
