package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Service;
import com.team12.AutoAid.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

// Fully qualify Spring's @Service annotation to prevent collision with your entity
@org.springframework.stereotype.Service
public class ServiceServiceImpl {

    @Autowired
    private ServiceRepository serviceRepository;

    public List<Service> findAllServices() {
        return serviceRepository.findAll();
    }

    public Optional<Service> findServiceById(Long id) {
        return serviceRepository.findById(id);
    }

    public Service saveService(Service service) {
        return serviceRepository.save(service);
    }

    public void deleteService(Long id) {
        serviceRepository.deleteById(id);
    }
}
