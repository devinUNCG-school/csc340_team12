package com.team12.AutoAid.service;

import com.team12.AutoAid.repository.BookingRepository;
import com.team12.AutoAid.repository.CustomerRepository;
import com.team12.AutoAid.repository.ReviewRepository;
import com.team12.AutoAid.entity.Customer;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class CustomerService {
    
    private final CustomerRepository customerRepository;
    private final BookingRepository bookingRepository;
    private final ReviewRepository reviewRepository;

    public CustomerService(CustomerRepository customerRepository,
                           BookingRepository bookingRepository,
                           ReviewRepository reviewRepository) {
        this.customerRepository = customerRepository;
        this.bookingRepository = bookingRepository;
        this.reviewRepository = reviewRepository;
    }

    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found"));
    }

    public Customer createCustomer(Customer customer) {
    customer.setId(null);
    return customerRepository.save(customer);
}

    public Customer updateCustomer(Long id, Customer updatedCustomer) {
        Customer existingCustomer = getCustomerById(id);
        existingCustomer.setName(updatedCustomer.getName());
        existingCustomer.setEmail(updatedCustomer.getEmail());
        existingCustomer.setPhoneNumber(updatedCustomer.getPhoneNumber());
        existingCustomer.setVehicleMake(updatedCustomer.getVehicleMake());
        existingCustomer.setVehicleModel(updatedCustomer.getVehicleModel());
        existingCustomer.setVehicleYear(updatedCustomer.getVehicleYear());
        existingCustomer.setEngineType(updatedCustomer.getEngineType());
        existingCustomer.setVehicleColor(updatedCustomer.getVehicleColor());
        return customerRepository.save(existingCustomer);
    }

    /**
     * Deleting an account also removes that customer's reviews and bookings.
     * The database won't delete a customer while other rows still point to it,
     * so the children go first: reviews (they point to bookings), then bookings.
     */
    @Transactional
    public void deleteCustomer(Long id) {
        Customer existingCustomer = getCustomerById(id);
        reviewRepository.deleteAll(reviewRepository.findByCustomerIdOrderByCreatedAtDesc(id));
        bookingRepository.deleteAll(bookingRepository.findByCustomerId(id));
        customerRepository.delete(existingCustomer);
    }
}