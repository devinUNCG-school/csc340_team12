<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - My Requests</title>
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
    max-width: 1000px;
    margin: 0 auto;
    padding: 40px 20px 80px;
  }

  .page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    flex-wrap: wrap;
    gap: 16px;
  }
  .page-header h1 {
    font-size: 26px;
    margin-bottom: 6px;
  }
  .page-header p {
    color: #777;
    font-size: 14px;
  }
  .new-request-btn {
    background: #e8590c;
    color: #fff;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
    white-space: nowrap;
    text-decoration: none;
  }
  .new-request-btn:hover { background: #d14e0a; }

  /* Request cards */
  .request-card {
    background: #fff;
    border-radius: 12px;
    padding: 24px;
    margin-bottom: 16px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 16px;
  }
  .request-card .info h3 {
    font-size: 17px;
    margin-bottom: 6px;
  }
  .request-card .info p {
    font-size: 14px;
    color: #666;
    margin-bottom: 2px;
  }
  .request-card .right {
    display: flex;
    align-items: center;
    gap: 16px;
  }
  .request-card form { display: inline; }
  .status-pill {
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    white-space: nowrap;
  }
  .status-pending { background: #eef3fb; color: #1e3a5f; }
  .status-progress { background: #fff4e8; color: #e8590c; }
  .status-completed { background: #e8f8ee; color: #1e8449; }
  .status-cancelled { background: #fdeaea; color: #c0392b; }

  .cancel-btn {
    background: #fff;
    color: #c0392b;
    border: 1px solid #c0392b;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
    white-space: nowrap;
  }
  .freq-tag { color: #e8590c; font-weight: 600; }

  .banner { border-radius: 8px; padding: 12px 16px; margin-bottom: 20px; font-weight: 600; }
  .banner.success { background: #e7f6ec; color: #1e6b3a; border: 1px solid #b7e1c4; }
  .banner.error { background: #fdecea; color: #b42318; border: 1px solid #f5c2c0; }

  .empty-state {
    background: #fff;
    border-radius: 12px;
    padding: 40px;
    text-align: center;
    color: #777;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .empty-state a { color: #e8590c; font-weight: 600; }
</style>
</head>
<body>
<#assign initials = (customer.name?has_content)?then(customer.name?trim[0]?upper_case, "?")>

  <nav>
    <a href="/" class="logo">Auto<span>Aid</span></a>
    <div class="nav-links">
      <a href="/mechanics">Find Mechanics</a>
      <a href="/customers/${customer.id?c}/bookings">My Requests</a>
      <a href="/customers/${customer.id?c}" class="profile-badge">${initials}</a>
    </div>
  </nav>

  <div class="page-wrap">

    <#if success??><div class="banner success">${success}</div></#if>
    <#if error??><div class="banner error">${error}</div></#if>

    <div class="page-header">
      <div>
        <h1>My Requests</h1>
        <p>Your booked services and recurring checkups</p>
      </div>
      <a class="new-request-btn" href="/customers/${customer.id?c}/bookings/new">+ Book a Service</a>
    </div>

    <#if bookings?has_content>
      <#list bookings as b>
        <#assign st = (b.status!"PENDING")?upper_case>
        <div class="request-card">
          <div class="info">
            <h3>${(b.service.name)!"Service"}</h3>
            <p>with ${(b.provider.name)!"a mechanic"}<#if (b.service.price)??> · $${b.service.price?string("0.00")}</#if></p>
            <p>
              <#if b.scheduledTime??>${dateFmt.format(b.scheduledTime)}<#else>No time set</#if>
              · <span class="freq-tag">${frequencies[b.frequency!"ONE_TIME"]!"One-time service"}</span>
            </p>
            <#if b.issueDescription?has_content><p>"${b.issueDescription}"</p></#if>
          </div>
          <div class="right">
            <#if st == "COMPLETED">
              <span class="status-pill status-completed">Completed</span>
            <#elseif st == "CANCELLED">
              <span class="status-pill status-cancelled">Cancelled</span>
            <#elseif st == "PENDING">
              <span class="status-pill status-pending">Pending</span>
            <#else>
              <span class="status-pill status-progress">${st?replace("_", " ")?capitalize}</span>
            </#if>
            <#if st != "COMPLETED" && st != "CANCELLED">
              <form action="/customers/${customer.id?c}/bookings/${b.id?c}/cancel" method="post"
                    onsubmit="return confirm('Cancel this booking?');">
                <button type="submit" class="cancel-btn">Cancel</button>
              </form>
            </#if>
          </div>
        </div>
      </#list>
    <#else>
      <div class="empty-state">
        <p>You haven't booked any services yet.</p>
        <p><a href="/customers/${customer.id?c}/bookings/new">Book your first service</a></p>
      </div>
    </#if>

  </div>

</body>
</html>
