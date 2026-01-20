import { os } from "@orpc/server";
import { OContext, Output } from "@24wings/build/types";
import * as z from "zod";
import * as jwt from "jsonwebtoken";
import { setCookie } from "hono/cookie";

// JWT配置
const JWT_SECRET = "your-secret-key";
const JWT_EXPIRES_IN = "1h";

// 固定账号密码
const FIXED_USERNAME = "admin";
const FIXED_PASSWORD = "123456";

// 登录请求schema
const LoginSchema = z.object({
  username: z.string(),
  password: z.string(),
});

// JWT Payload schema
const JwtPayloadSchema = z.object({
  userId: z.string(),
  username: z.string(),
  role: z.string(),
});

// 登录响应schema
const LoginOutput = Output.extend({
  data: z.object({
    token: z.string(),
    user: z.object({
      username: z.string(),
      role: z.string(),
    }),
  }).optional(),
});

// 验证token响应schema
const VerifyTokenOutput = Output.extend({
  data: z.object({
    valid: z.boolean(),
    user: JwtPayloadSchema.optional(),
  }).optional(),
});

/**
 * 用户登录
 * @description 验证用户账号密码并生成JWT令牌
 * @param {Object} input - 登录参数
 * @param {string} input.username - 用户名
 * @param {string} input.password - 密码
 * @returns {Promise<Output>} 返回登录结果，包含JWT令牌和用户信息
 */
export const login = os
  .$context<OContext>()
  .route({ description: "验证用户账号密码并生成JWT令牌" })
  .input(LoginSchema)
  .output(LoginOutput)
  .handler(async ({ input, context }) => {
    try {
      // 验证账号密码
      if (
        input.username !== FIXED_USERNAME || input.password !== FIXED_PASSWORD
      ) {
        return {
          ok: false,
          msg: "账号或密码错误",
        };
      }

      // 生成JWT
      const payload = {
        userId: "1",
        username: input.username,
        role: "admin",
      };

      const token = jwt.sign(payload, JWT_SECRET, {
        expiresIn: JWT_EXPIRES_IN,
      });
      setCookie(context.hono, "admin-token", token);
      return {
        ok: true,
        msg: "登录成功",
        data: {
          token,
          user: {
            username: input.username,
            role: "admin",
          },
        },
      };
    } catch (error) {
      console.error("登录失败:", error);
      return {
        ok: false,
        msg: `登录失败: ${error.message}`,
      };
    }
  });

/**
 * 验证JWT令牌
 * @description 验证JWT令牌的有效性
 * @param {Object} input - 验证参数
 * @param {string} input.token - 要验证的JWT令牌
 * @returns {Promise<Output>} 返回验证结果，包含令牌是否有效以及用户信息
 */
export const verify_token = os
  .route({ description: "验证JWT令牌的有效性" })
  .input(z.object({ token: z.string() }))
  .output(VerifyTokenOutput)
  .handler(async ({ input }) => {
    try {
      // 验证token
      const decoded = jwt.verify(input.token, JWT_SECRET) as jwt.JwtPayload;

      return {
        ok: true,
        msg: "Token验证成功",
        data: {
          valid: true,
          user: {
            userId: decoded.userId as string,
            username: decoded.username as string,
            role: decoded.role as string,
          },
        },
      };
    } catch (error) {
      console.error("Token验证失败:", error);
      return {
        ok: true,
        msg: "Token验证失败",
        data: {
          valid: false,
        },
      };
    }
  });

/**
 * 用户登出
 * @description 处理用户登出请求（JWT是无状态的，实际只需客户端删除令牌）
 * @returns {Promise<Output>} 返回登出结果
 */
export const logout = os
  .route({description:'处理用户登出请求（JWT是无状态的，实际只需客户端删除令牌）'})
  .output(Output)
  .handler(async () => {
    // JWT是无状态的，登出只需客户端删除token
    return {
      ok: true,
      msg: "登出成功",
    };
  });
