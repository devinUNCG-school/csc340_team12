package com.team12.AutoAid.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.team12.AutoAid.entity.Booking;
import com.team12.AutoAid.service.BookingService;

import jakarta.validation.Valid;

@RestController
public class BookingController {

    private final BookingService bookingService;

    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("/api/bookings")
    public List<Booking> getAllBookings() {
        return bookingService.getAllBookings();
    }

    @GetMapping("/api/bookings/{id}")
    public Booking getBookingById(@PathVariable Long id) {
        return bookingService.getBookingById(id);
    }

    @PostMapping("/api/bookings")
    @ResponseStatus(HttpStatus.CREATED)
    public Booking createBooking(@Valid @RequestBody Booking booking) {
        return bookingService.createBooking(booking);
    }

    @GetMapping("/api/customers/{customerId}/bookings")
    public List<Booking> getBookingsByCustomer(@PathVariable Long customerId) {
        return bookingService.getBookingsByCustomer(customerId);
    }
}