# AutoAid Mechanics backend API

Spring Boot + PostgreSQL (Neon) API for AutoAid, deployed on Render with Docker.

**Live API:** https://csc340-team12.onrender.com

**Note:** The app runs on Render's free tier, which sleeps when idle. The first request can take up to a minute to respond.

## UML Class Diagram
![Class Diagram](../docs/uml-class.png)


## Endpoints

Errors: `400` for invalid input, `404` for a missing ID.

| Method | Path | Description | Use case | Success | Implemented by |
| :--- | :--- | :--- | :--- | :--- | :--- |
| POST | /api/customers | Create a customer profile | US-1 | 201 |
| GET | /api/customers | List customers | US-1 | 200 | 
| GET | /api/customers/{id} | View a customer profile | US-1 | 200 |  
| PUT | /api/customers/{id} | Update a customer profile | US-1 | 200 |
| DELETE | /api/customers/{id} | Delete a customer | US-1 | 204 |
| POST | /api/bookings | Book a service session | US-3 | 201 | 
| GET | /api/bookings | List all bookings | US-3 | 200 |   |
| GET | /api/bookings/{id} | View one booking | US-3 | 200 |
| GET | /api/customers/{customerId}/bookings | View a customer's bookings | US-3 | 200 |
| POST | /customers/{customerId}/reviews?providerId=&bookingId= | Review a booked session | US-4 | 201 | 
| GET | /customers/{customerId}/reviews | View a customer's reviews | US-4 | 200 | 
| POST | /providers | Create a provider profile | US-5 | 201 | 
| GET | /providers?specialty= | List or filter providers | US-5 | 200 |
| GET | /providers/{id} | View a provider profile | US-5 | 200 | 
| PUT | /providers/{id} | Update a provider profile | US-5 | 200 | 
| DELETE | /providers/{id} | Delete a provider | US-5 | 204 |
| GET | /providers/{providerId}/reviews | View a provider's reviews | US-7 | 200 |
| PATCH | /providers/{providerId}/reviews/{reviewId}/reply | Reply to a review | US-7 | 200 |




## Example Request Bodies

### POST /api/customers
```json
{
  "name": "Jordan Smith",
  "email": "jordan@example.com",
  "phoneNumber": "336-555-0111"
}
```

### PUT /api/customers/{id}
```json
{
  "name": "Jordan Smith",
  "email": "jordan@example.com",
  "phoneNumber": "336-555-0999"
}
```

### POST /api/bookings
```json
{
  "scheduledTime": "2026-11-05T10:30:00",
  "issueDescription": "Brakes are squeaking",
  "customer": { "id": 1 },
  "provider": { "id": 1 },
  "service": { "id": 1 }
}
```

### POST /customers/{customerId}/reviews?providerId=1&bookingId=1
```json
{
  "rating": 5,
  "comment": "Fast and friendly"
}
```

### POST /providers
```json
{
  "name": "Alex Rivera",
  "email": "alex@example.com",
  "password": "examplePassword",
  "phoneNumber": "336-555-0300",
  "profession": "Detailer",
  "specialties": ["Detailing"],
  "certifications": []
}
```

### PUT /providers/{id}
```json
{
  "name": "Alex Rivera",
  "email": "alex@example.com",
  "password": "examplePassword",
  "phoneNumber": "336-555-0999",
  "profession": "Detailer",
  "specialties": ["Detailing"],
  "certifications": []
}
```

### PATCH /providers/{providerId}/reviews/{reviewId}/reply
```json
{
  "reply": "Thanks for the feedback!"
}
```
