<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${service.name! "Service Details"} | AutoAid Mechanics</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>AutoAid Mechanics</h1>
            <a href="/services">&larr; Back to Services</a>
        </header>

        <main class="card">
            <h2>${service.name! "Unnamed Service"}</h2>
            <p class="description"><strong>Description:</strong> ${service.description! "No description provided."}</p>
            <p class="price"><strong>Price:</strong> $${service.price?string("0.00")! "0.00"}</p>
            <p class="duration"><strong>Estimated Time:</strong> ${service.estimatedHours! 1} hours</p>
        </main>
    </div>
</body>
</html>
