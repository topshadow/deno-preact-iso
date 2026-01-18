import { Button, Dialog, Input, Label, Select } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";
import type { Dialect, SysDbStatus, SysDatasource } from "@24wings/build/types";

interface DataSourceFormProps {
  isOpen: boolean;
  onClose: () => void;
  onSave: (data: Partial<SysDatasource>) => Promise<void>;
  initialData?: Partial<SysDatasource>;
  loading?: boolean;
}

export function DataSourceForm({
  isOpen,
  onClose,
  onSave,
  initialData = {},
  loading = false,
}: DataSourceFormProps) {
  // 将boolean转换为Signal<boolean>以满足Dialog组件的要求
  const isOpenSignal = useSignal(isOpen);
  // 表单数据管理
  const formUrlSignal = useSignal(initialData.url || "");
  const formDialectSignal = useSignal<keyof typeof Dialect>(initialData.dialect || "Sqlite");
  const formDomainSignal = useSignal(initialData.domain || "");
  const formStatusSignal = useSignal<keyof typeof SysDbStatus>(initialData.status || "active");

  // 表单提交处理
  const handleSubmit = async () => {
    // 表单验证
    if (!formUrlSignal.value) {
      alert("请输入数据库URL");
      return;
    }

    // 构建表单数据
    const formData = {
      url: formUrlSignal.value,
      dialect: formDialectSignal.value,
      domain: formDomainSignal.value || null,
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
          {initialData.id ? "编辑数据源" : "新增数据源"}
        </Dialog.Header>
        <Dialog.Body>
          {/* URL 输入 */}
          <div class="space-y-2">
            <Label>数据库 URL</Label>
            <Input
              type="text"
              value={formUrlSignal}
              placeholder="例如: sqlite://data.db 或 mysql://host/db"
            />
          </div>

          {/* 数据库类型 */}
          <div class="space-y-2">
            <Label>数据库类型</Label>
            <Select
              value={formDialectSignal}
              options={[
                { value: "Sqlite", label: "SQLite" },
                { value: "Mysql", label: "MySQL" },
              ]}
              placeholder="选择数据库类型"
            />
          </div>

          {/* 域名 */}
          <div class="space-y-2">
            <Label>域名 (可选)</Label>
            <Input
              type="text"
              value={formDomainSignal}
              placeholder="例如: example.com"
            />
          </div>

          {/* 状态 */}
          <div class="space-y-2">
            <Label>状态</Label>
            <Select
              value={formStatusSignal}
              options={[
                { value: "active", label: "活跃" },
                { value: "disabled", label: "禁用" },
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
