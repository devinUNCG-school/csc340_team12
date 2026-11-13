<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AutoAid - Book a Service</title>
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
  .profile-badge {
    width: 38px; height: 38px; border-radius: 50%;
    background: #10151c; display: flex; align-items: center; justify-content: center;
    font-weight: 600; font-size: 14px;
  }
  .nav-links a.profile-badge { color: #fff; }

  .page-wrap { max-width: 640px; margin: 0 auto; padding: 40px 20px 80px; }
  .back-link { display: inline-block; margin-bottom: 20px; color: #555; text-decoration: none; font-size: 14px; }
  .back-link:hover { color: #e8590c; }

  .card {
    background: #fff;
    border-radius: 12px;
    padding: 36px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
  }
  .card h1 { font-size: 26px; margin-bottom: 6px; }
  .subtitle { color: #777; font-size: 14px; margin-bottom: 28px; }

  .form-group { margin-bottom: 18px; }
  .form-group label { display: block; font-size: 14px; font-weight: 600; margin-bottom: 6px; }
  .form-group input,
  .form-group select,
  .form-group textarea {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
    background: #fff;
  }
  .form-group textarea { min-height: 100px; resize: vertical; }
  .form-group input:focus,
  .form-group select:focus,
  .form-group textarea:focus { outline: none; border-color: #e8590c; }
  .hint { font-size: 12px; color: #888; margin-top: 4px; }

  .frequency-options { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
  .frequency-options label {
    display: flex; align-items: center; gap: 8px;
    border: 1px solid #ddd; border-radius: 6px; padding: 12px;
    font-weight: 500; cursor: pointer;
  }
  .frequency-options input { width: auto; }

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
  .empty-state { color: #777; text-align: center; }
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
    <a href="/customers/${customer.id?c}/bookings" class="back-link">&larr; Back to My Requests</a>

    <div class="card">
      <h1>Book a Service</h1>
      <p class="subtitle">Choose a service, pick a time, and tell the mechanic what your vehicle needs.</p>

      <#if services?has_content>
      <form action="/customers/${customer.id?c}/bookings" method="post">
        <#if errors??>
          <ul class="form-errors">
            <#list errors as e><li>${e}</li></#list>
          </ul>
        </#if>

        <div class="form-group">
          <label for="serviceId">Service</label>
          <select id="serviceId" name="serviceId" required>
            <option value="">Choose a service...</option>
            <#list services as s>
              <option value="${s.id?c}" <#if bookingForm.serviceId?? && bookingForm.serviceId == s.id>selected</#if>>
                ${s.name!} — ${(s.provider.name)!"Mechanic"}<#if s.price??> ($${s.price?string("0.00")})</#if>
              </option>
            </#list>
          </select>
        </div>

        <div class="form-group">
          <label for="scheduledTime">Date &amp; Time</label>
          <input type="datetime-local" id="scheduledTime" name="scheduledTime"
                 value="${scheduledValue}" min="${minDateTime}" required>
        </div>

        <div class="form-group">
          <label>How often?</label>
          <div class="frequency-options">
            <#list frequencies as code, label>
              <label>
                <input type="radio" name="frequency" value="${code}"
                       <#if (bookingForm.frequency!"ONE_TIME") == code>checked</#if>>
                ${label}
              </label>
            </#list>
          </div>
          <p class="hint">Pick a recurring option to schedule a regular checkup.</p>
        </div>

        <div class="form-group">
          <label for="issueDescription">What does your vehicle need?</label>
          <textarea id="issueDescription" name="issueDescription" maxlength="500" required
                    placeholder="e.g. Oil change and a quick look at a squeaky brake">${bookingForm.issueDescription!}</textarea>
          <p class="hint">Your vehicle on file: <#if customer.vehicleYear??>${customer.vehicleYear?c} </#if>${customer.vehicleMake!} ${customer.vehicleModel!}</p>
        </div>

        <button type="submit" class="submit-btn">Request Booking</button>
      </form>
      <#else>
        <div class="empty-state">
          <p>No services are available to book right now.</p>
          <p><a href="/mechanics">Browse mechanics</a></p>
        </div>
      </#if>
    </div>
  </div>

</body>
</html>
