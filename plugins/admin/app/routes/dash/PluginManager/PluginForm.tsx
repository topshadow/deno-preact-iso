import { Button, Dialog, Input, Label, Select } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";
import type { SysPlugin } from "@24wings/build/types";
import { SysPluginStatus } from "@24wings/build/types";

interface PluginFormProps {
  isOpen: boolean;
  onClose: () => void;
  onSave: (data: Partial<SysPlugin>) => Promise<void>;
  initialData?: Partial<SysPlugin>;
  loading?: boolean;
}

export function PluginForm({
  isOpen,
  onClose,
  onSave,
  initialData = {},
  loading = false,
}: PluginFormProps) {
  // 将boolean转换为Signal<boolean>以满足Dialog组件的要求
  const isOpenSignal = useSignal(isOpen);
  // 表单数据管理
  const formNameSignal = useSignal(initialData.name || "");
  const formUrlSignal = useSignal(initialData.url || "");
  const formPathnameSignal = useSignal(initialData.pathname || "");
  const formDefaultPathnameSignal = useSignal(initialData.default_pathname || "");
  const formStatusSignal = useSignal<SysPluginStatus>(initialData.status || SysPluginStatus.active);

  // 表单提交处理
  const handleSubmit = async () => {
    // 表单验证
    if (!formNameSignal.value) {
      alert("请输入插件名称");
      return;
    }

    if (!formUrlSignal.value) {
      alert("请输入插件URL");
      return;
    }

    // 构建表单数据
    const formData = {
      name: formNameSignal.value,
      url: formUrlSignal.value,
      pathname: formPathnameSignal.value || undefined,
      default_pathname: formDefaultPathnameSignal.value,
      status: formStatusSignal.value,
      id: initialData.id,
    };

    // 调用父组件的保存回调
    await onSave(formData);
  };

  return (
    <Dialog
      open={isOpenSignal}
      class="fixed inset-0 z-50 flex items-center justify-center"
    >
      <Dialog.Content>
        <Dialog.Header>
          {initialData.id ? "编辑插件" : "新增插件"}
        </Dialog.Header>
        <Dialog.Body>
          {/* 插件名称 */}
          <div class="space-y-2">
            <Label>插件名称</Label>
            <Input
              type="text"
              value={formNameSignal}
              placeholder="请输入插件名称"
            />
          </div>

          {/* 插件URL */}
          <div class="space-y-2">
            <Label>插件URL</Label>
            <Input
              type="text"
              value={formUrlSignal}
              placeholder="请输入插件URL"
            />
          </div>

          {/* 路径名 */}
          <div class="space-y-2">
            <Label>路径名 (可选)</Label>
            <Input
              type="text"
              value={formPathnameSignal}
              placeholder="请输入路径名"
            />
          </div>

          {/* 默认路径名 */}
          <div class="space-y-2">
            <Label>默认路径名</Label>
            <Input
              type="text"
              value={formDefaultPathnameSignal}
              placeholder="请输入默认路径名"
            />
          </div>

          {/* 状态 */}
          <div class="space-y-2">
            <Label>状态</Label>
            <Select
              value={formStatusSignal}
              options={[
                { value: SysPluginStatus.active, label: "活跃" },
                { value: SysPluginStatus.disabled, label: "禁用" },
              ]}
              placeholder="选择状态"
            />
          </div>

          {/* 按钮 */}
          <div class="flex gap-2 justify-end pt-4">
            <Button
              variant="outline"
              onClick={onClose}
            >
              取消
            </Button>
            <Button
              variant="default"
              onClick={handleSubmit}
              disabled={loading}
            >
              {loading ? "保存中..." : "保存"}
            </Button>
          </div>
        </Dialog.Body>
      </Dialog.Content>
    </Dialog>
  );
}
