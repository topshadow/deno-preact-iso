import { Button, useAlertDialog } from "@24wings/shadcn";
import { orpc_client } from "../../../../orpc-client.ts";
import { useSignal } from "@preact/signals";
import { useEffect } from "preact/hooks";
import type { SysDatasource } from "@24wings/build/types";
import { DataSourceForm } from "./DataSourceForm.tsx";
import { DataSourceTable } from "./DataSourceTable.tsx";

export default function DataSourcePage() {
  // 状态管理
  const datasources = useSignal<SysDatasource[]>([]);
  const loading = useSignal(false);
  const showDialog = useSignal(false);
  const editingItem = useSignal<Partial<SysDatasource> | undefined>(undefined);
  const { alert } = useAlertDialog();

  // 加载数据源列表
  const loadDatasources = async () => {
    loading.value = true;
    try {
      const result = await orpc_client.datasource.list_datasource();
      if (result.ok) {
        datasources.value = result.data || [];
      } else {
        alert("加载失败: " + result.msg);
      }
    } catch (error) {
      alert("加载数据源失败: " + (error as Error).message);
    } finally {
      loading.value = false;
    }
  };

  // 初始加载
  useEffect(() => {
    loadDatasources();
  }, []);

  // 打开编辑对话框
  const openEditDialog = (item: SysDatasource) => {
    editingItem.value = item;
    showDialog.value = true;
  };

  // 打开新增对话框
  const openAddDialog = () => {
    editingItem.value = undefined;
    showDialog.value = true;
  };

  // 关闭对话框
  const closeDialog = () => {
    showDialog.value = false;
    editingItem.value = undefined;
  };

  // 保存数据源
  const saveDatasource = async (data: Partial<SysDatasource>) => {
    loading.value = true;
    try {
      let result;
      if (data.id) {
        // 更新
        result = await orpc_client.datasource.update_datasource({
          id: data.id as number,
          url: data.url as string,
          domain: data.domain,
          status: data.status as "active" | "disabled",
        });
      } else {
        // 创建
        result = await orpc_client.datasource.create_datasource({
          url: data.url as string,
          dialect: data.dialect as "Mysql" | "Sqlite",
          domain: data.domain,
          status: data.status as "active" | "disabled",
        });
      }

      if (result.ok) {
        alert(result.msg || "保存成功");
        closeDialog();
        await loadDatasources();
      } else {
        alert("保存失败: " + result.msg);
      }
    } catch (error) {
      alert("保存失败: " + (error as Error).message);
    } finally {
      loading.value = false;
    }
  };

  // 删除数据源
  const deleteDatasource = async (id: number) => {
    if (!confirm("确定要删除这个数据源吗?")) {
      return;
    }

    loading.value = true;
    try {
      const result = await orpc_client.datasource.delete_datasource({ id });
      if (result.ok) {
        alert("删除成功");
        await loadDatasources();
      } else {
        alert("删除失败: " + result.msg);
      }
    } catch (error) {
      alert("删除失败: " + (error as Error).message);
    } finally {
      loading.value = false;
    }
  };

  return (
    <div class="w-full p-6">
      {/* 页面标题和操作按钮 */}
      <div class="mb-6 flex justify-between items-center">
        <h1 class="text-2xl font-bold">数据源管理</h1>
        <div class="flex gap-2">
          <Button
            onClick={openAddDialog}
            variant="default"
          >
            新增数据源
          </Button>
          <Button
            onClick={loadDatasources}
            variant="outline"
            disabled={loading.value}
          >
            {loading.value ? "加载中..." : "刷新"}
          </Button>
        </div>
      </div>

      {/* 数据源表格 */}
      <DataSourceTable
        datasources={datasources.value}
        onEdit={openEditDialog}
        onDelete={deleteDatasource}
        loading={loading.value}
      />

      {/* 新增/编辑对话框 */}
      <DataSourceForm
        isOpen={showDialog.value}
        onClose={closeDialog}
        onSave={saveDatasource}
        initialData={editingItem.value}
        loading={loading.value}
      />
    </div>
  );
}
