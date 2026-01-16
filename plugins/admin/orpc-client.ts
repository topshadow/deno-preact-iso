import type { RouterClient } from "@orpc/server";
import { createORPCClient } from "@orpc/client";
import { RPCLink } from "@orpc/client/fetch";
import type { router } from "./plugin.ts";
let base = "";
if (typeof window == "undefined") {
} else {
  base = location.origin;
}
const link = new RPCLink({
  url: base + "/plugins/admin/rpc",
  headers: { Authorization: "Bearer token" },
});

export const orpc_client: RouterClient<typeof router> = createORPCClient(link);
