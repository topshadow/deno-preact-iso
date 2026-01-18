import { Input, Button, useDialog } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";
import { useEffect } from "preact/hooks";
import { orpc_client } from "../../../../orpc-client.ts";
import type { SysTenant } from "@24wings/build/types";
import { SysTenantStatus, SysTenantStrategy } from "@24wings/build/types";
import TenantForm from "./TenantForm.tsx";
import TenantTable from "./TenantTable.tsx";

export default function TenantManagerPage() {
  const { alert, confirm } = useDialog();
  const tenants = useSignal<SysTenant[]>([]);
  const loading = useSignal(false);
  const searchKeyword = useSignal("");
  const isDialogOpen = useSignal(false);
  const isEditing = useSignal(false);
  const currentTenant = useSignal<Partial<SysTenant>>({});

  const fetchTenants = async () => {
    loading.value = true;
    try {
      const result = await orpc_client.tenant.list_tenant({
        keyword: searchKeyword.value,
      });
      if (result.ok) {
        tenants.value = result.data;
      } else {
        alert(result.msg || "获取租户列表失败");
      }
    } catch (error) {
      alert("获取租户列表失败");
      console.error("Failed to fetch tenants:", error);
    } finally {
      loading.value = false;
    }
  };

  useEffect(() => {
    fetchTenants();
  }, [searchKeyword.value]);

  const handleCreate = () => {
    isEditing.value = false;
    currentTenant.value = {
      name: "",
      url: "",
      status: SysTenantStatus.active,
      strategy: SysTenantStrategy.Default,
      is_default: 0,
    };
    isDialogOpen.value = true;
  };

  const handleEdit = (tenant: SysTenant) => {
    isEditing.value = true;
    currentTenant.value = { ...tenant };
    isDialogOpen.value = true;
  };

  const handleDelete = async (id: number) => {
    const result = await confirm("删除确认", "确定要删除这个租户吗？");
    if (result) {
      try {
        const deleteResult = await orpc_client.tenant.delete_tenant({ id });
        if (deleteResult.ok) {
          alert("租户删除成功");
          fetchTenants();
        } else {
          alert(deleteResult.msg || "删除租户失败");
        }
      } catch (error) {
        alert("删除租户失败");
        console.error("Failed to delete tenant:", error);
      }
    }
  };

  const handleSave = async (formData: Partial<SysTenant>) => {
    try {
      let result;
      if (isEditing.value && currentTenant.value.id) {
        result = await orpc_client.tenant.update_tenant(
          formData as any,
        );
      } else {
        result = await orpc_client.tenant.create_tenant(
          formData as any,
        );
      }

      if (result.ok) {
        alert(isEditing.value ? "租户更新成功" : "租户创建成功");
        isDialogOpen.value = false;
        fetchTenants();
      } else {
        alert(
          result.msg || (isEditing.value ? "更新租户失败" : "创建租户失败"),
        );
      }
    } catch (error) {
      alert(isEditing.value ? "更新租户失败" : "创建租户失败");
      console.error("Failed to submit tenant:", error);
    }
  };

  return (
    <>
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-2xl font-bold">租户管理</h1>
        <div className="flex gap-2">
          <Input
            placeholder="搜索租户..."
            value={searchKeyword}
            className="w-64"
          />
          <Button onClick={handleCreate}>
            新建租户
          </Button>
        </div>
      </div>

      <TenantTable
        data={tenants.value}
        loading={loading.value}
        onEdit={handleEdit}
        onDelete={handleDelete}
      />

      <TenantForm
        isOpen={isDialogOpen.value}
        onClose={() => isDialogOpen.value = false}
        onSave={handleSave}
        initialData={currentTenant.value}
        loading={loading.value}
        isEditing={isEditing.value}
      />
    </>
  );
}
