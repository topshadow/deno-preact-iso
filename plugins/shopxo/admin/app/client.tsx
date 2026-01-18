import { hydrate } from "preact";
import App from "./App.tsx";

console.log("client.tsx loaded!", "module_path:", window.module_path);
hydrate(<App />, document.getElementById("root")!);
