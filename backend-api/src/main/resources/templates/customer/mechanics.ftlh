<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Find Mechanics</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Arial, sans-serif; }
  body { color: #1a1a1a; background: #f6f7f9; }

  /* Navbar */
  nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 60px;
    border-bottom: 1px solid #eee;
    background: #fff;
  }
  .logo {
    font-size: 24px;
    font-weight: 700;
    color: #1e3a5f;
    text-decoration: none;
  }
  .logo span { color: #e8590c; }
  .nav-links {
    display: flex;
    align-items: center;
    gap: 30px;
  }
  .nav-links a {
    text-decoration: none;
    font-weight: 500;
    color: #333;
  }
  .profile-badge {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: #10151c;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 14px;
  }
  .nav-links a.profile-badge {
    color: #fff;
  }

  .page-wrap {
    max-width: 1100px;
    margin: 0 auto;
    padding: 40px 20px 80px;
  }

  .page-header {
    margin-bottom: 24px;
  }
  .page-header h1 {
    font-size: 26px;
    margin-bottom: 6px;
  }
  .page-header p {
    color: #777;
    font-size: 14px;
  }

  /* Search + filter bar */
  .search-bar {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    display: flex;
    gap: 14px;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }
  .search-bar input,
  .search-bar select {
    padding: 12px 14px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
  }
  .search-bar input[type="text"] {
    flex: 2;
    min-width: 200px;
  }
  .search-bar select {
    flex: 1;
    min-width: 160px;
  }
  .search-bar button {
    background: #e8590c;
    color: #fff;
    border: none;
    padding: 12px 26px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
  }
  .search-bar button:hover { background: #d14e0a; }

  /* Specialty filter chips */
  .filter-chips {
    display: flex;
    gap: 10px;
    margin-bottom: 30px;
    flex-wrap: wrap;
  }
  .filter-chips button {
    padding: 9px 18px;
    border-radius: 20px;
    border: 1px solid #ddd;
    background: #fff;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
    color: #555;
  }
  .filter-chips button.active {
    background: #10151c;
    color: #fff;
    border-color: #10151c;
  }

  .results-count {
    font-size: 14px;
    color: #777;
    margin-bottom: 16px;
  }

  /* Mechanic list cards */
  .mechanic-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 20px;
  }
  .mechanic-card {
    background: #fff;
    border-radius: 12px;
    padding: 24px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    display: flex;
    gap: 16px;
  }
  .mechanic-card img {
    width: 64px;
    height: 64px;
    border-radius: 50%;
    object-fit: cover;
    flex-shrink: 0;
  }
  .mechanic-card .details { flex: 1; }
  .mechanic-card h4 { font-size: 17px; margin-bottom: 2px; }
  .mechanic-card .specialty { font-size: 13px; color: #e8590c; font-weight: 600; margin-bottom: 6px; }
  .mechanic-card .rating { font-size: 13px; color: #555; margin-bottom: 8px; }
  .mechanic-card .desc { font-size: 13px; color: #777; margin-bottom: 14px; line-height: 1.4; }
  .mechanic-card .card-actions {
    display: flex;
    gap: 10px;
  }
  .mechanic-card .card-actions button {
    flex: 1;
    padding: 10px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
    border: none;
  }
  .btn-view {
    background: #f1f1f1;
    color: #1a1a1a;
  }
  .btn-view:hover { background: #e2e2e2; }
  .btn-request {
    background: #e8590c;
    color: #fff;
  }
  .btn-request:hover { background: #d14e0a; }

  .availability {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 12px;
    color: #1e8449;
    font-weight: 600;
    margin-bottom: 8px;
  }
  .availability .dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #1e8449;
  }
  .availability.inactive { color: #999; }
  .availability.inactive .dot { background: #ccc; }

  .avatar {
    width: 64px;
    height: 64px;
    border-radius: 50%;
    background: #1e3a5f;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    font-weight: 700;
    flex-shrink: 0;
  }
  .mechanic-card .card-actions a {
    flex: 1;
    padding: 10px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 13px;
    text-align: center;
    text-decoration: none;
  }
  .clear-link {
    align-self: center;
    font-size: 14px;
    color: #555;
  }
  .empty-state {
    background: #fff;
    border-radius: 12px;
    padding: 40px;
    text-align: center;
    color: #777;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
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

    <div class="page-header">
      <h1>Find a Mechanic</h1>
      <p>Browse certified mechanics and the services they offer</p>
    </div>

    <form class="search-bar" action="/mechanics" method="get">
      <input type="text" name="name" value="${name}" placeholder="Search by name or issue (e.g. brakes, battery)">
      <select name="specialty">
        <option value="">All Specialties</option>
        <#list specialties as sp>
          <option value="${sp}" <#if sp == specialty>selected</#if>>${sp}</option>
        </#list>
      </select>
      <button type="submit">Search</button>
      <#if name?has_content || specialty?has_content>
        <a href="/mechanics" class="clear-link">Clear</a>
      </#if>
    </form>

    <p class="results-count">
      Showing ${providers?size} mechanic<#if providers?size != 1>s</#if>
      <#if specialty?has_content> in ${specialty}</#if>
      <#if name?has_content> matching "${name}"</#if>
    </p>

    <#if providers?has_content>
    <div class="mechanic-grid">
      <#list providers as p>
      <div class="mechanic-card">
        <div class="avatar">${(p.name?has_content)?then(p.name?trim[0]?upper_case, "?")}</div>
        <div class="details">
          <#if (p.accountStatus!"ACTIVE") == "ACTIVE">
            <div class="availability"><span class="dot"></span>Accepting Customers</div>
          <#else>
            <div class="availability inactive"><span class="dot"></span>Unavailable</div>
          </#if>
          <h4>${p.name!}</h4>
          <div class="specialty">
            <#if p.specialties?has_content>${p.specialties?join(" · ")}<#else>${p.profession!"General Mechanic"}</#if>
          </div>
          <#if p.profession?has_content><div class="rating">${p.profession}</div></#if>
          <p class="desc">
            <#if p.certifications?has_content>Certified: ${p.certifications?join(", ")}<#else>No certifications listed yet.</#if>
          </p>
          <div class="card-actions">
            <a class="btn-view" href="/mechanics/${p.id?c}">View Profile &amp; Services</a>
          </div>
        </div>
      </div>
      </#list>
    </div>
    <#else>
      <div class="empty-state">
        <p>No mechanics match your search.</p>
        <p><a href="/mechanics">Show all mechanics</a></p>
      </div>
    </#if>


  </div>


</body>
</html>