import { ErrorBoundary, LocationProvider, Route, Router } from "preact-iso";

import Home from "./routes/home.tsx";
import { DialogProvider } from "@24wings/shadcn";

// クライアント側で初期データを取得
const getInitialData = () => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any

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
  return (
    <DialogProvider>
      <LocationProvider>
        <ErrorBoundary>
          <Home></Home>
        </ErrorBoundary>
      </LocationProvider>
    </DialogProvider>
  );
};

export default App;
