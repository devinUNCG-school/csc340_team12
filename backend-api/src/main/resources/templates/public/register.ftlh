<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Register</title>
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
  .btn-outline {
    padding: 10px 22px;
    border-radius: 6px;
    font-weight: 600;
    text-decoration: none;
    border: 1px solid #1a1a1a;
    color: #1a1a1a;
  }

  /* Register box */
  .register-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 60px 20px;
  }
  .register-card {
    background: #fff;
    width: 100%;
    max-width: 420px;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
  }
  .register-card h1 {
    font-size: 26px;
    margin-bottom: 6px;
  }
  .register-card p.subtitle {
    color: #777;
    font-size: 14px;
    margin-bottom: 30px;
  }

  .form-group {
    margin-bottom: 18px;
  }
  .form-group label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 6px;
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

  .role-toggle {
    display: flex;
    gap: 10px;
    margin-bottom: 24px;
  }
  .role-toggle button {
    flex: 1;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ddd;
    background: #fff;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
  }
  .role-toggle button.active {
    background: #10151c;
    color: #fff;
    border-color: #10151c;
  }

  .submit-btn {
    width: 100%;
    padding: 14px;
    background: #e8590c;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 8px;
  }
  .submit-btn:hover { background: #d14e0a; }

  .form-errors {
    background: #fdecea;
    color: #b42318;
    border: 1px solid #f5c2c0;
    border-radius: 6px;
    padding: 12px 14px 12px 32px;
    margin-bottom: 18px;
    font-size: 14px;
  }

  .login-link {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #555;
  }
  .login-link a {
    color: #e8590c;
    font-weight: 600;
    text-decoration: none;
  }
</style>
</head>
<body>

  <nav>
    <a href="/" class="logo">Auto<span>Aid</span></a>
    <div class="nav-links">
      <a href="login.html" class="btn-outline">Login</a>
    </div>
  </nav>

  <div class="register-wrap">
    <div class="register-card">
      <h1>Create Your Account</h1>
      <p class="subtitle">Sign up to get connected with trusted mechanics near you.</p>

      <div class="role-toggle">
        <button type="button" class="active" onclick="selectRole(this, 'customer')">I'm a Customer</button>
        <button type="button" onclick="selectRole(this, 'mechanic')">I'm a Mechanic</button>
      </div>

      <form action="/customers" method="post">
        <#if errors??>
          <ul class="form-errors">
            <#list errors as e><li>${e}</li></#list>
          </ul>
        </#if>

        <div class="form-group">
          <label for="fullname">Full Name</label>
          <input type="text" id="fullname" name="name" value="${customer.name!}" placeholder="John Doe" required>
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" value="${customer.email!}" placeholder="john@example.com" required>
        </div>

        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input type="tel" id="phone" name="phoneNumber" value="${customer.phoneNumber!}" placeholder="(555) 123-4567" required>
        </div>

        <div class="form-group">
          <label for="vehicleMake">Vehicle Make</label>
          <input type="text" id="vehicleMake" name="vehicleMake" value="${customer.vehicleMake!}" placeholder="Honda" required>
        </div>

        <div class="form-group">
          <label for="vehicleModel">Vehicle Model</label>
          <input type="text" id="vehicleModel" name="vehicleModel" value="${customer.vehicleModel!}" placeholder="Civic" required>
        </div>

        <div class="form-group">
          <label for="vehicleYear">Year</label>
          <input type="number" id="vehicleYear" name="vehicleYear" value="${(customer.vehicleYear?c)!}" placeholder="2018" min="1900" max="2100">
        </div>

        <div class="form-group">
          <label for="engineType">Engine Type</label>
          <input type="text" id="engineType" name="engineType" value="${customer.engineType!}" placeholder="V6, Hybrid, Electric...">
        </div>

        <div class="form-group">
          <label for="vehicleColor">Color</label>
          <input type="text" id="vehicleColor" name="vehicleColor" value="${customer.vehicleColor!}" placeholder="Silver">
        </div>

        <button type="submit" class="submit-btn">Create Account</button>
      </form>

      <p class="login-link">Already have an account? <a href="login.html">Log in</a></p>
    </div>
  </div>

  <script>
    function selectRole(btn, role) {
      document.querySelectorAll('.role-toggle button').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    }
  </script>

</body>
</html>