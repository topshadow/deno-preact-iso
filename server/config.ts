import { exists } from "@std/fs";
import { parse, stringify } from "@std/dotenv";
export type EnvObj={
   DATABASE_URL: string; DIALECT: string 
}
export const load_env = async (): Promise<{ ok: true; data: EnvObj} |{ok:false,msg:string} > => {
  const is_exsit_env = await exists(".env");
  if (is_exsit_env) {
    const env_string = await Deno.readTextFile(".env");
    const obj = parse(env_string);
    if (obj.DATABASE_URL&&obj.DIALECT) {
      return { ok: true, data: {DATABASE_URL:obj.DATABASE_URL,DIALECT:obj.DIALECT} };
    }else{
      return {ok:false,msg:'消息错误'}
    }
  } else {
    return { ok: false, msg:'没有找到.env文件' };
  }
};

export async function write_env(data: Record<string, string>) {
  await Deno.writeTextFile(".env", stringify(data));
}

export const reset_env = (data: Record<string, string>) => {
  if (typeof data == "object") {
    Object.keys(data).forEach((k) => Deno.env.set(k, data[k]));
  }
};
