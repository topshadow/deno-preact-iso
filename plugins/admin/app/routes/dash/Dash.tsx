import { DashLayout } from "@24wings/shadcn/pro";
export const Component = (props) => {
  console.log("dash props", props);
  return (
    <DashLayout
      menus={[{
        title: "开发者",
        children: [
          { path: "/", title: "数据源" },
          { path: "/dash/plugin-manage", title: "插件管理" },
          { path: "/tenant", title: "租户管理" },
        ],
      }]}
    >
      内容
    </DashLayout>
  );
};
