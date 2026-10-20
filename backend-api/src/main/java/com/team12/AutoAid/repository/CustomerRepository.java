package com.team12.AutoAid.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.team12.AutoAid.entity.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

}