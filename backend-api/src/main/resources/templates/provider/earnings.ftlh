<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Earnings</title>
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
  .payout-btn {
    background: #10151c;
    color: #fff;
    border: none;
    padding: 12px 22px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
  }

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

  /* Weekly breakdown bar chart (CSS only) */
  .chart-card {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 40px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .bar-chart {
    display: flex;
    align-items: flex-end;
    gap: 16px;
    height: 180px;
    margin-top: 20px;
  }
  .bar-group {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-end;
    height: 100%;
  }
  .bar {
    width: 100%;
    max-width: 44px;
    background: #e8590c;
    border-radius: 6px 6px 0 0;
  }
  .bar-label {
    margin-top: 10px;
    font-size: 12px;
    color: #777;
    font-weight: 600;
  }
  .bar-amount {
    font-size: 11px;
    color: #444;
    margin-bottom: 6px;
    font-weight: 600;
  }

  /* Payout history table */
  .payout-table {
    background: #fff;
    border-radius: 12px;
    padding: 10px 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  .payout-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 0;
    border-bottom: 1px solid #eee;
  }
  .payout-row:last-child { border-bottom: none; }
  .payout-row .job-name {
    font-size: 15px;
    font-weight: 600;
  }
  .payout-row .job-date {
    font-size: 13px;
    color: #777;
  }
  .payout-row .amount {
    font-size: 16px;
    font-weight: 700;
    color: #1e8449;
  }
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

    <div class="page-header">
      <div>
        <h1>Earnings</h1>
        <p>Track your income and payout history</p>
      </div>
      <button class="payout-btn" onclick="alert('Payout requested!')">Request Payout</button>
    </div>

    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-number">$1,280</div>
        <div class="stat-label">This Week</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">$4,960</div>
        <div class="stat-label">This Month</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">$210</div>
        <div class="stat-label">Available for Payout</div>
      </div>
    </div>

    <h2 class="section-title">Weekly Breakdown</h2>
    <div class="chart-card">
      <div class="bar-chart">
        <div class="bar-group">
          <div class="bar-amount">$120</div>
          <div class="bar" style="height: 40%;"></div>
          <div class="bar-label">Mon</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$210</div>
          <div class="bar" style="height: 70%;"></div>
          <div class="bar-label">Tue</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$95</div>
          <div class="bar" style="height: 32%;"></div>
          <div class="bar-label">Wed</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$260</div>
          <div class="bar" style="height: 87%;"></div>
          <div class="bar-label">Thu</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$300</div>
          <div class="bar" style="height: 100%;"></div>
          <div class="bar-label">Fri</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$180</div>
          <div class="bar" style="height: 60%;"></div>
          <div class="bar-label">Sat</div>
        </div>
        <div class="bar-group">
          <div class="bar-amount">$115</div>
          <div class="bar" style="height: 38%;"></div>
          <div class="bar-label">Sun</div>
        </div>
      </div>
    </div>

    <h2 class="section-title">Payout History</h2>
    <div class="payout-table">
      <div class="payout-row">
        <div>
          <div class="job-name">Alternator Replacement — Kevin Brooks</div>
          <div class="job-date">Paid out Sep 12, 2026</div>
        </div>
        <div class="amount">+$185</div>
      </div>
      <div class="payout-row">
        <div>
          <div class="job-name">Flat Tire Roadside Change — Priya Anand</div>
          <div class="job-date">Paid out Sep 18, 2026</div>
        </div>
        <div class="amount">+$75</div>
      </div>
      <div class="payout-row">
        <div>
          <div class="job-name">Brake Pad Replacement — Marcus Vance</div>
          <div class="job-date">Paid out Sep 9, 2026</div>
        </div>
        <div class="amount">+$220</div>
      </div>
      <div class="payout-row">
        <div>
          <div class="job-name">Weekly Payout to Bank Account</div>
          <div class="job-date">Sep 15, 2026</div>
        </div>
        <div class="amount">+$980</div>
      </div>
    </div>

  </div>

</body>
</html>