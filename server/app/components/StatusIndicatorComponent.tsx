import { useSignal } from "@preact/signals";
import { orpc_client } from "@24wings/server/orpc-client";

interface StatusIndicatorComponentProps {
  onStatusChange: (status: boolean) => void;
}

export function StatusIndicatorComponent({ onStatusChange }: StatusIndicatorComponentProps) {
  const refresh_status = () => {
    orpc_client.env.current_status().then((r) => {
      onStatusChange(r.ok);
    });
  };

  // 组件挂载时检查状态
  refresh_status();

  return null;
}