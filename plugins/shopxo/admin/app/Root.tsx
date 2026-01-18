export function Root() {
  const initjs = `  var t = localStorage.getItem("theme");
      if (
        t === "dark" ||
        (!t && matchMedia("(prefers-color-scheme:dark)").matches)
      ) {
        document.documentElement.classList.add("dark");
      }`;
  return (
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <script dangerouslySetInnerHTML={{ __html: initjs }}>
        </script>
      </head>
      <body>
        <div id="root"></div>
        <script type="module" src="/plugins/shopxo-supplier/client.js"></script>
      </body>
    </html>
  );
}
