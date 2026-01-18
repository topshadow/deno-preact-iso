import { ErrorBoundary, LocationProvider, Route, Router } from "preact-iso";

// クライアント側で初期データを取得
const getInitialData = () => {
  if (typeof window !== "undefined" && window.__INITIAL_DATA__) {
    return window.__INITIAL_DATA__;
  }
  return {};
};

const App = () => {
  const initialData = getInitialData();
  let prefix = "";
  if (typeof window != "undefined") {
    prefix = window.module_path || "";
  }
  prefix = "" + prefix;

  return ( 
    <LocationProvider>  
      <ErrorBoundary>
        <Router>
          {/* 这里可以添加具体的路由配置 */}
          {/* 示例：<Route path={prefix + "/dashboard"} component={Dashboard} /> */}
        </Router>
      </ErrorBoundary>
    </LocationProvider>
  );
};

export default App;
