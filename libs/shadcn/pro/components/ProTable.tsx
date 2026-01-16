import { Icons } from "../../components/Icons.tsx";

import { Button } from "../../components/Button.tsx";
import type { ComponentChildren } from "preact";
import { type Signal, useSignalEffect } from "@preact/signals";

export type ICol<T> = {
  label: string;
  field?: keyof T;
  render: (t: T) => ComponentChildren;
};
export type IFilter = {
  page_index?: number;
  page_size?: number;
  order_by?: string;
  order_type?: "asc" | "desc";
  show_page_num?: number;
  total?: number;
};
export const default_filter = {
  page_index: 0,
  page_size: 10,
  order_by: undefined,
  order_type: undefined,
  show_page_num: 5,
  total: 0,
} satisfies IFilter;
export type TableProps<T> = { filter: Signal<IFilter> };
export function ProTable<T>({
  cols,
  onReload,
  ...props
}:
  & {
    cols: ICol<T>[];
    table: Signal<{ data: T[]; total: number }>;
  }
  & TableProps<T>
  & { onReload: (filter: IFilter) => Promise<{ total: number; data: T[] }> }) {
  let { order_by, order_type, page_index, page_size, show_page_num } =
    props.filter.value;
  let total = props.table.value.total;
  order_by = order_by ?? default_filter.order_by;
  order_type = order_type ?? default_filter.order_type;
  page_index = page_index ?? default_filter.page_index;
  page_size = page_size ?? default_filter.page_size;
  show_page_num = show_page_num ?? default_filter.show_page_num;
  total = total ?? 0;

  useSignalEffect(() => {
    if (typeof document == "object" && onReload) {
      onReload(props.filter.value);
    }
  });

  const page_array_num = Math.ceil(total / page_size);

  const page_start = page_index - show_page_num >= 0
    ? page_index - show_page_num
    : 0;
  const page_end = page_index + show_page_num >= page_array_num
    ? page_array_num
    : page_index + show_page_num;
  console.log(page_start, page_end, page_array_num);

  const page_ranges = new Array(page_array_num).fill("").keys().toArray().slice(
    page_start,
    page_end,
  );
  const page_size_options = [10, 20, 50];

  return (
    <div
      class="bg-background rounded-lg shadow-md overflow-hidden"
      {...props}
    >
      {
        /* <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between p-4 border-b border-border">
        <div class="flex items-center mb-3 sm:mb-0">
          <div class="relative w-64">
            <Icons.Search class="w-4 h-4 absolute left-2 top-2 z-50 text-primary" />
            <input
              type="text"
              placeholder="搜索员工..."
              class="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500"
            />
          </div>
        </div>

        <div class="flex items-center">
          <Button variant="link">
            <Icons.RefreshCcw className="cursor-pointer"></Icons.RefreshCcw>
          </Button>
          <Button variant="link">
            <Icons.Settings />
          </Button>
        </div>
      </div> */
      }

      <div class="overflow-x-auto">
        <table class="w-full">
          <thead>
            <tr class="border-b border-border text-left">
              {cols.map((col) => (
                <th class="py-2 px-6 font-medium  hover:bg-muted">
                  <div class="flex">
                    <span class="mr-2">{col.label}</span>
                    {col.field && order_by != col.field && (
                      <Icons.ArrowUpDown
                        class="cursor-pointer w-4 h-4"
                        onClick={() =>
                          props.filter.value = {
                            ...props.filter.value,
                            order_by: col.field,
                            order_type: "asc",
                          }}
                      >
                      </Icons.ArrowUpDown>
                    )}
                    {order_by && order_by == col.field &&
                      order_type == "desc" && (
                      <Icons.MoveDown
                        class="cursor-pointer w-4 h-4"
                        onClick={() =>
                          props.filter.value = {
                            ...props.filter.value,
                            order_by: undefined,
                            order_type: undefined,
                          }}
                      >
                      </Icons.MoveDown>
                    )}

                    {order_by && order_by == col.field && order_type == "asc" &&
                      (
                        <Icons.MoveUp
                          class="cursor-pointer w-4 h-4"
                          onClick={() =>
                            props.filter.value = {
                              ...props.filter.value,
                              order_by: col.field,
                              order_type: "desc",
                            }}
                        >
                        </Icons.MoveUp>
                      )}
                  </div>
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {props.table.value.data.map((item) => (
              <tr class="border-b border-border hover:bg-muted transition-colors">
                {cols.map((c) => (
                  <td class="py-2 px-6">
                    {c.render(item)}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div class="flex flex-col sm:flex-row items-center justify-between p-4 border-t border-border">
        <div class="mb-4 sm:mb-0 text-sm text-gray-600">
          显示第 <span class="font-medium">{page_index * page_size}</span> 至

          <span class="font-medium">{page_index * page_size + page_size}</span>

          项结果，共 <span class="font-medium">{total}</span> 项
        </div>

        <div class="flex items-center space-x-4">
          <div class="flex items-center text-sm">
            <span class="mr-2 text-gray-600">每页显示</span>
            <div class="relative">
              {page_size}
              {
                /* <mdui-select
                data-bind="$page_size"
                variant="outlined"
                data-attr-value="$page_size"
              >
                {page_size_options.map((o) => (
                  <mdui-menu-item
                    // data-on-click={`$page_size=${o};@post('${endpoint}')`}
                    value={o}
                  >
                    {o}
                  </mdui-menu-item>
                ))}
              </mdui-select> */
              }
              <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-muted-foreground">
                {/* <Icons.ChevronDown></Icons.ChevronDown> */}
              </div>
            </div>
          </div>

          <div class="flex space-x-1">
            {page_start > 0 && (
              <Button
                size="sm"
                variant="ghost"
                onClick={() =>
                  props.filter.value = {
                    ...props.filter.value,
                    page_index: page_start - 1,
                  }}
              >
                <Icons.ChevronLeft className="cursor-pointer w-3 h-3" />
              </Button>
            )}
            {page_ranges.map((r) => (
              <Button
                size="sm"
                variant={r == page_index ? "default" : "ghost"}
                onClick={() =>
                  props.filter.value = { ...props.filter.value, page_index: r }}
                // data-on-click={`$page_index=${r};@post('${endpoint}')`}
              >
                {r + 1}
              </Button>
            ))}

            {page_end < page_array_num && (
              <Button
                size="sm"
                variant="ghost"
                onClick={() =>
                  props.filter.value = {
                    ...props.filter.value,
                    page_index: page_end + 1,
                  }}
              >
                <Icons.ChevronRight className="cursor-pointer w-3 h-3" />
              </Button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export function TableRow<T>({ cols }: { cols: ICol<T>[] }) {
  return (
    <div style="display:grid;grid-template-columns:1fr 1.5fr 1fr 1fr 1fr 80px;padding:0 24px;">
      <div style="padding:12px 16px;display:flex;align-items:center;color:#333;">
        #005
      </div>
      <div style="padding:12px 16px;display:flex;align-items:center;">
        <div style="width:36px;height:36px;border-radius:50%;background-color:#f06292;margin-right:12px;display:flex;align-items:center;justify-content:center;color:white;font-weight:bold;">
          Q
        </div>
        <div>
          <div style="font-weight:500;color:#333;">钱七</div>
          <div style="font-size:13px;color:#666;">qianqi@company.com</div>
        </div>
      </div>
      <div style="padding:12px 16px;display:flex;align-items:center;color:#333;">
        测试工程师
      </div>
      <div style="padding:12px 16px;display:flex;align-items:center;color:#333;">
        质量保障部
      </div>
      <div style="padding:12px 16px;display:flex;align-items:center;color:#333;">
        2022-01-18
      </div>
      <div style="padding:12px 16px;display:flex;align-items:center;justify-content:center;">
        <div style="background-color:#c8e6c9;color:#388e3c;padding:4px 8px;border-radius:12px;font-size:12px;font-weight:500;">
          在职
        </div>
      </div>
    </div>
  );
}
