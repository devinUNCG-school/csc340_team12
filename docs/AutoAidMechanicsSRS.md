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
### 2.2 Provider (Trainer) Stories

- **US-5 - Create and update trainer profile**

  _Story:_ As a trainer, I want to create and update my profile so that I can attract clients.

  _Acceptance:_
  ```gherkin
  Scenario: Create and update trainer profile
    Given I do not have a profile
    When I provide my details and submit the form
    Then my profile should be created
    And the profile should be visible to customers
  ```

- **US-6 - Define services and pricing**

  _Story:_ As a trainer, I want to define my services and pricing so that customers understand my offerings.

  _Acceptance:_
  ```gherkin
  Scenario: Define services and pricing
    Given I am logged in as a trainer
    When I add my services and set pricing
    Then the services should be saved and visible to customers
  ```

- **US-7 - Respond to reviews**

  _Story:_ As a trainer, I want to respond to reviews so that I can engage with clients.

  _Acceptance:_
  ```gherkin
  Scenario: Respond to reviews
    Given I am logged in as a trainer
    When I receive a review for one of my sessions
    Then I should be able to submit a response to the review
  ```

- **US-8 - View customer statistics**

  _Story:_ As a trainer, I want to view customer statistics so that I can tailor my coaching.

  _Acceptance:_
  ```gherkin
  Scenario: View customer statistics
    Given I am logged in as a trainer
    When I access the dashboard
    Then I should see relevant data about my customers' progress and engagement
  ```

---

## 3. Non-Functional Requirements
- **Performance:** 95% of search results should be returned in less than 2 seconds under typical load.
- **Availability/Reliability:** The system should be available 99.5% of the time, with planned maintenance windows communicated in advance.
- **Security/Privacy:** The system must implement secure authentication and authorization mechanisms. All sensitive data (payment info, location, vehicle details) should be encrypted in transit and at rest.
- **Usability:** New users should be able to complete registration and book a service session within 5 minutes without external assistance.

---

## 4. Assumptions, Constraints, and Policies
- Modern browsers/mobile OS (latest Chrome/Firefox/Edge/Safari, iOS/Android) and stable connectivity are assumed.
- Providers are responsible for verifying their own certifications.

---

## 5. Milestones (course-aligned)
- **M1 Requirements** — this file and related stories opened as issues.
- **M2 High-fidelity prototype** — core customer and provider UI flows are fully interactive.
- **M3 Design** — architecture, schema, and API outline.
- **M4 Backend API** — key endpoints and tests.
- **M5 Increment** — at least 2 use cases end-to-end.
- **M6 Final** — complete system and documentation.

---

## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.
- Major changes should update this SRS.
