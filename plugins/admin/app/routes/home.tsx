import { useEffect, useState } from "preact/hooks";
import { Button, Input } from "@24wings/shadcn";
import { useSignal, useSignalEffect } from "@preact/signals"; 
import { api } from "../api/mod.ts";
 



export const loader = async () => {
  return { count: 1 };
};
export const Head = async () => {
  return `<meta itemType={'keyword'}><span>关键字</span>
  </meta>`;
};
export type LoaderData = Awaited<ReturnType<typeof loader>>;

// Component: ページコンポーネント
export const Component = ({ count: initialCount }: LoaderData) => {
 

  return (
    <div className="">
     
    home module
    </div>
  );
};
