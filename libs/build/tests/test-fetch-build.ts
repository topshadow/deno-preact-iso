Deno.test("test fetch build js",async ()=>{
   const res= await fetch(`https://jsr.io/@db/sqlite/0.13.0/src/database.ts`).then(r=>r.text());
   console.log(res)

})