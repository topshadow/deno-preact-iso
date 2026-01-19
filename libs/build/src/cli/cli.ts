// // 当直接运行该文件时，使用默认配置启动服务器
// if (import.meta.main) {
//   // 解析命令行参数
//   const args = parseArgs<
//     { m: string; d?: string; help?: boolean; port?: string }
//   >(Deno.args);

//   // 帮助信息
//   if (args.help) {
//     console.log(`
// -m  设置默认模块
// -d  禁用其他模块
// -port  设置服务器端口
// `);
//     Deno.exit(0);
//   }
// }
