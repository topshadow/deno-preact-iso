import type { Context } from "hono";
import { hc } from "hono/client";
import { useState } from "preact/hooks";
// import { drizzle } from "drizzle-orm/d1";
// import { counter } from "../../db/schema";
// import type { CloudflareBindings } from "../../server";
// import type { ApiType } from "../../api";
// import Header from "../components/Header";

// loader: SSR時にデータ取得
export const loader = async () => {
  return { count: 1 };
};
export const Head = async () => {
  return `<meta itemType={'keyword'}><span>关键字</span>
  </meta>`;
};
export type LoaderData = Awaited<ReturnType<typeof loader>>;

// Component: ページコンポーネント
export const Component = ({ count: initialCount }: LoaderData) => {
  const [count, setCount] = useState(initialCount);

  // alert('ok')
  //   const handleClick = async () => {
  //     const api = hc<ApiType>("/api");
  //     const res = await api.count.$post();
  //     const data = await res.json();
  //     setCount(data.count);
  //   };

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-950">
      {/* <Header /> */}

      {/* Hero Section */}
      <main className="max-w-4xl mx-auto px-4 py-16">
        <div>版本 v0.1.8</div>
        <button
          className="inline-flex items-center gap-2 px-6 py-3 bg-gray-900 dark:bg-white text-white dark:text-gray-900 rounded-lg font-medium hover:bg-gray-800 dark:hover:bg-gray-100 active:bg-gray-950 dark:active:bg-gray-200 transition-colors shadow-sm"
          onClick={() => setCount(count + 1)}
        >
          <span>Count:</span>
          <span className="bg-white/20 dark:bg-gray-900/20 px-2 py-0.5 rounded">
            {count}
          </span>
        </button>
      </main>
      <script type="module" src="/plugins/shopxo-supplier/client.js"></script>
    </div>
  );
};
