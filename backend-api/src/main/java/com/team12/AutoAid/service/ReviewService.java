package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Review;
import com.team12.AutoAid.repository.CustomerRepository;
import com.team12.AutoAid.repository.ProviderRepository;
import com.team12.AutoAid.repository.ReviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final CustomerRepository customerRepository;
    private final ProviderRepository providerRepository;

    public ReviewService(ReviewRepository reviewRepository,
                         CustomerRepository customerRepository,
                         ProviderRepository providerRepository) {
        this.reviewRepository = reviewRepository;
        this.customerRepository = customerRepository;
        this.providerRepository = providerRepository;
    }

    public Review createReview(Long customerId, Long providerId, Long bookingId, Review review) {
        var customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found"));
        var provider = providerRepository.findById(providerId)
                .orElseThrow(() -> new IllegalArgumentException("Provider not found"));
        
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
                .orElseThrow(() -> new IllegalArgumentException("Review not found"));
        review.setProviderReply(replyText);
        return reviewRepository.save(review);
    }
}
