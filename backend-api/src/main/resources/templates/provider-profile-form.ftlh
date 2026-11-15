<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Profile Setup - AutoAid</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Provider Profile Form</h1>
        <form action="/provider/profile/save" method="post">
            <input type="hidden" name="id" value="${provider.id!''}">
            
            <div class="form-group">
                <label for="businessName">Business Name:</label>
                <input type="text" id="businessName" name="businessName" value="${provider.businessName!''}" required>
            </div>

            <div class="form-group">
                <label for="specialty">Specialty (e.g., Diagnostics, Bodywork, Detailing):</label>
                <input type="text" id="specialty" name="specialty" value="${provider.specialty!''}" required>
            </div>

            <div class="form-group">
                <label for="certifications">Certifications:</label>
                <input type="text" id="certifications" name="certifications" value="${provider.certifications!''}">
            </div>

            <button type="submit" class="btn btn-primary">Save Profile</button>
        </form>
    </div>
</body>
</html>
