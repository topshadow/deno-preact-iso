// import { useContext } from "hono/jsx";
// import { TableContext } from "./Table.tsx";
// import { X } from "./X.tsx";
// import { cn } from "../mod.tsx";

// export default function Pagination() {
//   let { count, page_size, page_index, base_url, target_id } = useContext(
//     TableContext,
//   );

//   page_size = page_size || 10;
//   page_index = page_index || 0;
//   console.log(count, page_size);
//   let max_page = Math.ceil(count / page_size);
//   let page_array = Object.keys(new Array(Math.ceil(max_page)).fill(0)).map((str,i)=>i);
//   page_array = page_array.slice(page_index - 5 < 0 ? 0 : page_index - 5, page_index + 5 > max_page ? max_page : page_index + 5);

//   return (
//     <div class="flex items-center justify-between w-full h-16 px-3 border-t border-neutral-200">
//       <p class="pl-2 text-sm text-gray-700">
//         显示 <span class="font-medium">{page_index * page_size + 1}</span> 到

//         <span class="font-medium">{(page_index + 1) * page_size}</span> 总共
//         <span class="font-medium">{count}</span> 条记录
//       </p>

//       <nav>
//         <ul class="flex items-center text-sm leading-tight bg-white border-border divide-x rounded h-9 text-neutral-500 divide-neutral-200 ">
//           {page_index > 0 && (
//             <a
//               xOnClick={`page_index=i-1 ;$ajax('${base_url}',{method:"post",body:{data:{skip:page_size*i,user:{a:1}}},targets:['${target_id}']})`}
//               class="relative inline-flex items-center h-full px-3 ml-0 rounded-l group hover:text-neutral-900"
//             >
//               <span>上一页</span>
//             </a>
//           )}
//           {page_array.map(i=> (
//             <X
//               class="h-full"
//               xData={`{i:${Number(i)}}`}
//             >
//               <li class="hidden h-full md:block cursor-pointer">
//                 <X
//                   tag={"a"}
//                   xOnClick={`page_index=i ;$ajax('${base_url}',{method:"post",body:{data:{page_size:page_size,page_index:Number(i),user:{a:1}}},targets:['${target_id}']})`}
//                   class={cn("relative inline-flex items-center h-full px-3 text-neutral-900 group bg-gray-50", (page_index==i?'bg-neutral-900 text-white': ''))}

//                 >
//                   <span>{Number(i) + 1}</span>
//                   <span class="box-content absolute bottom-0 left-0 w-full h-px -mx-px translate-y-px border-l border-r bg-neutral-900 border-neutral-900">
//                   </span>
//                 </X>
//               </li>
//             </X>
//           ))}

//           <li class="h-full">
//             {page_index < max_page - 1 && (
//               <X
//                 xOnClick={`page_index=i-1 ;$ajax('${base_url}',{method:"post",body:{data:{skip:page_size*i,user:{a:1}}},targets:['${target_id}']})`}
//                 class="relative inline-flex items-center h-full px-3 rounded-r group hover:text-neutral-900"
//               >
//                 <span>下一页</span>
//               </X>
//             )}
//           </li>
//         </ul>
//       </nav>
//     </div>
//   );
// }
