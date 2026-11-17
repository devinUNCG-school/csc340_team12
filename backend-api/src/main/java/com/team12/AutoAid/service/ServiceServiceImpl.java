package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Service;
import com.team12.AutoAid.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {

    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public List<Service> findAllServices() {
        return serviceRepository.findAll();
    }

    @Override
    public Service saveService(Service service) {
        return serviceRepository.save(service);
    }
}
