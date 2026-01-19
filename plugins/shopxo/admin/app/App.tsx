import { ErrorBoundary, LocationProvider, Route, Router } from "preact-iso";
import HomePage from "./routes/home.tsx";
import { Button, DialogProvider } from "@24wings/shadcn";
import { DashLayout } from "@24wings/shadcn/pro";
import { useMenus } from "./data/menus.tsx";
import SupplierPage from "./routes/supplier/SupplierPage.tsx";
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
  const menus = useMenus();
  return (
    <DialogProvider>
      <DashLayout menus={menus}>
        <LocationProvider>
          <ErrorBoundary>
            <Router>
              {/* 这里可以添加具体的路由配置 */}
              {/* 示例：<Route path={prefix + "/dashboard"} component={Dashboard} /> */}
              <Route path={prefix + "/"} component={HomePage} />
              <Route path={prefix + "/dash/supplier"} component={SupplierPage} />
              
            </Router>
          </ErrorBoundary>
        </LocationProvider>
      </DashLayout>
    </DialogProvider>
  );
};

export default App;
