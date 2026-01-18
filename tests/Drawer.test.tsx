import { render } from "preact-render-to-string";
import { Drawer } from "../libs/shadcn/components/Drawer.tsx";
import { useSignal } from "@preact/signals";
import { createElement } from "preact";

// 测试辅助函数
function renderWithSignal(Component: any, props: any = {}) {
  const isOpen = useSignal(false);
  const tree = createElement(Component, { ...props, open: isOpen });
  return render(tree);
}

// 测试Drawer组件渲染
deno.test("Drawer组件应该正确渲染", () => {
  const output = renderWithSignal(Drawer, {
    children: <Drawer.Content>
      <Drawer.Header title="测试Drawer" />
      <Drawer.Body>
        <p>Drawer内容</p>
      </Drawer.Body>
    </Drawer.Content>
  });
  
  console.log("Drawer渲染结果:", output);
  
  // 基本结构检查
  if (!output.includes("Drawer")) {
    throw new Error("Drawer组件应该包含Drawer标题");
  }
  
  if (!output.includes("Drawer内容")) {
    throw new Error("Drawer组件应该包含Drawer内容");
  }
});

// 测试右侧Drawer
deno.test("右侧Drawer应该有正确的样式类", () => {
  const output = renderWithSignal(Drawer, {
    position: "right",
    children: <Drawer.Content>
      <Drawer.Header title="右侧Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("right-0")) {
    throw new Error("右侧Drawer应该包含right-0类");
  }
});

// 测试左侧Drawer
deno.test("左侧Drawer应该有正确的样式类", () => {
  const output = renderWithSignal(Drawer, {
    position: "left",
    children: <Drawer.Content>
      <Drawer.Header title="左侧Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("left-0")) {
    throw new Error("左侧Drawer应该包含left-0类");
  }
});

// 测试overlay效果
deno.test("overlay效果应该有半透明背景", () => {
  const output = renderWithSignal(Drawer, {
    effect: "overlay",
    children: <Drawer.Content>
      <Drawer.Header title="Overlay Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("bg-black/50")) {
    throw new Error("overlay效果应该包含半透明背景类");
  }
});

// 测试push效果
deno.test("push效果应该包含内容包装器", () => {
  const output = renderWithSignal(Drawer, {
    effect: "push",
    children: <Drawer.Content>
      <Drawer.Header title="Push Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("transition-transform")) {
    throw new Error("push效果应该包含过渡动画类");
  }
});

// 测试不同尺寸
deno.test("sm尺寸Drawer应该有正确的宽度", () => {
  const output = renderWithSignal(Drawer, {
    size: "sm",
    children: <Drawer.Content>
      <Drawer.Header title="小尺寸Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("w-80")) {
    throw new Error("sm尺寸Drawer应该包含w-80类");
  }
});

deno.test("lg尺寸Drawer应该有正确的宽度", () => {
  const output = renderWithSignal(Drawer, {
    size: "lg",
    children: <Drawer.Content>
      <Drawer.Header title="大尺寸Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("w-[640px]")) {
    throw new Error("lg尺寸Drawer应该包含w-[640px]类");
  }
});

// 测试Drawer子组件
deno.test("Drawer应该正确渲染所有子组件", () => {
  const output = renderWithSignal(Drawer, {
    children: <Drawer.Content>
      <Drawer.Header title="完整Drawer" description="这是一个完整的Drawer示例" />
      <Drawer.Body>
        <p>Drawer主体内容</p>
      </Drawer.Body>
      <Drawer.Footer>
        <button>取消</button>
        <button>确认</button>
      </Drawer.Footer>
    </Drawer.Content>
  });
  
  // 检查所有子组件是否渲染
  if (!output.includes("完整Drawer")) {
    throw new Error("Drawer.Header应该渲染标题");
  }
  
  if (!output.includes("这是一个完整的Drawer示例")) {
    throw new Error("Drawer.Header应该渲染描述");
  }
  
  if (!output.includes("Drawer主体内容")) {
    throw new Error("Drawer.Body应该渲染内容");
  }
  
  if (!output.includes("确认")) {
    throw new Error("Drawer.Footer应该渲染按钮");
  }
});

// 测试关闭按钮
deno.test("Drawer应该包含关闭按钮", () => {
  const output = renderWithSignal(Drawer, {
    children: <Drawer.Content>
      <Drawer.Header title="带关闭按钮的Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("close")) {
    throw new Error("Drawer应该包含关闭按钮");
  }
});

// 测试过渡动画
deno.test("Drawer应该包含过渡动画类", () => {
  const output = renderWithSignal(Drawer, {
    children: <Drawer.Content>
      <Drawer.Header title="带过渡动画的Drawer" />
    </Drawer.Content>
  });
  
  if (!output.includes("transition-transform")) {
    throw new Error("Drawer应该包含过渡动画类");
  }
  
  if (!output.includes("duration-300")) {
    throw new Error("Drawer应该包含持续时间类");
  }
});
