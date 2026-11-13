<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - My Profile</title>
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
    max-width: 900px;
    margin: 0 auto;
    padding: 40px 20px 80px;
  }

  .page-header {
    margin-bottom: 30px;
  }
  .page-header h1 {
    font-size: 26px;
    margin-bottom: 6px;
  }
  .page-header p {
    color: #777;
    font-size: 14px;
  }

  /* Profile summary card */
  .profile-summary {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    display: flex;
    align-items: center;
    gap: 24px;
    margin-bottom: 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .avatar-large {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: #10151c;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 30px;
    flex-shrink: 0;
  }
  .profile-summary h2 {
    font-size: 22px;
    margin-bottom: 4px;
  }
  .profile-summary p {
    color: #777;
    font-size: 14px;
  }
  .change-photo-btn {
    margin-left: auto;
    background: #f1f1f1;
    border: none;
    padding: 10px 18px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
    white-space: nowrap;
  }
  .change-photo-btn:hover { background: #e8590c; color: #fff; }

  /* Section cards */
  .section-card {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 24px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .section-card h3 {
    font-size: 18px;
    margin-bottom: 20px;
  }

  .form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
    margin-bottom: 18px;
  }
  .form-group label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 6px;
    color: #444;
  }
  .form-group input,
  .form-group select {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
  }
  .form-group input:focus,
  .form-group select:focus {
    outline: none;
    border-color: #e8590c;
  }

  .save-btn {
    background: #e8590c;
    color: #fff;
    border: none;
    padding: 12px 26px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
    margin-top: 8px;
  }
  .save-btn:hover { background: #d14e0a; }

  /* Vehicle list */
  .vehicle-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 0;
    border-bottom: 1px solid #eee;
  }
  .vehicle-item:last-child { border-bottom: none; }
  .vehicle-item h4 { font-size: 15px; margin-bottom: 2px; }
  .vehicle-item p { font-size: 13px; color: #777; }
  .vehicle-actions button {
    background: none;
    border: none;
    color: #e8590c;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
    margin-left: 12px;
  }
  .add-vehicle-btn {
    margin-top: 16px;
    background: #f1f1f1;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
  }
  .add-vehicle-btn:hover { background: #e8590c; color: #fff; }

  /* Danger zone */
  .danger-zone {
    border: 1px solid #f5c2a0;
    background: #fff8f3;
  }
  .danger-zone h3 { color: #b3450d; }
  .logout-btn {
    background: #10151c;
    color: #fff;
    border: none;
    padding: 12px 22px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
    margin-right: 12px;
  }
  .delete-btn {
    background: #fff;
    color: #c0392b;
    border: 1px solid #c0392b;
    padding: 12px 22px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
  }
  .danger-zone form { display: inline; }

  /* Messages */
  .success-banner {
    background: #e7f6ec;
    color: #1e6b3a;
    border: 1px solid #b7e1c4;
    border-radius: 8px;
    padding: 12px 16px;
    margin-bottom: 20px;
    font-weight: 600;
  }
  .form-errors {
    background: #fdecea;
    color: #b42318;
    border: 1px solid #f5c2c0;
    border-radius: 6px;
    padding: 12px 14px 12px 32px;
    margin-bottom: 18px;
    font-size: 14px;
  }
</style>
</head>
<body>

<#assign initials = (customer.name?has_content)?then(customer.name?trim[0]?upper_case, "?")>
  <nav>
    <a href="/" class="logo">Auto<span>Aid</span></a>
    <div class="nav-links">
      <a href="dashboard.html">Dashboard</a>
      <a href="mechanics.html">Find Mechanics</a>
      <a href="history.html">My Requests</a>
      <a href="/customers/${customer.id?c}" class="profile-badge">${initials}</a>
    </div>
  </nav>

  <div class="page-wrap">

    <#if success??>
      <div class="success-banner">${success}</div>
    </#if>

    <div class="page-header">
      <h1>My Profile</h1>
      <p>Manage your account details and vehicle information</p>
    </div>

    <div class="profile-summary">
      <div class="avatar-large">${initials}</div>
      <div>
        <h2>${customer.name!}</h2>
        <p>${customer.email!} · ${customer.phoneNumber!}</p>
      </div>
    </div>

    <div class="section-card">
      <h3>My Vehicle</h3>
      <div class="vehicle-item">
        <div>
          <h4><#if customer.vehicleYear??>${customer.vehicleYear?c} </#if>${customer.vehicleMake!"No vehicle on file"} ${customer.vehicleModel!}</h4>
          <p>
            Engine: ${customer.engineType!"—"} · Color: ${customer.vehicleColor!"—"}
          </p>
        </div>
      </div>
    </div>

    <div class="section-card">
      <h3>Edit Profile</h3>
      <form action="/customers/${customer.id?c}" method="post">
        <#if errors??>
          <ul class="form-errors">
            <#list errors as e><li>${e}</li></#list>
          </ul>
        </#if>
        <div class="form-row">
          <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" name="name" value="${customer.name!}" required>
          </div>
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" value="${customer.email!}" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phoneNumber" value="${customer.phoneNumber!}" required>
          </div>
          <div class="form-group">
            <label for="vehicleYear">Vehicle Year</label>
            <input type="number" id="vehicleYear" name="vehicleYear" value="${(customer.vehicleYear?c)!}" min="1900" max="2100">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="vehicleMake">Vehicle Make</label>
            <input type="text" id="vehicleMake" name="vehicleMake" value="${customer.vehicleMake!}" required>
          </div>
          <div class="form-group">
            <label for="vehicleModel">Vehicle Model</label>
            <input type="text" id="vehicleModel" name="vehicleModel" value="${customer.vehicleModel!}" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="engineType">Engine Type</label>
            <input type="text" id="engineType" name="engineType" value="${customer.engineType!}">
          </div>
          <div class="form-group">
            <label for="vehicleColor">Color</label>
            <input type="text" id="vehicleColor" name="vehicleColor" value="${customer.vehicleColor!}">
          </div>
        </div>
        <button type="submit" class="save-btn">Save Changes</button>
      </form>
    </div>

    <div class="section-card danger-zone">
      <h3>Account Actions</h3>
      <button class="logout-btn" onclick="location.href='/'">Log Out</button>
      <form action="/customers/${customer.id?c}/delete" method="post"
            onsubmit="return confirm('Delete this account? This cannot be undone.');">
        <button type="submit" class="delete-btn">Delete Account</button>
      </form>
    </div>

  </div>

</body>
</html>