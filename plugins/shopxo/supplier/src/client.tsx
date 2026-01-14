
import { hydrate } from "preact";
import App from "./App.tsx";

console.log("client.tsx loaded!");
hydrate(<App />, document.getElementById("root")!);
   