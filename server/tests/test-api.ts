import { orpc_client } from "@24wings/server/orpc-client";

Deno.test('a',async()=>{
   const data= await orpc_client.planet.list2.listPlanet({limit:10,cursor:10});
   console.log(data)
})