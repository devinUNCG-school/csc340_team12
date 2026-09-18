# Requirements – AutoAid

**Project Name:** AutoAid \
**Team:** Devin Hawkins - Provider, Za'kwon Hall - Customer \
**Course:** CSC 340\
**Version:** 1.0\
**Date:** 2026-09-17

---

## 1. Overview
**Vision.** AutoAid is a mobile app that delivers on-site mobile mechanics and detailing services to drivers whenever they need them. The system supports customers seeking on-site vehicle maintenance, repairs, or detailing services, as well as providers (mobile mechanics and detailers) who want to offer tailored automotive services.

**Glossary:** Terms used in the project
- **Provider:** A professional mobile mechanic or detailer who offers and performs automotive services.
- **Customer:** A driver seeking on-site vehicle maintenance, repairs, or detailing services.
- **Profile:** A collection of information about a user, including personal details and account type.
- **Parts:** The replacement components or materials required to service a vehicle issue.
- **Booking:** The scheduled arrangement connecting a customer's car issue request with a service provider.

**Primary Users and Roles:**
- **Customer** - Request and manage on-site car maintenance or repair services quickly when vehicle issues occur.
- **Provider** — Receive, manage, and fulfill car service requests for drivers on the go.
- **SysAdmin** — Maintain platform quality, security, and user account integrity.

**Scope (this semester):**
- Profiles
- Search Services
- Booking
- Parts
- Reviews

**Out of scope (deferred):**
- Availability, portfolios, and profession-specific credentials
- Granular classifications of work types, specialized parts, and detailing packages
- Advanced time/location scheduling, work hours, and detailed needed parts management
- Variety in expertise tracking, 1–5 star ratings, and personalized recommendations

---

## 2. Functional Requirements (User Stories)

### 2.1 Customer Stories
- **US-1 - Create a customer profile**

  _Story:_ As a customer, I want to create a profile with my vehicle information so that providers know what they're working on.

  _Acceptance:_
  ```gherkin
  Scenario: Register with valid credentials
   Given I am not registered
   When I provide my details and vehicle information
   Then my profile should be created
   And I can view my profile
  ```

- **US-2 - Search for nearby providers**

  _Story:_ As a customer, I want to search for providers by service type and location so that I can find help quickly.

  _Acceptance:_
  ```gherkin
  Scenario: Search for a provider
   Given I am logged in as a customer
   When I select a service type and my location
   Then I should see a list of matching nearby providers
  ```

- **US-3 - Book a service session**

  _Story:_ As a customer, I want to book a service session with a provider so that my car issue gets resolved.

  _Acceptance:_
  ```gherkin
  Scenario: Book a service session
   Given I am logged in as a customer
   When I select a provider and choose an available time slot
   Then I should receive a confirmation of the booking
   And I can view it on my dashboard
  ```

- **US-4 - Write a review after a session**

  _Story:_ As a customer, I want to write a review after a session so that other customers can benefit from my experience.

  _Acceptance:_
  ```gherkin
  Scenario: Submit a review
   Given I have completed a service session with a provider
   When I submit a review for that session
   Then the review should be saved and visible to other customers
  ```

