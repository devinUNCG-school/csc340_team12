package com.team12.AutoAid.repository;

import com.team12.AutoAid.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByProviderIdOrderByCreatedAtDesc(Long providerId);
    List<Review> findByCustomerIdOrderByCreatedAtDesc(Long customerId);
    Optional<Review> findByBookingId(Long bookingId);
}
