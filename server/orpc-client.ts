import type { RouterClient } from "@orpc/server";
import { createORPCClient } from "@orpc/client";
import { RPCLink } from "@orpc/client/fetch";
import type { router } from "./plugin.ts";
let base = "";
if (typeof window == "undefined") {
  //TODO  Deno环境设置服务器内部模块调用接口
  base = "http://localhost:8000";
} else {
  base = location.origin;
}
const link = new RPCLink({
  url: base + "/plugins/base/rpc",
  headers: { Authorization: "Bearer token" },
});

export const orpc_client: RouterClient<typeof router> = createORPCClient(link);
