<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Mechanic Dashboard</title>
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
    color: #333;
    font-weight: 500;
  }
  .profile-badge {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: #e8590c;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 14px;
  }

  .page-wrap {
    max-width: 1100px;
    margin: 0 auto;
    padding: 40px 20px 80px;
  }

  /* Welcome banner */
  .welcome-banner {
    background: #10151c;
    color: #fff;
    border-radius: 14px;
    padding: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 40px;
  }
  .welcome-banner h1 {
    font-size: 28px;
    margin-bottom: 8px;
  }
  .welcome-banner p {
    color: #cfd6dd;
    font-size: 15px;
  }

  /* Availability Toggle */
  .status-toggle-wrap {
    display: flex;
    align-items: center;
    gap: 12px;
    background: rgba(255,255,255,0.08);
    padding: 10px 16px;
    border-radius: 8px;
  }
  .status-toggle-wrap span {
    font-size: 14px;
    font-weight: 600;
  }
  .switch {
    position: relative;
    display: inline-block;
    width: 48px;
    height: 24px;
  }
  .switch input { opacity: 0; width: 0; height: 0; }
  .slider {
    position: absolute; cursor: pointer;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: #555;
    transition: .3s;
    border-radius: 24px;
  }
  .slider:before {
    position: absolute; content: "";
    height: 18px; width: 18px;
    left: 3px; bottom: 3px;
    background-color: white;
    transition: .3s;
    border-radius: 50%;
  }
  input:checked + .slider { background-color: #e8590c; }
  input:checked + .slider:before { transform: translateX(24px); }

  /* Stat cards */
  .stats-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 40px;
  }
  .stat-card {
    background: #fff;
    border-radius: 10px;
    padding: 24px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .stat-card .stat-number {
    font-size: 28px;
    font-weight: 700;
    color: #e8590c;
  }
  .stat-card .stat-label {
    font-size: 14px;
    color: #777;
    margin-top: 4px;
  }

  .section-title {
    font-size: 20px;
    margin-bottom: 18px;
  }

  /* Active Job card */
  .active-request {
    background: #fff;
    border-radius: 12px;
    padding: 24px;
    margin-bottom: 40px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 16px;
    border-left: 4px solid #e8590c;
  }
  .active-request .info h3 {
    font-size: 17px;
    margin-bottom: 6px;
  }
  .active-request .info p {
    font-size: 14px;
    color: #666;
  }
  .status-pill {
    background: #fff4e8;
    color: #e8590c;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
  }
  .view-btn {
    background: #10151c;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
  }

  /* Incoming Request Cards */
  .incoming-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
  }
  .incoming-card {
    background: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .incoming-card h4 { font-size: 16px; margin-bottom: 6px; }
  .incoming-card .client-info { font-size: 13px; color: #777; margin-bottom: 4px; }
  .incoming-card .distance { font-size: 13px; font-weight: 600; color: #1e3a5f; margin-bottom: 16px; }
  .action-buttons {
    display: flex;
    gap: 10px;
  }
  .btn-accept {
    flex: 1;
    background: #e8590c;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    font-size: 13px;
  }
  .btn-accept:hover { background: #d14e0a; }
  .btn-decline {
    flex: 1;
    background: #f1f1f1;
    color: #333;
    border: none;
    padding: 10px;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    font-size: 13px;
  }
  .btn-decline:hover { background: #e2e2e2; }
</style>
</head>
<body>

  <nav>
    <a href="../index.html" class="logo">Auto<span>Aid</span> <span style="font-size: 14px; color: #777; font-weight: 400;">(Mechanic Portal)</span></a>
    <div class="nav-links">
      <a href="dashboard.html">Dashboard</a>
      <a href="jobs.html">Job Board</a>
      <a href="earnings.html">Earnings</a>
      <div class="profile-badge">JR</div>
    </div>
  </nav>

  <div class="page-wrap">

    <div class="welcome-banner">
      <div>
        <h1>Welcome back, Jason</h1>
        <p>Review active service dispatches, accept incoming requests, and manage availability.</p>
      </div>
      <div class="status-toggle-wrap">
        <span>Available for Dispatches</span>
        <label class="switch">
          <input type="checkbox" checked>
          <span class="slider"></span>
        </label>
      </div>
    </div>

    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-number">4.9 / 5.0</div>
        <div class="stat-label">Your Rating (52 reviews)</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">$1,280</div>
        <div class="stat-label">This Week's Earnings</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">14</div>
        <div class="stat-label">Completed Jobs This Month</div>
      </div>
    </div>

    <h2 class="section-title">Active Job in Progress</h2>
    <div class="active-request">
      <div class="info">
        <h3>Battery Won't Start — Customer: John Doe</h3>
        <p>Matched for roadside service · Dispatched Sep 20, 2026</p>
      </div>
      <span class="status-pill">En Route / Working</span>
      <button class="view-btn" onclick="location.href='job-details.html'">Manage Job</button>
    </div>

    <h2 class="section-title">Incoming Requests Nearby</h2>
    <div class="incoming-grid">
      <div class="incoming-card">
        <h4>Engine Diagnostics & Check Engine Light</h4>
        <div class="client-info">Customer: Sarah Miller · 2018 Honda Civic</div>
        <div class="distance">📍 2.4 miles away</div>
        <div class="action-buttons">
          <button class="btn-accept" onclick="alert('Job accepted!')">Accept</button>
          <button class="btn-decline" onclick="alert('Job declined.')">Decline</button>
        </div>
      </div>
      <div class="incoming-card">
        <h4>Brake Pad Replacement & Inspection</h4>
        <div class="client-info">Customer: Marcus Vance · 2020 Toyota Camry</div>
        <div class="distance">📍 4.1 miles away</div>
        <div class="action-buttons">
          <button class="btn-accept" onclick="alert('Job accepted!')">Accept</button>
          <button class="btn-decline" onclick="alert('Job declined.')">Decline</button>
        </div>
      </div>
    </div>

  </div>

</body>
</html>
