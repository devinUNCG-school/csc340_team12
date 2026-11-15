<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Publish Service - AutoAid</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Publish New Service Offering</h1>
        <form action="/provider/services/save" method="post">
            <input type="hidden" name="providerId" value="${providerId}">
            
            <div class="form-group">
                <label for="name">Service Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>

            <div class="form-group">
                <label for="price">Price ($):</label>
                <input type="number" step="0.01" id="price" name="price" required>
            </div>

            <button type="submit" class="btn btn-primary">Publish Service</button>
        </form>
        <br>
        <a href="/provider/dashboard/${providerId}">Back to Dashboard</a>
    </div>
</body>
</html>
