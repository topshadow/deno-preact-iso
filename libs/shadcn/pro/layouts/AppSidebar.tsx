import { AppNavbar } from "./AppNavbar.tsx";
import { AppBreadmun } from "./AppBreadmun.tsx";
import { Icons, platform, Sidebar } from "@24wings/shadcn";
import type { MenuItem } from "./Menu.tsx";

import type { ComponentChildren, JSX } from "preact";

import { type Signal, useSignal } from "@preact/signals";
import { useEffect } from "preact/hooks";

export const default_menus: MenuItem[] = [{
  title: "供应商",
  children: [{
    title: "供应商货品导入",
    path: "/routes/home/index",
    icon: <Icons.Box className="mr-2" />,
  }],
}, {
  title: "示例",
  children: [
    {
      title: "accroding",
      path: "/demos/accroding",
    },
    {
      title: "sidebar",
      path: "/demos/sidebar",
    },
    {
      title: "tables",
      path: "/demos/table",
    },
    {
      title: "dropdown-menu",
      path: "/demos/dropdown-menu",
    },
    {
      title: "dialog",
      path: "/demos/dialog",
    },
    {
      title: "tabs",
      path: "/demos/tabs",
    },
    {
      title: "进度条",
      path: "/demos/process-bar",
    },
  ],
}];

export const default_config = {
  title: "智联数据管理",
};

export function AppSidebar(
  { menus, children, title, ...props }: {
    menus?: Signal<MenuItem[]>;
    title?: string;

    open?: boolean;
  } & JSX.IntrinsicElements["div"],
) {
  const path = useSignal("");
  const open = useSignal(!!props.open);

  if (platform.is_browser) {
    path.value = new URL(location.href).pathname;
  }
  // menus = menus || default_menus;
  const actvie_menu = menus?.value.find((m) =>
    m.children?.find((sub) => path.value.includes(sub.path as string))
  );
  const current_menu = actvie_menu?.children?.find((sub) =>
    path.value.includes(sub?.path as string)
  );

  return (
    <Sidebar open={open}>
      <Sidebar.Panel
        class={open.value
          ? "transition-all  duration-500 ease-in-out "
          : "w-0 invisible"}
        id="left-panel"
      >
        <LeftPanel menus={menus} title={title} />
      </Sidebar.Panel>

      <Sidebar.Content class="m-0 p-0">
        <AppNavbar navbar_open={open} />
        <AppBreadmun menus={[actvie_menu, current_menu]} />
        {children}
      </Sidebar.Content>
    </Sidebar>
  );
}

function LeftPanel(
  { menus, title }:
    & ComponentChildren
    & { menus?: Signal<MenuItem[]>; path: string; title?: string },
) {
  const path = useSignal("/");
  useEffect(() => {
    path.value = location.pathname;
  }, []);

  return (
    <div>
      <div class="flex items-center justify-center h-16 border-b border-border shadow-sm">
        <div class=" rounded-lg p-2 mr-3">
          {/* <i class="fas fa-cube text-primary-foreground text-lg"></i> */}
          <Icons.Boxes class="cursor-pointer"></Icons.Boxes>
        </div>
        <h1 class="text-xl font-bold text-foreground">
          {title || default_config.title}
        </h1>
      </div>

      <div class="p-4 flex items-center border-b border-border h-16">
        <div class="relative">
          <div class="w-10 h-10 rounded-full bg-muted flex items-center justify-center">
            <span class="text-primary font-semibold">JD</span>
          </div>
          <div class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 rounded-full border-2 border-card">
          </div>
        </div>
        <div class="ml-3">
          <h3 class="font-medium text-foreground">John Doe</h3>
          <p class="text-xs text-muted-foreground">管理员</p>
        </div>
      </div>

      <nav class="flex-1 overflow-y-auto py-4 px-2">
        {menus?.value.map((m) => (
          <>
            <div class="space-y-1">
              <h3 class="px-4 text-xs uppercase tracking-wider font-semibold text-muted-foreground">
                {m.title}
              </h3>
              {m.children?.map((sub) => (
                <a
                  href={sub.path}
                  class={"flex items-center px-4 py-2 text-foreground   rounded-md " +
                    (path.value == sub.path
                      ? "bg-primary text-primary-foreground"
                      : "text-foreground")}
                >
                  <i class="fas fa-home mr-3"></i>
                  {sub.icon}
                  <span>{sub.title}</span>
                </a>
              ))}

              <div class="mt-6 space-y-1">
                <h3 class="px-4 text-xs uppercase tracking-wider font-semibold text-muted-foreground">
                  设置
                </h3>
                <a
                  href="#"
                  class="flex items-center px-4 py-2 text-foreground hover:bg-accent hover:text-accent-foreground rounded-md"
                >
                  <i class="fas fa-cog mr-3"></i>
                  <span>系统设置</span>
                </a>
                <a
                  href="#"
                  class="flex items-center px-4 py-2 text-foreground hover:bg-accent hover:text-accent-foreground rounded-md"
                >
                  <i class="fas fa-user-cog mr-3"></i>
                  <span>用户管理</span>
                </a>
                <a
                  href="#"
                  class="flex items-center px-4 py-2 text-foreground hover:bg-accent hover:text-accent-foreground rounded-md"
                >
                  <i class="fas fa-shield-alt mr-3"></i>
                  <span>安全</span>
                </a>
              </div>

              <div class="mt-6 space-y-1">
                <h3 class="px-4 text-xs uppercase tracking-wider font-semibold text-muted-foreground">
                  支持
                </h3>
                <a
                  href="#"
                  class="flex items-center px-4 py-2 text-foreground hover:bg-accent hover:text-accent-foreground rounded-md"
                >
                  <i class="fas fa-question-circle mr-3"></i>
                  <span>帮助中心</span>
                </a>
                <a
                  href="#"
                  class="flex items-center px-4 py-2 text-foreground hover:bg-accent hover:text-accent-foreground rounded-md"
                >
                  <i class="fas fa-comments mr-3"></i>
                  <span>意见反馈</span>
                </a>
              </div>
            </div>
          </>
        ))}
      </nav>

      <div class="p-4 border-t border-border">
        <div class="bg-muted p-3 rounded-md">
          <h4 class="font-medium text-sm text-foreground">需要帮助？</h4>
          <p class="text-xs text-muted-foreground mt-1">
            联系我们的支持团队获取帮助
          </p>
          <button
            type="button"
            class="mt-2 w-full bg-primary text-primary-foreground text-sm font-medium py-2 px-4 rounded-md hover:bg-primary/90 transition-colors"
          >
            联系支持
          </button>
        </div>
      </div>
    </div>
  );
}
