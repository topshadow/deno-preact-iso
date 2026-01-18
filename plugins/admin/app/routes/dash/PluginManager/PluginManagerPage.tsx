import { Button, Input, useDialog } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";
import { useEffect } from "preact/hooks";
import { orpc_client } from "../../../../orpc-client.ts";
import type { SysPlugin } from "@24wings/build/types";
import { SysPluginStatus } from "@24wings/build/types";
import { PluginForm } from "./PluginForm.tsx";
import { PluginTable } from "./PluginTable.tsx";

export default function PluginManagerPage() {
  const { alert, confirm } = useDialog();
  const plugins = useSignal<SysPlugin[]>([]);
  const loading = useSignal(false);
  const searchKeyword = useSignal("");
  const isDialogOpen = useSignal(false);
  const editingItem = useSignal<Partial<SysPlugin> | undefined>(undefined);

  // 加载插件列表
  const fetchPlugins = async () => {
    loading.value = true;
    try {
      const result = await orpc_client.plugin.list_plugin({
        keyword: searchKeyword.value,
      });
      if (result.ok) {
        plugins.value = result.data;
      } else {
        alert(result.msg || "获取插件列表失败");
      }
    } catch (error) {
      alert("获取插件列表失败");
      console.error("Failed to fetch plugins:", error);
    } finally {
      loading.value = false;
    }
  };

  // 初始加载
  useEffect(() => {
    fetchPlugins();
  }, [searchKeyword.value]);

  // 打开编辑对话框
  const handleEdit = (item: SysPlugin) => {
    editingItem.value = item;
    isDialogOpen.value = true;
  };

  // 打开新增对话框
  const handleCreate = () => {
    editingItem.value = undefined;
    isDialogOpen.value = true;
  };

  // 关闭对话框
  const handleCloseDialog = () => {
    isDialogOpen.value = false;
    editingItem.value = undefined;
  };

  // 删除插件
  const handleDelete = async (id: number) => {
    const result = await confirm("删除确认", "确定要删除这个插件吗？");
    if (result) {
      try {
        const deleteResult = await orpc_client.plugin.delete_plugin({ id });
        if (deleteResult.ok) {
          alert("插件删除成功");
          fetchPlugins();
        } else {
          alert(deleteResult.msg || "删除插件失败");
        }
      } catch (error) {
        alert("删除插件失败");
        console.error("Failed to delete plugin:", error);
      }
    }
  };

  // 保存插件
  const handleSave = async (data: Partial<SysPlugin>) => {
    try {
      let result;
      if (data.id) {
        // 更新插件
        result = await orpc_client.plugin.update_plugin(data as any);
      } else {
        // 创建插件
        result = await orpc_client.plugin.create_plugin(data as any);
      }

      if (result.ok) {
        alert(data.id ? "插件更新成功" : "插件创建成功");
        isDialogOpen.value = false;
        fetchPlugins();
      } else {
        alert(result.msg || (data.id ? "更新插件失败" : "创建插件失败"));
      }
    } catch (error) {
      alert(data.id ? "更新插件失败" : "创建插件失败");
      console.error("Failed to submit plugin:", error);
    }
  };

  return (
    <>
      {/* 页面标题和操作按钮 */}
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-2xl font-bold">插件管理</h1>
        <div className="flex gap-2">
          {/* 搜索框 */}
          <Input
            placeholder="搜索插件..."
            value={searchKeyword}
            className="w-64"
          />
          {/* 新增按钮 */}
          <Button onClick={handleCreate}>
            新建插件
          </Button>
        </div>
      </div>

      {/* 插件表格 */}
      <PluginTable
        plugins={plugins.value}
        onEdit={handleEdit}
        onDelete={handleDelete}
        loading={loading.value}
      />

      {/* 新增/编辑对话框 */}
      <PluginForm
        isOpen={isDialogOpen.value}
        onClose={handleCloseDialog}
        onSave={handleSave}
        initialData={editingItem.value}
      />
    </>
  );
}
