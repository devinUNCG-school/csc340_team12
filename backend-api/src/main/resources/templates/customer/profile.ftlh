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
</style>
</head>
<body>

  <nav>
    <a href="../index.html" class="logo">Auto<span>Aid</span></a>
    <div class="nav-links">
      <a href="dashboard.html">Dashboard</a>
      <a href="mechanics.html">Find Mechanics</a>
      <a href="history.html">My Requests</a>
      <a href="profile.html" class="profile-badge">JD</a>
    </div>
  </nav>

  <div class="page-wrap">

    <div class="page-header">
      <h1>My Profile</h1>
      <p>Manage your account details and vehicle information</p>
    </div>

    <div class="profile-summary">
      <div class="avatar-large">JD</div>
      <div>
        <h2>John Doe</h2>
        <p>john.doe@email.com · Customer since Jan 2026</p>
      </div>
      <button class="change-photo-btn">Change Photo</button>
    </div>

    <div class="section-card">
      <h3>Account Information</h3>
      <form onsubmit="return false;">
        <div class="form-row">
          <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" value="John Doe">
          </div>
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" value="john.doe@email.com">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" value="(555) 123-4567">
          </div>
          <div class="form-group">
            <label for="address">Home Address</label>
            <input type="text" id="address" value="123 Main St, Greensboro, NC">
          </div>
        </div>
        <button type="submit" class="save-btn">Save Changes</button>
      </form>
    </div>

    <div class="section-card">
      <h3>My Vehicles</h3>

      <div class="vehicle-item">
        <div>
          <h4>2017 Cadillac CTS-V</h4>
          <p>License Plate: NC-4821 · Black</p>
        </div>
        <div class="vehicle-actions">
          <button>Edit</button>
          <button>Remove</button>
        </div>
      </div>

      <div class="vehicle-item">
        <div>
          <h4>2021 Ford F-150</h4>
          <p>License Plate: NC-9012 · Silver</p>
        </div>
        <div class="vehicle-actions">
          <button>Edit</button>
          <button>Remove</button>
        </div>
      </div>

      <button class="add-vehicle-btn">+ Add Vehicle</button>
    </div>

    <div class="section-card danger-zone">
      <h3>Account Actions</h3>
      <button class="logout-btn" onclick="location.href='../login.html'">Log Out</button>
      <button class="delete-btn">Delete Account</button>
    </div>

  </div>

</body>
</html>