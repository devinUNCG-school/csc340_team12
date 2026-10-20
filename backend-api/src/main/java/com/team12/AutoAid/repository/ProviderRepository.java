package com.team12.AutoAid.repository;

import com.team12.AutoAid.entity.Provider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProviderRepository extends JpaRepository<Provider, Long> {
    Optional<Provider> findByEmail(String email);
    List<Provider> findBySpecialtiesContainingIgnoreCase(String specialty);
}
