import { resolve } from "@std/path";
export async function Compile(
  input_path: string,
  config: any,
  opt?: {output_path?:string,config_path?:string,sourcemap?:boolean},
): Promise<string | Deno.bundle.Message[]> {
  // console.log(config);
  if (!config.compilerOptions) {
    config.compilerOptions = {
      "jsx": "react-jsx",
      "jsxImportSource": "preact",
    };
  }
  config.compilerOptions["jsx"] = "react-jsx";
  config.compilerOptions["jsxImportSource"] = "preact";

  const dir = await Deno.makeTempDir();
  const config_file_path = opt&&opt.config_path?opt.config_path: resolve(dir, "deno.json");

  Deno.writeTextFileSync(config_file_path, JSON.stringify(config));
  console.log(config_file_path);
  // let external=[     "--packages",
  //     "external",
  //     "--external",
  //     "preact-iso",
  //     "--external",
  //     "preact",]
  console.log(Deno.cwd())
  const cmd = new Deno.Command("deno", {
    cwd: Deno.cwd(),
    args: [
      "bundle",
      "-c",
      config_file_path,
      input_path,
      "--platform",
      "browser",
      '--minify',
      ...(opt&&opt.sourcemap?['--sourcemap=inline']:[]),
      "-q",
    ],
  });
  const { stderr, stdout } = await cmd.output();
  if (stderr.length > 0) {
    const error = new TextDecoder().decode(stderr); 

    console.error(error);
    return error;
  } else {
    const data = new TextDecoder().decode(stdout);
    // console.log(data);
    if (opt&& opt.output_path) {
      Deno.writeTextFile(opt.output_path, data);
    }
    return data;
  }

  //   return r.errors;
}
