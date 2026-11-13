package com.team12.AutoAid.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team12.AutoAid.dto.BookingForm;
import com.team12.AutoAid.entity.Customer;
import com.team12.AutoAid.service.BookingService;
import com.team12.AutoAid.service.CustomerService;

import jakarta.validation.Valid;

/**
 * Customer-facing booking pages. There is no login yet, so every route is under
 * /customers/{customerId} to say whose bookings these are.
 * The REST API for bookings stays in BookingController at /api/bookings.
 */
@Controller
@RequestMapping("/customers/{customerId}/bookings")
public class BookingPageController {

    private static final DateTimeFormatter DISPLAY_FORMAT = DateTimeFormatter.ofPattern("EEE, MMM d, yyyy 'at' h:mm a");
    private static final DateTimeFormatter INPUT_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    private final BookingService bookingService;
    private final CustomerService customerService;

    public BookingPageController(BookingService bookingService, CustomerService customerService) {
        this.bookingService = bookingService;
        this.customerService = customerService;
    }

    /** My Requests: every booking this customer has made. */
    @GetMapping
    public String listBookings(@PathVariable Long customerId, Model model) {
        try {
            model.addAttribute("customer", customerService.getCustomerById(customerId));
            model.addAttribute("bookings", bookingService.getBookingsForCustomer(customerId));
        } catch (ResponseStatusException e) {
            return customerNotFound(customerId, model);
        }
        model.addAttribute("frequencies", BookingService.FREQUENCIES);
        model.addAttribute("dateFmt", DISPLAY_FORMAT);
        return "customer/history";
    }

    /** Book a Service form. ?serviceId= pre-selects a service (e.g. from a mechanic's page). */
    @GetMapping("/new")
    public String showBookingForm(@PathVariable Long customerId,
                                  @RequestParam(required = false) Long serviceId,
                                  Model model) {
        BookingForm form = new BookingForm();
        form.setServiceId(serviceId);
        return renderForm(customerId, form, null, model);
    }

    @PostMapping
    public String createBooking(@PathVariable Long customerId,
                                @Valid @ModelAttribute("bookingForm") BookingForm form,
                                BindingResult result, Model model,
                                RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    // A "binding failure" means the text couldn't be converted (e.g. a malformed date)
                    .map(e -> e.isBindingFailure() ? "Please check the " + e.getField() + " field." : e.getDefaultMessage())
                    .toList();
            return renderForm(customerId, form, errors, model);
        }
        try {
            bookingService.bookService(customerId, form.getServiceId(), form.getScheduledTime(),
                    form.getIssueDescription(), form.getFrequency());
        } catch (IllegalArgumentException e) {
            return renderForm(customerId, form, List.of(e.getMessage()), model);
        } catch (ResponseStatusException e) {
            return customerNotFound(customerId, model);
        }
        redirectAttributes.addFlashAttribute("success", "Your booking was requested! The mechanic will confirm it soon.");
        return "redirect:/customers/" + customerId + "/bookings";
    }

    @PostMapping("/{bookingId}/cancel")
    public String cancelBooking(@PathVariable Long customerId, @PathVariable Long bookingId,
                                Model model, RedirectAttributes redirectAttributes) {
        try {
            bookingService.cancelBooking(customerId, bookingId);
            redirectAttributes.addFlashAttribute("success", "Booking cancelled.");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        } catch (ResponseStatusException e) {
            model.addAttribute("message", "Booking " + bookingId + " was not found for customer " + customerId + ".");
            return "shared/error";
        }
        return "redirect:/customers/" + customerId + "/bookings";
    }

    private String renderForm(Long customerId, BookingForm form, List<String> errors, Model model) {
        Customer customer;
        try {
            customer = customerService.getCustomerById(customerId);
        } catch (ResponseStatusException e) {
            return customerNotFound(customerId, model);
        }
        model.addAttribute("customer", customer);
        model.addAttribute("bookingForm", form);
        model.addAttribute("services", bookingService.getBookableServices());
        model.addAttribute("frequencies", BookingService.FREQUENCIES);
        model.addAttribute("scheduledValue",
                form.getScheduledTime() == null ? "" : form.getScheduledTime().format(INPUT_FORMAT));
        model.addAttribute("minDateTime", LocalDateTime.now().plusHours(1).format(INPUT_FORMAT));
        if (errors != null) {
            model.addAttribute("errors", errors);
        }
        return "customer/book";
    }

    private String customerNotFound(Long customerId, Model model) {
        model.addAttribute("message", "Customer " + customerId + " was not found.");
        return "shared/error";
    }
}
