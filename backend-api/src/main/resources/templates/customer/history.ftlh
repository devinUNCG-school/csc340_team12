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
  }
  .new-request-btn:hover { background: #d14e0a; }

  /* Filter tabs */
  .filter-tabs {
    display: flex;
    gap: 10px;
    margin-bottom: 24px;
  }
  .filter-tabs button {
    padding: 10px 20px;
    border-radius: 20px;
    border: 1px solid #ddd;
    background: #fff;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
    color: #555;
  }
  .filter-tabs button.active {
    background: #10151c;
    color: #fff;
    border-color: #10151c;
  }

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
  .status-pill {
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    white-space: nowrap;
  }
  .status-progress { background: #fff4e8; color: #e8590c; }
  .status-completed { background: #e8f8ee; color: #1e8449; }
  .status-cancelled { background: #fdeaea; color: #c0392b; }

  .view-btn {
    background: #10151c;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
    white-space: nowrap;
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
      <div>
        <h1>My Requests</h1>
        <p>Track your current and past roadside assistance requests</p>
      </div>
      <button class="new-request-btn" onclick="location.href='request-help.html'">+ New Request</button>
    </div>

    <div class="filter-tabs">
      <button class="active" onclick="filterRequests(this)">All</button>
      <button onclick="filterRequests(this)">In Progress</button>
      <button onclick="filterRequests(this)">Completed</button>
      <button onclick="filterRequests(this)">Cancelled</button>
    </div>

    <div class="request-card">
      <div class="info">
        <h3>Battery Won't Start</h3>
        <p>Matched with Jason Reyes</p>
        <p>Requested Sep 20, 2026</p>
      </div>
      <div class="right">
        <span class="status-pill status-progress">In Progress</span>
        <button class="view-btn" onclick="location.href='request-status.html'">View Details</button>
      </div>
    </div>

    <div class="request-card">
      <div class="info">
        <h3>Brake Pads Replacement</h3>
        <p>Completed by Maria Lopez</p>
        <p>Requested Aug 14, 2026</p>
      </div>
      <div class="right">
        <span class="status-pill status-completed">Completed</span>
        <button class="view-btn" onclick="location.href='request-status.html'">View Details</button>
      </div>
    </div>

    <div class="request-card">
      <div class="info">
        <h3>Flat Tire on Highway</h3>
        <p>Completed by Marcus White</p>
        <p>Requested Jul 2, 2026</p>
      </div>
      <div class="right">
        <span class="status-pill status-completed">Completed</span>
        <button class="view-btn" onclick="location.href='request-status.html'">View Details</button>
      </div>
    </div>

    <div class="request-card">
      <div class="info">
        <h3>Check Engine Light</h3>
        <p>Cancelled by you</p>
        <p>Requested Jun 10, 2026</p>
      </div>
      <div class="right">
        <span class="status-pill status-cancelled">Cancelled</span>
        <button class="view-btn" onclick="location.href='request-status.html'">View Details</button>
      </div>
    </div>

  </div>

  <script>
    function filterRequests(btn) {
      document.querySelectorAll('.filter-tabs button').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      
    }
  </script>

</body>
</html>