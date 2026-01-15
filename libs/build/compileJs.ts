import { resolve } from "@std/path";
async function compile(
  input_path: string,
  config: any,
  opt?: {
    output_path?: string;
    config_path?: string;
    cwd: string | URL;
    sourcemap?: boolean;
  },
): Promise<string | Deno.bundle.Message[]> {
  if (!config.compilerOptions) {
    config.compilerOptions = {
      "jsx": "react-jsx",
      "jsxImportSource": "preact",
    };
  }
  config.compilerOptions["jsx"] = "react-jsx";
  config.compilerOptions["jsxImportSource"] = "preact";

  const dir = await Deno.makeTempDir();
  const config_file_path = opt?.config_path ?? resolve(dir, "deno.json");

  Deno.writeTextFileSync(config_file_path, JSON.stringify(config));
  // console.log(config_file_path);
  // let external=[     "--packages",
  //     "external",
  //     "--external",
  //     "preact-iso",
  //     "--external",
  //     "preact",]

  const cwd = opt?.cwd || Deno.cwd();
  // console.log(
  //   "compile cwd:",
  //   cwd,
  //   "compile config_file_path:",
  //   config_file_path,
  // );
  const cmd = new Deno.Command("deno", {
    cwd: cwd,
    args: [
      "bundle",
      "-c",
      config_file_path,
      input_path,
      "--platform",
      "browser",
      "--minify",
      ...(opt && opt.sourcemap ? ["--sourcemap=inline"] : []),
      "-q",
    ],
  });
  const { stderr, stdout } = await cmd.output();
  if (stderr.length > 0) {
    const error = new TextDecoder().decode(stderr);

    console.error(" error cwd:", cwd, error);
    return error;
  } else {
    const data = new TextDecoder().decode(stdout);
    // console.log(data);
    if (opt && opt.output_path) {
      Deno.writeTextFile(opt.output_path, data);
    }
    return data;
  }

  //   return r.errors;
}

// import.meta.resolve()
type ImportMeta = {
  resolve: (specifier: string) => string;
  url: string;
};
export async function compile_js(
  { resolve, url }: ImportMeta,
  config: any,
) {
  // 如果是jsr  则从jsr下载js文件 ,如果是本地则编译
  const is_jsr = url.includes("jsr");
  if (is_jsr) {
    console.log("downloading from jsr ");
    const download_js = await fetch(
      `https://jsr.io/${config.name}/${config.version}/client.js`,
    ).then((r) => r.text());
    console.log("download js content:", download_js);
    return download_js;
  } else {
    const endpoint = resolve("./app/client.tsx");
    const cwd = new URL(".", url.replace("plugin.ts", ""));
    // const config_path = new URL("./client.tsx", url.replaceAll("plugin.ts", ""))
    //   .href.replace("file:///", "");

    return await compile(endpoint, config, { cwd });
  }
}
