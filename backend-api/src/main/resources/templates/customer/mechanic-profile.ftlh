<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - ${provider.name!"Mechanic"}</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Arial, sans-serif; }
  body { color: #1a1a1a; background: #f6f7f9; }

  nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 60px;
    border-bottom: 1px solid #eee;
    background: #fff;
  }
  .logo { font-size: 24px; font-weight: 700; color: #1e3a5f; text-decoration: none; }
  .logo span { color: #e8590c; }
  .nav-links { display: flex; align-items: center; gap: 30px; }
  .nav-links a { text-decoration: none; font-weight: 500; color: #333; }

  .page-wrap { max-width: 900px; margin: 0 auto; padding: 40px 20px 80px; }
  .back-link { display: inline-block; margin-bottom: 20px; color: #555; text-decoration: none; font-size: 14px; }
  .back-link:hover { color: #e8590c; }

  .card {
    background: #fff;
    border-radius: 12px;
    padding: 28px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    margin-bottom: 24px;
  }
  .card h3 { font-size: 18px; margin-bottom: 16px; }

  .profile-header { display: flex; gap: 20px; align-items: center; }
  .avatar {
    width: 84px; height: 84px; border-radius: 50%;
    background: #1e3a5f; color: #fff;
    display: flex; align-items: center; justify-content: center;
    font-size: 32px; font-weight: 700; flex-shrink: 0;
  }
  .profile-header h1 { font-size: 26px; margin-bottom: 4px; }
  .profession { color: #e8590c; font-weight: 600; margin-bottom: 6px; }
  .contact { color: #777; font-size: 14px; }

  .tags { display: flex; flex-wrap: wrap; gap: 8px; }
  .tag {
    padding: 6px 14px; border-radius: 20px;
    background: #f1f1f1; font-size: 13px; font-weight: 600; color: #333;
  }
  .tag.cert { background: #e7f0fa; color: #1e3a5f; }
  .muted { color: #999; font-size: 14px; }

  .service-item {
    display: flex; justify-content: space-between; gap: 20px;
    padding: 16px 0; border-bottom: 1px solid #eee;
  }
  .service-item:last-child { border-bottom: none; }
  .service-item h4 { font-size: 16px; margin-bottom: 4px; }
  .service-category { font-size: 12px; font-weight: 600; color: #e8590c; text-transform: uppercase; margin-bottom: 6px; }
  .service-item p { font-size: 14px; color: #666; line-height: 1.4; }
  .service-price { text-align: right; flex-shrink: 0; }
  .service-price strong { font-size: 18px; display: block; }
  .service-price span { font-size: 13px; color: #777; }
</style>
</head>
<body>

  <nav>
    <a href="/" class="logo">Auto<span>Aid</span></a>
    <div class="nav-links">
      <a href="/mechanics">Find Mechanics</a>
      <a href="/customers/new">Sign Up</a>
    </div>
  </nav>

  <div class="page-wrap">
    <a href="/mechanics" class="back-link">&larr; Back to all mechanics</a>

    <div class="card profile-header">
      <div class="avatar">${(provider.name?has_content)?then(provider.name?trim[0]?upper_case, "?")}</div>
      <div>
        <h1>${provider.name!}</h1>
        <div class="profession">${provider.profession!"Mechanic"}</div>
        <div class="contact">
          ${provider.email!}<#if provider.phoneNumber?has_content> · ${provider.phoneNumber}</#if>
        </div>
      </div>
    </div>

    <div class="card">
      <h3>Specialties</h3>
      <#if provider.specialties?has_content>
        <div class="tags">
          <#list provider.specialties as sp><span class="tag">${sp}</span></#list>
        </div>
      <#else>
        <p class="muted">No specialties listed.</p>
      </#if>
    </div>

    <div class="card">
      <h3>Certifications</h3>
      <#if provider.certifications?has_content>
        <div class="tags">
          <#list provider.certifications as c><span class="tag cert">${c}</span></#list>
        </div>
      <#else>
        <p class="muted">No certifications listed.</p>
      </#if>
    </div>

    <div class="card">
      <h3>Services Offered</h3>
      <#if services?has_content>
        <#list services as s>
          <div class="service-item">
            <div>
              <div class="service-category">${s.category!}</div>
              <h4>${s.name!}</h4>
              <#if s.description?has_content><p>${s.description}</p></#if>
            </div>
            <div class="service-price">
              <#if s.price??><strong>$${s.price?string("0.00")}</strong></#if>
              <#if s.durationMinutes??><span>${s.durationMinutes} min</span></#if>
            </div>
          </div>
        </#list>
      <#else>
        <p class="muted">This mechanic hasn't published any services yet.</p>
      </#if>
    </div>
  </div>

</body>
</html>
