package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Review;
import com.team12.AutoAid.repository.CustomerRepository;
import com.team12.AutoAid.repository.ProviderRepository;
import com.team12.AutoAid.repository.ReviewRepository;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;
import com.team12.AutoAid.repository.BookingRepository;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final CustomerRepository customerRepository;
    private final ProviderRepository providerRepository;
    private final BookingRepository bookingRepository;

    public ReviewService(ReviewRepository reviewRepository,
                     CustomerRepository customerRepository,
                     ProviderRepository providerRepository,
                     BookingRepository bookingRepository) {
    this.reviewRepository = reviewRepository;
    this.customerRepository = customerRepository;
    this.providerRepository = providerRepository;
    this.bookingRepository = bookingRepository;
}


    public Review createReview(Long customerId, Long providerId, Long bookingId, Review review) {
        var customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found"));
        var provider = providerRepository.findById(providerId)
                .orElseThrow(() -> new IllegalArgumentException("Provider not found"));
        bookingRepository.findById(bookingId)
            .orElseThrow(() -> new IllegalArgumentException("Booking not found"));
        
        review.setCustomer(customer);
        review.setProvider(provider);
        return reviewRepository.save(review);
    }

    public List<Review> getReviewsByProvider(Long providerId) {
        return reviewRepository.findByProviderIdOrderByCreatedAtDesc(providerId);
    }

    public List<Review> getReviewsByCustomer(Long customerId) {
        return reviewRepository.findByCustomerIdOrderByCreatedAtDesc(customerId);
    }

    public Review replyToReview(Long reviewId, String replyText) {
        Review review = reviewRepository.findById(reviewId)
               .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Review not found"));   
        review.setProviderReply(replyText);
        return reviewRepository.save(review);
    }
}
