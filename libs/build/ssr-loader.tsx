/**
 * 引用 https://github.com/yusukelatte/hinoco
 */

import type { Context, MiddlewareHandler } from "hono";
import type { StatusCode } from "hono/utils/http-status";
import type { JSX } from "preact";
import type { FunctionComponent } from "preact";
import { prerender } from "preact-iso";
import { locationStub } from "preact-iso/prerender";
import { renderToString } from "preact-render-to-string";
// import { Root } from "./src/Root.tsx";
export type SSRElement = () => JSX.Element;

type HTMLReplacer = (html: string, content: string) => string;
type SSROptions = {
  indexPath: string;
  replacer: HTMLReplacer;
  notFound: SSRElement;
};
// const index_html = renderToString(<Root />);

// ルートモジュールの型定義
export type RouteModule<T = unknown> = {
  loader?: (c: Context<{ Bindings: any }>) => Promise<T>;
  Component: (props: any) => JSX.Element;
  Head?: (c: Context<{ Bindings: any }>) => Promise<string>;
};

export const ssr = (
  App: SSRElement,
  options?: Partial<SSROptions>,
): MiddlewareHandler<{ Bindings: any }> => {
  return async (c, next) => {
    console.log("ssr!");
    const path = new URL(c.req.url).pathname;
    locationStub(path);
    let content = await prerender(<App />);
    let statusCode: StatusCode = 200;

    if (content.html === "") {
      if (options?.notFound) {
        content = await prerender(options.notFound());
        statusCode = 404;
      } else {
        return await next();
      }
    }

    const indexPath = options?.indexPath || "/index.html";
    const assetUrl = new URL(indexPath, c.req.url);
    console.log("assetUrl: ", assetUrl.toString());
    console.log("c.env.ASSETS: ", c.env.ASSETS);
    // const res = await c.env.ASSETS.fetch(assetUrl.toString());
    const view = renderToString(<App></App>);
    let replacer = options?.replacer;

    if (!replacer) {
      replacer = (html: string, content: string) =>
        html.replace(
          /<div id="root"><\/div>/,
          `<div id="root">${content}</div>`,
        );
    }

    const html = replacer(view, content.html);
    return c.html(html, statusCode);
  };
};

// ssrWithLoader: loader付きのSSRミドルウェア
export const ssrWithLoader = <T,>(
  route: RouteModule<T>,
  Root: FunctionComponent<{ module_path: string }>,
): MiddlewareHandler<{ Bindings: any }> => {
  console.log("ssrWithLoader!");
  return async (c) => {
    // console.log("ssrWithLoader called!");
    const path = new URL(c.req.url).pathname;
    locationStub(path);

    // 1. loader実行してデータ取得
    let data: any = {};
    if (route.loader) {
      console.log("calling loader...");

      data = await route.loader(c);
      console.log("loader data:", data);
    }

    // 2. データをpropsとしてコンポーネントをレンダリング
    const { html: content } = await prerender(
      <route.Component {...data} />,
    );
    let head = "";
    if (route.Head) {
      head = await route.Head(c);
    }

    // 3. index.htmlを取得
    // const res = await c.env.ASSETS.fetch(new URL("/index.html", c.req.url));
    console.log("ssr_loader env", c.env);
    const { html: view } = await prerender(
      <Root module_path={c.env.module_path == "/" ? "" : c.env.module_path} />,
    );

    // 4. SSR結果を埋め込み + 初期データをwindowに注入
    const html = view
      .replace(
        /<div id="root"><\/div>/,
        `<div id="root">${content}</div>`,
      )
      .replace(
        "</head>",
        `${head} <script>window.__INITIAL_DATA__ = ${
          JSON.stringify(
            data,
          )
        };
          window.module_path="${c.env.module_path}"
        </script></head>`,
      );

    return c.html(html);
  };
};
