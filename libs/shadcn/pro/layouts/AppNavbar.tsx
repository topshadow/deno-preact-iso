import { ThemeButton } from "./ThemeButton.tsx";

import type { JSX } from "preact/jsx-runtime";
import { useContext } from "preact/hooks";
import type { Signal } from "@preact/signals";
import {
  Button,
  cn,
  Divider,
  DropdownMenu,
  Icons,
  ThemeContext,
  ThemeEnum,
} from "@24wings/shadcn";
import { useLocation, useRoute } from "preact-iso/router";

function Circle({ class: className, ...props }: JSX.IntrinsicElements["div"]) {
  return (
    <div {...props} class={cn("w-4 h-4 rounded-full mr-2", className)}></div>
  );
}

export function ThemeItem(
  { color, theme_name }: { color: ThemeEnum; theme_name: string },
) {
  const color_class = color == "default" ? "bg-white" : `bg-${color}-700`;
  const { color: theme_color } = useContext(ThemeContext);
  return (
    <DropdownMenu.Item class={theme_color.value == color ? "bg-muted" : ""}>
      <div
        class={cn("flex text-left items-center w-full px-1")}
        onClick={() =>
          theme_color.value = color}
      >
        <Circle class={color_class} /> {theme_name}
      </div>
    </DropdownMenu.Item>
  );
}
export function AppNavbar({ navbar_open }: { navbar_open: Signal<boolean> }) {
  const { is_dark } = useContext(ThemeContext);

  return (
    <header class="h-16 border-b border-border flex items-center sticky  top-0 z-40 w-full">
      <div class="w-full px-4 flex items-center justify-between">
        {/* <!-- 左侧部分 --> */}
        <div class="flex items-center gap-4">
          {/* <!-- 菜单切换按钮 --> */}
          <Button
            type="button"
            variant="link"
            class="p-2"
            onClick={() => navbar_open.value = !navbar_open.value}
          >
            <Icons.SquareSquare />
          </Button>

          <div class="flex items-center gap-2">
            <div class="bg-primary p-1 rounded text-primary-foreground">
              <i class="fas fa-cube"></i>
            </div>
            <h1 class="text-lg font-semibold">
              管理控制台
            </h1>
          </div>
        </div>

        {/* <!-- 右侧部分 --> */}
        <div class="flex items-center gap-2">
          {/* <!-- 搜索框 --> */}
          <div class="relative">
            <input
              type="text"
              placeholder="搜索..."
              class="flex h-9  rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 w-56 lg:w-72"
            />
            <i class="fas fa-search absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground">
            </i>
          </div>

          {/* <!-- 通知按钮 --> */}
          <Button
            type="button"
            variant="ghost"
            class="relative"
          >
            <Icons.Bell />
            <span class="absolute -top-1 -right-1 flex h-4 w-4 items-center justify-center rounded-full bg-destructive text-destructive-foreground text-[0.65rem]">
              3
            </span>
          </Button>

          {/* <!-- 设置按钮 --> */}
          <DropdownMenu id="theme-menu">
            <DropdownMenu.Trigger>
              <Icons.Settings />
            </DropdownMenu.Trigger>
            <DropdownMenu.Content>
              <DropdownMenu.Item>
                <Icons.Palette className="w-4 h-4 mr-2"></Icons.Palette> 主题
              </DropdownMenu.Item>
              <Divider></Divider>
              <ThemeItem color={ThemeEnum.default} theme_name="默认">
              </ThemeItem>
              <ThemeItem color={ThemeEnum.blue} theme_name="蓝色"></ThemeItem>
              <ThemeItem color={ThemeEnum.green} theme_name="绿色">
              </ThemeItem>
              <ThemeItem color={ThemeEnum.orange} theme_name="橙色">
              </ThemeItem>
              <ThemeItem color={ThemeEnum.red} theme_name="红色"></ThemeItem>
              <ThemeItem color={ThemeEnum.rose} theme_name="玫瑰"></ThemeItem>
              <ThemeItem color={ThemeEnum.violet} theme_name="紫色">
              </ThemeItem>
              <ThemeItem color={ThemeEnum.yellow} theme_name="黄色">
              </ThemeItem>

              <Divider></Divider>
            </DropdownMenu.Content>
          </DropdownMenu>
          <div>
            <ThemeButton></ThemeButton>
          </div>

          {/* <!-- 用户信息 --> */}
          <DropdownMenu id="user-menu">
            <DropdownMenu.Trigger>
              <div class="relative flex h-9 w-9 shrink-0 overflow-hidden rounded-full">
                <img
                  src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&h=100&q=80"
                  alt="用户头像"
                  class="w-full h-full object-cover"
                />
              </div>
            </DropdownMenu.Trigger>
            <DropdownMenu.Content class=" w-0">
              <div class="relative  right-32 top-0">
                {/* <!-- 下拉菜单 --> */}
                <div
                  id="user-dropdown"
                  class=" w-48 rounded-md border border-border bg-popover text-popover-foreground shadow-md z-50 "
                  data-class:hidden="!$_show_menu"
                >
                  <div class="px-4 py-3">
                    <p class="text-sm font-medium">张经理</p>
                    <p class="text-xs text-muted-foreground">
                      admin@company.com
                    </p>
                  </div>
                  <div class="h-[1px] bg-muted my-1"></div>
                  <div class="py-1">
                    <a
                      href="#"
                      class="block px-4 py-2 text-sm hover:bg-accent"
                    >
                      个人资料
                    </a>
                    <a
                      href="#"
                      class="block px-4 py-2 text-sm hover:bg-accent"
                    >
                      账户设置
                    </a>
                    <a
                      href="#"
                      class="block px-4 py-2 text-sm hover:bg-accent"
                    >
                      系统设置
                    </a>
                  </div>
                  <div class="h-[1px] bg-muted my-1"></div>
                  {/* onclick="setCookie('token','');location.href='/'"  */}
                  <a
                    class="block px-4 py-2 text-sm hover:bg-accent"
                    onClick={() => {
                      // Cookies.set("token", "");
                      // localStorage.setItem('')
                      // location.pathname = "/";
                    }}
                  >
                    退出登录
                  </a>
                </div>
              </div>
            </DropdownMenu.Content>
          </DropdownMenu>
        </div>
      </div>
    </header>
  );
}
