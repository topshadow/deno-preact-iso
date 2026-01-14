import { ErrorBoundary, LocationProvider, Route, Router } from "preact-iso";
import { routes } from "./routes.tsx";

// クライアント側で初期データを取得
const getInitialData = () => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const w = window as any;
  if (typeof w !== "undefined" && w.__INITIAL_DATA__) {
    return w.__INITIAL_DATA__;
  }
  return {};
};

const App = () => {
  const initialData = getInitialData();

  return ( 
    <LocationProvider>  
      <ErrorBoundary>
        <Router>
          {routes.map(({ path, Component }) => (
            <Route
              key={path}
              path={"/plugins/shopxo-supplier/" + path}
              component={() => <Component {...initialData} />}
            />
          ))}
        </Router>
      </ErrorBoundary>
    </LocationProvider>
  );
};

export default App;
