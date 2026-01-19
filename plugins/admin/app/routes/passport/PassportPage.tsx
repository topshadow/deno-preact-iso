import { useState } from "preact/hooks";
import { orpc_client } from "../../../orpc-client.ts";
import { Button, Input } from "@24wings/shadcn";
import { useSignal } from "@preact/signals";

const PassportPage = () => {
  // 状态管理
  const username = useSignal("");
  const password = useSignal("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  // 登录处理
  const handleLogin = async (e: Event) => {
    e.preventDefault();
    setLoading(true);
    setError("");

    try {
      const result = await orpc_client.passport.login({
        username:username.value,
        password:password.value,
      });

      if (result.ok && result.data) {
        // 保存token到localStorage
        localStorage.setItem("admin_token", result.data.token);
        localStorage.setItem("admin_user", JSON.stringify(result.data.user));

        // 跳转到首页
        window.location.href = "/admin/";
      } else {
        setError(result.msg || "登录失败");
      }
    } catch (err) {
      setError("登录失败，请稍后重试");
      console.error("登录错误:", err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100">
      <div className="w-full max-w-md p-8 bg-white rounded-lg shadow-md">
        <h1 className="text-2xl font-bold text-center text-gray-800 mb-6">
          管理员登录
        </h1>
        
        {error && (
          <div className="mb-4 p-3 bg-red-100 text-red-800 rounded-md">
            {error}
          </div>
        )}
        
        <form onSubmit={handleLogin} className="space-y-4">
          <div>
            <label htmlFor="username" className="block text-sm font-medium text-gray-700 mb-1">
              用户名
            </label>
            <Input
              id="username"
              type="text"
              placeholder="请输入用户名"
              value={username}
              required
              className="w-full"
            />
          </div>
          
          <div>
            <label htmlFor="password" className="block text-sm font-medium text-gray-700 mb-1">
              密码
            </label>
            <Input
              id="password"
              type="password"
              placeholder="请输入密码"
              value={password}
              required
              className="w-full"
            />
          </div>
          
          <Button
            type="submit"
            disabled={loading}
            className="w-full"
          >
            {loading ? "登录中..." : "登录"}
          </Button>
        </form>
        
        <div className="mt-4 text-center text-sm text-gray-500">
          提示：使用固定账号密码登录 (admin / 123456)
        </div>
      </div>
    </div>
  );
};

export default PassportPage;