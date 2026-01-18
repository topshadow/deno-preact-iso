import { ErrorBoundary, LocationProvider, Route, Router } from "preact-iso";

import Dash from "./routes/dash/Dash.tsx";
import DataSource from "./routes/dash/DataSource.tsx";
import TenantManagerPage from "./routes/dash/TenantManagerPage.tsx";
import TaskerPage from "./routes/dash/TaskerPage.tsx";
import { DialogProvider } from "@24wings/shadcn";
import { useMenus } from "./data/menus.tsx";
import PluginManager from "./routes/dash/PluginManager.tsx";
import { useEffect } from "preact/hooks";

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
    <Dash menus={menus}>
      <DialogProvider>
        <LocationProvider>
          <ErrorBoundary>
            <Router>
              <Route path={prefix + "/datasource"} component={DataSource}>
              </Route>

              <Route path={prefix + "/tenant"} component={TenantManagerPage}>
              </Route>
              <Route path={prefix + "/tasker"} component={TaskerPage}>
              </Route>
              <Route
                component={PluginManager}
                path={prefix + "/plugin-manager"}
              >
              </Route>
            </Router>
          </ErrorBoundary>
        </LocationProvider>
      </DialogProvider>
    </Dash>
  );
};

export default App;
