import {
  ErrorBoundary,
  LocationProvider,
  navigate,
  Route,
  Router,
} from "preact-iso";

import Dash from "./routes/dash/Dash.tsx";
import DataSource from "./routes/dash/DataSource.tsx";
import TenantManagerPage from "./routes/dash/TenantManagerPage.tsx";
import TaskerPage from "./routes/dash/TaskerPage.tsx";
import { DialogProvider } from "@24wings/shadcn";

import PluginManager from "./routes/dash/PluginManager.tsx";
import PassportPage from "./routes/passport/PassportPage.tsx";

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
          {/* 登录页面路由 - 不需要登录保护 */}

          <Route path={prefix + "/passport/*"} component={PassportRoute} />
          <Route path={prefix + "/dash/*"} component={AuthRoute}></Route>
        </Router>
      </ErrorBoundary>
    </LocationProvider>
  );
};

export default App;
function PassportRoute() {
  return (
    <ErrorBoundary>
      <Router>
        <Route path="/login" component={PassportPage} />
      </Router>
    </ErrorBoundary>
  );
}
function AuthRoute() {
  return (
    <ErrorBoundary>
      <Dash>
        <DialogProvider>
          <Router>
            <Route path="/datasource" component={DataSource}>
            </Route>

            <Route
              path="/tenant"
              component={TenantManagerPage}
            >
            </Route>
            <Route path="/tasker" component={TaskerPage}>
            </Route>
            <Route
              component={PluginManager}
              path="/plugin-manager"
            >
            </Route>
          </Router>
        </DialogProvider>
      </Dash>
    </ErrorBoundary>
  );
}
