package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Review;
import com.team12.AutoAid.service.ReviewService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping
public class ReviewController {

    private final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    // Post a review for a provider/service
    @PostMapping("/customers/{customerId}/reviews")
    public ResponseEntity<?> createReview(
            @PathVariable Long customerId,
            @RequestParam Long providerId,
            @RequestParam(required = false) Long bookingId,
            @Valid @RequestBody Review review) {
        try {
            Review created = reviewService.createReview(customerId, providerId, bookingId, review);
            return ResponseEntity.status(HttpStatus.CREATED).body(created);
        } catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    // Get all reviews for a specific provider
    @GetMapping("/providers/{providerId}/reviews")
    public ResponseEntity<List<Review>> getProviderReviews(@PathVariable Long providerId) {
        List<Review> reviews = reviewService.getReviewsByProvider(providerId);
        return ResponseEntity.ok(reviews);
    }

    // Get all reviews written by a customer
    @GetMapping("/customers/{customerId}/reviews")
    public ResponseEntity<List<Review>> getCustomerReviews(@PathVariable Long customerId) {
        List<Review> reviews = reviewService.getReviewsByCustomer(customerId);
        return ResponseEntity.ok(reviews);
    }

    // Provider replies to a review
    @PatchMapping("/providers/{providerId}/reviews/{reviewId}/reply")
    public ResponseEntity<?> replyToReview(
            @PathVariable Long providerId,
            @PathVariable Long reviewId,
            @RequestBody Map<String, String> body) {
        try {
            String reply = body.get("reply");
            if (reply == null || reply.isBlank()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Reply text cannot be empty");
            }
            Review updated = reviewService.replyToReview(reviewId, reply);
            return ResponseEntity.ok(updated);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}
