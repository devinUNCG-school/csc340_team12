package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Service;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {

    private final com.team12.AutoAid.repository.ServiceRepository serviceRepository;

    public ServiceServiceImpl(com.team12.AutoAid.repository.ServiceRepository serviceRepository) {
        this.serviceRepository = serviceRepository;
    }

    @Override
    public List<Service> findByProviderId(Long providerId) {
        return serviceRepository.findByProviderId(providerId);
    }

    @Override
    public Service save(Service service) {
        return serviceRepository.save(service);
    }
}
