# AutoAid Mechanics backend API

# UML Class Diagram

![Class Diagram](../docs/uml-class.png)

# API Overview

**Version:** 1.0  
**Last Updated:** October 20, 2026  

**Base URL:**

- local: `http://localhost:8080/api`
- production: `https://autoaid-mechanics-api.onrender.com/api`

JSON request bodies are validated. The endpoint tables list applicable error codes: `400 Bad Request` for invalid input, `404 Not Found` for missing resources, and `409 Conflict` for duplicate records or invalid state transitions.

## Profile and discovery

| Method | Path | Purpose | Response code | Error codes | Description / Feature |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `POST` | `/api/customers` | Register a customer profile | `201 Created` | `400, 409` | Customer profile creation |
| `GET` | `/api/customers/{customerId}` | Read a customer profile | `200 OK` | `404` | Customer profile lookup |
| `PUT` | `/api/customers/{customerId}` | Update a customer profile | `200 OK` | `400, 404, 409` | Modify customer profile |
| `POST` | `/api/providers` | Register a provider/mechanic profile | `201 Created` | `400, 409` | Provider profile creation |
| `GET` | `/api/providers?specialty={specialty}` | Browse providers by specialty or certification | `200 OK` | — | Browse specialists (tune-up, bodywork, paint, etc.) |
| `GET` | `/api/providers/{providerId}` | Read a provider profile | `200 OK` | `404` | Provider profile lookup |
| `PUT` | `/api/providers/{providerId}` | Update a provider profile | `200 OK` | `400, 404, 409` | Modify provider profile |
| `DELETE` | `/api/providers/{providerId}` | Remove a provider profile | `204 No Content` | `404` | Remove provider profile |
| `GET` | `/api/services?category={serviceType}` | Browse available repair and detailing services | `200 OK` | — | Browse services (oil change, bodywork, detailing, etc.) |

### Example Customer Request

```http
POST /api/providers
Content-Type: application/json

{
  "name": "Devin Hawkins",
  "email": "devin.hawkins@example.com",
  "password": "securePassword123",
  "phoneNumber": "+1-336-555-0101",
  "accountStatus": "ACTIVE",
  "vehicleMake": "Acura",
  "vehicleModel": "TL",
  "vehicleYear": 2013,
  "vehicleNotes": "Maintained lower splash guard and ambient lighting."
}

POST /api/customers
Content-Type: application/json

{
  "name": "Za'Kwon Hall",
  "email": "zakwon.hall@example.com",
  "password": "securePassword123",
  "phoneNumber": "+1-336-555-0202",
  "profession": "Master Automotive Technician",
  "certifications": ["ASE Certified", "Collision Repair Specialist"],
  "specialties": ["Bodywork", "Paint Job", "Tune-up"]
}
