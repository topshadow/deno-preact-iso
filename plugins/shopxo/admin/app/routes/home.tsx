import { useState } from "preact/hooks";

export default function HomePage() {
  const [count, setCount] = useState(0);

  // alert('ok')
  //   const handleClick = async () => {
  //     const api = hc<ApiType>("/api");
  //     const res = await api.count.$post();
  //     const data = await res.json();
  //     setCount(data.count);
  //   };

  return (
    <div className="min-h-screen ">
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
}
