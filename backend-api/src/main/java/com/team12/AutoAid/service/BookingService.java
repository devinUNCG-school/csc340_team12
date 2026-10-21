package com.team12.AutoAid.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import com.team12.AutoAid.entity.Booking;
import com.team12.AutoAid.entity.Customer;
import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.entity.Service;
import com.team12.AutoAid.repository.BookingRepository;
import com.team12.AutoAid.repository.CustomerRepository;
import com.team12.AutoAid.repository.ProviderRepository;
import com.team12.AutoAid.repository.ServiceRepository;

@org.springframework.stereotype.Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final CustomerRepository customerRepository;
    private final ProviderRepository providerRepository;
    private final ServiceRepository serviceRepository;

    public BookingService(BookingRepository bookingRepository,
                          CustomerRepository customerRepository,
                          ProviderRepository providerRepository,
                          ServiceRepository serviceRepository) {
        this.bookingRepository = bookingRepository;
        this.customerRepository = customerRepository;
        this.providerRepository = providerRepository;
        this.serviceRepository = serviceRepository;
    }

    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Booking not found"));
    }

    public List<Booking> getBookingsByCustomer(Long customerId) {
        if (!customerRepository.existsById(customerId)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found");
        }
        return bookingRepository.findByCustomerId(customerId);
    }

    public Booking createBooking(Booking booking) {
        if (booking.getCustomer() == null || booking.getProvider() == null || booking.getService() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    "customer, provider, and service are required");
        }

        Customer customer = customerRepository.findById(booking.getCustomer().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found"));
        Provider provider = providerRepository.findById(booking.getProvider().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Provider not found"));
        Service service = serviceRepository.findById(booking.getService().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Service not found"));

        booking.setId(null);
        booking.setCustomer(customer);
        booking.setProvider(provider);
        booking.setService(service);
        booking.setStatus("PENDING");
        return bookingRepository.save(booking);
    }
}