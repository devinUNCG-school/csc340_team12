<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${provider.businessName} - AutoAid Dashboard</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Provider Dashboard</h1>
        <div class="profile-card">
            <h2>${provider.businessName}</h2>
            <p><strong>Specialty:</strong> ${provider.specialty}</p>
            <p><strong>Certifications:</strong> ${provider.certifications!}</p>
            <a href="/provider/profile/form?id=${provider.id}" class="btn">Edit Profile</a>
        </div>

        <hr>

        <div class="services-section">
            <h3>Active Service Offerings</h3>
            <a href="/provider/${provider.id}/services/new" class="btn btn-primary">Publish New Service</a>
            
            <#if services?has_content>
                <table>
                    <thead>
                        <tr>
                            <th>Service Name</th>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list services as service>
                            <tr>
                                <td>${service.name}</td>
                                <td>${service.description}</td>
                                <td>$${service.price?string("0.00")}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <p>No services published yet. Click above to add your first offering.</p>
            </#if>
        </div>
    </div>
</body>
</html>
