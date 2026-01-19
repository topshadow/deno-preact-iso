import { Button, Dialog, Input, Label, Select } from "@24wings/shadcn";
import { type Signal, useSignal } from "@preact/signals";
import type { SysTenant } from "@24wings/build/types";
import { SysTenantStatus, SysTenantStrategy } from "@24wings/build/types";

interface TenantFormProps {
  isOpen: Signal<boolean>;
  onClose: () => void;
  onSave: (data: Partial<SysTenant>) => Promise<void>;
  initialData?: Partial<SysTenant>;
  loading: boolean;
  isEditing: boolean;
}

export default function TenantForm({
  isOpen,
  onClose,
  onSave,
  initialData = {
    name: "",
    url: "",
    status: SysTenantStatus.active,
    strategy: SysTenantStrategy.Default,
    is_default: 0,
  },
  loading,
  isEditing,
}: TenantFormProps) {
  // 将boolean转换为Signal<boolean>以满足Dialog组件的要求
  const isOpenSignal = useSignal(isOpen);
  const currentTenant = useSignal<Partial<SysTenant>>(initialData);
  const nameValue = useSignal(currentTenant.value.name || "");
  const urlValue = useSignal(currentTenant.value.url || "");
  const statusValue = useSignal(
    currentTenant.value.status || SysTenantStatus.active,
  );
  const strategyValue = useSignal(
    currentTenant.value.strategy || SysTenantStrategy.Default,
  );
  const isDefaultValue = useSignal(currentTenant.value.is_default ? 1 : 0);

  const handleSubmit = async () => {
    currentTenant.value = {
      ...currentTenant.value,
      name: nameValue.value,
      url: urlValue.value,
      status: statusValue.value,
      strategy: strategyValue.value,
      is_default: isDefaultValue.value,
    };
    await onSave(currentTenant.value);
  };

  return (
    <Dialog open={isOpen}>
      <Dialog.Content class="sm:max-w-lg">
        <Dialog.Header title={isEditing ? "编辑租户" : "新建租户"} />
            {isOpen.value&&<Dialog.Body>
          <div class="grid gap-4 py-4">
            <div class="grid grid-cols-4 items-center gap-4">
              <Label htmlFor="name" class="text-right">
                租户名称
              </Label>
              <Input
                id="name"
                value={nameValue}
                class="col-span-3"
                placeholder="请输入租户名称"
              />
            </div>

            <div class="grid grid-cols-4 items-center gap-4">
              <Label htmlFor="url" class="text-right">
                租户URL
              </Label>
              <Input
                id="url"
                value={urlValue}
                class="col-span-3"
                placeholder="请输入租户URL"
              />
            </div>

            <div class="grid grid-cols-4 items-center gap-4">
              <Label htmlFor="strategy" class="text-right">
                策略
              </Label>
              <Select
                value={strategyValue}
                options={[
                  { value: SysTenantStrategy.Default, label: "默认" },
                  { value: SysTenantStrategy.Domain, label: "域名" },
                  { value: SysTenantStrategy.SubDomain, label: "子域名" },
                ]}
                placeholder="选择策略"
                class="col-span-3"
              />
            </div>

            <div class="grid grid-cols-4 items-center gap-4">
              <Label htmlFor="status" class="text-right">
                状态
              </Label>
              <Select
                value={statusValue}
                options={[
                  { value: SysTenantStatus.active, label: "激活" },
                  { value: SysTenantStatus.disabled, label: "禁用" },
                ]}
                placeholder="选择状态"
                class="col-span-3"
              />
            </div>

            <div class="grid grid-cols-4 items-center gap-4">
              <Label htmlFor="is_default" class="text-right">
                默认租户
              </Label>
              <div class="flex items-center gap-2 col-span-3">
                <input
                  type="checkbox"
                  id="is_default"
                  checked={isDefaultValue.value === 1}
                  onChange={(e) => (isDefaultValue.value = e.currentTarget.checked ? 1 : 0)}
                  class="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                />
                <Label htmlFor="is_default" class="cursor-pointer">
                  设为默认租户
                </Label>
              </div>
            </div>
          </div>
        </Dialog.Body>}
   
        <Dialog.Footer>
          <Button
            variant="outline"
            onClick={onClose}
          >
            取消
          </Button>
          <Button onClick={handleSubmit} loading={loading}>
            {isEditing ? "保存修改" : "创建租户"}
          </Button>
        </Dialog.Footer>
      </Dialog.Content>
    </Dialog>
  );
}
