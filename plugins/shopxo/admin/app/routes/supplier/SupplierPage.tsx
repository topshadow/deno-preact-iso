import { useEffect, useState } from "preact/hooks";
import { useSignal } from "@preact/signals";
import { orpc_client } from "../../../orpc-client.ts";
import type { SxoPluginsSupplier } from "../../../db/SysSupplier.ts";
import {
  Button,
  Card,
  Dialog,
  Input,
  Label,
  Select,
  Table,
  // Textarea,
} from "@24wings/shadcn";

export default function SupplierPage() {
  // 状态管理
  const [suppliers, setSuppliers] = useState<SxoPluginsSupplier[]>([]);
  const [loading, setLoading] = useState(false);
  const [currentSupplier, setCurrentSupplier] = useState<
    SxoPluginsSupplier | null
  >(null);
  const isAddDialogOpen = useSignal(false);
  const isEditDialogOpen = useSignal(false);
  const [keyword, setKeyword] = useState("");
  const [page, setPage] = useState(1);
  const [limit] = useState(10);
  const [total, setTotal] = useState(0);
  const [formData, setFormData] = useState({
    name: "",
    code: "",
    status: 0,
    describe: "",
  });

  // 获取供应商列表
  const fetchSuppliers = async () => {
    setLoading(true);
    try {
      const result = await orpc_client.supplier.list_supplier({
        page,
        limit,
        keyword,
      });
      if (result.ok && (result as any).data) {
        setSuppliers((result as any).data.list);
        setTotal((result as any).data.pagination.total);
      }
    } catch (error) {
      console.error("获取供应商列表失败:", error);
    } finally {
      setLoading(false);
    }
  };

  // 初始加载
  useEffect(() => {
    fetchSuppliers();
  }, [page, limit, keyword]);

  // 搜索
  const handleSearch = () => {
    setPage(1);
    fetchSuppliers();
  };

  // 重置搜索
  const handleReset = () => {
    setKeyword("");
    setPage(1);
    fetchSuppliers();
  };

  // 打开添加对话框
  const handleAddOpen = () => {
    setFormData({
      name: "",
      code: "",
      status: 0,
      describe: "",
    });
    isAddDialogOpen.value = true;
  };

  // 打开编辑对话框
  const handleEditOpen = (supplier: SxoPluginsSupplier) => {
    setCurrentSupplier(supplier);
    setFormData({
      name: supplier.name || "",
      code: supplier.code || "",
      status: supplier.status || 0,
      describe: supplier.describe || "",
    });
    isEditDialogOpen.value = true;
  };

  // 提交添加
  const handleAddSubmit = async (e: Event) => {
    e.preventDefault();
    try {
      const result = await orpc_client.supplier.create_supplier(formData);
      if (result.ok) {
        isAddDialogOpen.value = false;
        fetchSuppliers();
      }
    } catch (error) {
      console.error("添加供应商失败:", error);
    }
  };

  // 提交编辑
  const handleEditSubmit = async (e: Event) => {
    e.preventDefault();
    if (!currentSupplier) return;

    try {
      const result = await orpc_client.supplier.update_supplier({
        id: currentSupplier.id,
        data: formData,
      });
      if (result.ok) {
        isEditDialogOpen.value = false;
        fetchSuppliers();
      }
    } catch (error) {
      console.error("编辑供应商失败:", error);
    }
  };

  // 状态文本映射
  const getStatusText = (status: number) => {
    const statusMap = {
      0: "待提交",
      1: "待审核",
      2: "已审核",
      3: "已拒绝",
      4: "已关闭",
    };
    return statusMap[status as keyof typeof statusMap] || "未知状态";
  };

  // 状态样式映射
  const getStatusClass = (status: number) => {
    if (status === 2) return "bg-green-100 text-green-800";
    if (status === 3) return "bg-red-100 text-red-800";
    return "bg-yellow-100 text-yellow-800";
  };

  return (
    <div className="p-4">
      <Card>
        <Card.Header>
          <Card.Title>供应商管理</Card.Title>
        </Card.Header>
        <Card.Content>
          {/* 搜索和添加区域 */}
          <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
            <div className="flex gap-2 w-full md:w-auto">
              <Input
                placeholder="搜索供应商名称"
                value={keyword}
                onChange={(e) =>
                  setKeyword((e.target as HTMLInputElement).value)}
                className="w-full md:w-64"
              />
              <Button onClick={handleSearch}>搜索</Button>
              <Button variant="outline" onClick={handleReset}>重置</Button>
            </div>
            <Button onClick={handleAddOpen}>
              添加供应商
            </Button>
          </div>

          {/* 供应商列表 */}
          <div className="overflow-x-auto">
            <Table>
              <Table.Header>
                
                  <Table.Head>ID</Table.Head>
                  <Table.Head>名称</Table.Head>
                  <Table.Head>编码</Table.Head>
                  <Table.Head>状态</Table.Head>
                  <Table.Head>描述</Table.Head>
                  <Table.Head>操作</Table.Head>
                
              </Table.Header>
              <Table.Body>
                {loading
                  ? (
                    <Table.Row>
                      <Table.Cell colSpan={6} className="text-center">
                        加载中...
                      </Table.Cell>
                    </Table.Row>
                  )
                  : suppliers.length === 0
                  ? (
                    <Table.Row>
                      <Table.Cell colSpan={6} className="text-center">
                        暂无供应商数据
                      </Table.Cell>
                    </Table.Row>
                  )
                  : (
                    suppliers.map((supplier) => (
                      <Table.Row key={supplier.id}>
                        <Table.Cell>{supplier.id}</Table.Cell>
                        <Table.Cell>{supplier.name}</Table.Cell>
                        <Table.Cell>{supplier.code}</Table.Cell>
                        <Table.Cell>
                          <span
                            className={`px-2 py-1 rounded-full text-xs font-medium ${
                              getStatusClass(supplier.status)
                            }`}
                          >
                            {getStatusText(supplier.status)}
                          </span>
                        </Table.Cell>
                        <Table.Cell>{supplier.describe || "-"}</Table.Cell>
                        <Table.Cell>
                          <Button
                            variant="link"
                            onClick={() => handleEditOpen(supplier)}
                          >
                            编辑
                          </Button>
                        </Table.Cell>
                      </Table.Row>
                    ))
                  )}
              </Table.Body>
            </Table>
          </div>

          {/* 分页 */}
          {total > 0 && (
            <div className="flex justify-between items-center mt-4">
              <div>共 {total} 条记录</div>
              <div className="flex gap-2">
                <Button
                  variant="outline"
                  disabled={page === 1}
                  onClick={() => setPage(page - 1)}
                >
                  上一页
                </Button>
                <span className="flex items-center px-2">第 {page} 页</span>
                <Button
                  variant="outline"
                  disabled={page * limit >= total}
                  onClick={() => setPage(page + 1)}
                >
                  下一页
                </Button>
              </div>
            </div>
          )}
        </Card.Content>
      </Card>

      {/* 添加供应商对话框 */}
      <Dialog open={isAddDialogOpen}>
        <Dialog.Content>
          <Dialog.Header
            title="添加供应商"
            description="请填写供应商的基本信息"
          />
          <Dialog.Body>
            <form onSubmit={handleAddSubmit}>
              <div className="space-y-4 py-4">
                <div className="space-y-2">
                  <Label htmlFor="name">供应商名称</Label>
                  <Input
                    id="name"
                    placeholder="请输入供应商名称"
                    value={formData.name}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        name: (e.target as HTMLInputElement).value,
                      })}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="code">供应商编码</Label>
                  <Input
                    id="code"
                    placeholder="请输入供应商编码"
                    value={formData.code}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        code: (e.target as HTMLInputElement).value,
                      })}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="status">状态</Label>
                  <Select
                    id="status"
                    value={formData.status.toString()}
                    onValueChange={(value) =>
                      setFormData({
                        ...formData,
                        status: parseInt(value),
                      })}
                  >
                    <option value="0">待提交</option>
                    <option value="1">待审核</option>
                    <option value="2">已审核</option>
                    <option value="3">已拒绝</option>
                    <option value="4">已关闭</option>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="describe">描述</Label>
                  {/* <Textarea
                    id="describe"
                    placeholder="请输入供应商描述"
                    rows={3}
                    value={formData.describe}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        describe: (e.target as HTMLTextAreaElement).value,
                      })}
                  /> */}
                </div>
              </div>
              <Dialog.Footer>
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => isAddDialogOpen.value = false}
                >
                  取消
                </Button>
                <Button type="submit">保存</Button>
              </Dialog.Footer>
            </form>
          </Dialog.Body>
        </Dialog.Content>
      </Dialog>

      {/* 编辑供应商对话框 */}
      <Dialog open={isEditDialogOpen}>
        <Dialog.Content>
          <Dialog.Header
            title="编辑供应商"
            description="请修改供应商的基本信息"
          />
          <Dialog.Body>
            <form onSubmit={handleEditSubmit}>
              <div className="space-y-4 py-4">
                <div className="space-y-2">
                  <Label htmlFor="edit-name">供应商名称</Label>
                  <Input
                    id="edit-name"
                    placeholder="请输入供应商名称"
                    value={formData.name}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        name: (e.target as HTMLInputElement).value,
                      })}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="edit-code">供应商编码</Label>
                  <Input
                    id="edit-code"
                    placeholder="请输入供应商编码"
                    value={formData.code}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        code: (e.target as HTMLInputElement).value,
                      })}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="edit-status">状态</Label>
                  <Select
                    id="edit-status"
                    value={formData.status.toString()}
                    onValueChange={(value) =>
                      setFormData({
                        ...formData,
                        status: parseInt(value),
                      })}
                  >
                    <option value="0">待提交</option>
                    <option value="1">待审核</option>
                    <option value="2">已审核</option>
                    <option value="3">已拒绝</option>
                    <option value="4">已关闭</option>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="edit-describe">描述</Label>
                  {/* <Textarea
                    id="edit-describe"
                    placeholder="请输入供应商描述"
                    rows={3}
                    value={formData.describe}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        describe: (e.target as HTMLTextAreaElement).value,
                      })}
                  /> */}
                </div>
              </div>
              <Dialog.Footer>
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => isEditDialogOpen.value = false}
                >
                  取消
                </Button>
                <Button type="submit">保存</Button>
              </Dialog.Footer>
            </form>
          </Dialog.Body>
        </Dialog.Content>
      </Dialog>
    </div>
  );
}
