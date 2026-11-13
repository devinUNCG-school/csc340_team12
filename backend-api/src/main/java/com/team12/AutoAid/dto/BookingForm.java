package com.team12.AutoAid.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

/**
 * What the "Book a Service" form sends. Each field name matches an input's name attribute.
 * The customer comes from the URL, and the mechanic comes from the chosen service.
 */
public class BookingForm {

    @NotNull(message = "Please choose a service.")
    private Long serviceId;

    @NotNull(message = "Please pick a date and time.")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") // the format <input type="datetime-local"> sends
    private LocalDateTime scheduledTime;

    @NotBlank(message = "Please describe what your vehicle needs.")
    @Size(max = 500, message = "Description must be 500 characters or fewer.")
    private String issueDescription;

    @NotBlank(message = "Please choose how often you want this service.")
    private String frequency = "ONE_TIME";

    public Long getServiceId() { return serviceId; }
    public void setServiceId(Long serviceId) { this.serviceId = serviceId; }

    public LocalDateTime getScheduledTime() { return scheduledTime; }
    public void setScheduledTime(LocalDateTime scheduledTime) { this.scheduledTime = scheduledTime; }

    public String getIssueDescription() { return issueDescription; }
    public void setIssueDescription(String issueDescription) { this.issueDescription = issueDescription; }

    public String getFrequency() { return frequency; }
    public void setFrequency(String frequency) { this.frequency = frequency; }
}
