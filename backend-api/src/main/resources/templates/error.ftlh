<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Error</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Arial, sans-serif; }
  body { color: #1a1a1a; background: #f6f7f9; }
  .wrap { max-width: 520px; margin: 80px auto; padding: 40px; background: #fff;
          border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); text-align: center; }
  .code { font-size: 48px; font-weight: 700; color: #e8590c; margin-bottom: 8px; }
  h1 { font-size: 22px; margin-bottom: 12px; }
  p { color: #666; margin-bottom: 24px; }
  a { display: inline-block; padding: 12px 22px; background: #1e3a5f; color: #fff;
      border-radius: 8px; text-decoration: none; font-weight: 600; margin: 0 4px; }
</style>
</head>
<body>
  <div class="wrap">
    <#assign code = status!500>
    <div class="code">${code?c}</div>
    <#if code == 404>
      <h1>Page not found</h1>
      <p>We couldn't find the page you were looking for.</p>
    <#elseif code == 400>
      <h1>That link isn't valid</h1>
      <p>Something in the address or the form wasn't in the expected format.</p>
    <#else>
      <h1>Something went wrong</h1>
      <p>We hit an unexpected problem. Please try again in a moment.</p>
    </#if>
    <a href="/">Home</a>
    <a href="/mechanics">Find Mechanics</a>
  </div>
</body>
</html>
