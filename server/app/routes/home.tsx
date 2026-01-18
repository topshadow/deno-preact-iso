import { useEffect } from "preact/hooks";
import { useSignal } from "@preact/signals";
import { DatabaseConfigComponent } from "../components/DatabaseConfigComponent.tsx";
import { PluginSelectionComponent } from "../components/PluginSelectionComponent.tsx";
import { StatusIndicatorComponent } from "../components/StatusIndicatorComponent.tsx";

// loader: SSR時にデータ取得
export const loader = () => {
  return { count: 1 };
};
export const Head = () => {
  return `<meta itemType={'keyword'}><span>关键字</span>
  </meta>`;
};
export type LoaderData = Awaited<ReturnType<typeof loader>>;

// Component: ページコンポーネント
export default function Home({}: Partial<LoaderData>) {
  const is_success = useSignal(false);

  const handleStatusChange = (status: boolean) => {
    is_success.value = status;
  };

  const handleConfigSuccess = () => {
    is_success.value = true;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 dark:from-gray-900 dark:to-gray-800 py-8 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        {/* 页面标题 */}
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
            欢迎使用 Deno Preact ISO
          </h1>
          <p className="text-gray-600 dark:text-gray-300">
            简单、快速、现代化的 Web 应用框架
          </p>
        </div>

        {/* 状态检查组件 */}
        <div className="mb-6">
          <StatusIndicatorComponent onStatusChange={handleStatusChange} />
        </div>

        {/* 引导配置页面 */}
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg overflow-hidden transition-all duration-300 hover:shadow-xl">
          {!is_success.value
            ? <DatabaseConfigComponent onSuccess={handleConfigSuccess} />
            : <PluginSelectionComponent />}
        </div>

        {/* 页脚信息 */}
        <div className="mt-8 text-center text-sm text-gray-500 dark:text-gray-400">
          <p>© {new Date().getFullYear()} Deno Preact ISO. 保留所有权利。</p>
        </div>
      </div>
    </div>
  );
}
