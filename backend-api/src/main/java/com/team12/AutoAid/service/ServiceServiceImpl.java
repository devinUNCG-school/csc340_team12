package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Service;
import com.team12.AutoAid.repository.ServiceRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ServiceServiceImpl implements ServiceService {

    private final ServiceRepository serviceRepository;

    public ServiceServiceImpl(ServiceRepository serviceRepository) {
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
