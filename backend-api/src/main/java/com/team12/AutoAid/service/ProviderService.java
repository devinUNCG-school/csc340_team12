package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.repository.ProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProviderService {

    @Autowired
    private ProviderRepository providerRepository;

    // Standard methods
    public Optional<Provider> findById(Long id) {
        return providerRepository.findById(id);
    }

    public Provider save(Provider provider) {
        return providerRepository.save(provider);
    }

    public List<Provider> findAll() {
        return providerRepository.findAll();
    }

    public void deleteById(Long id) {
        providerRepository.deleteById(id);
    }

    // Methods expected by MechanicPageController & ProviderController
    public Provider getProviderById(Long id) {
        return providerRepository.findById(id).orElse(null);
    }

    public Provider registerProvider(Provider provider) {
        return providerRepository.save(provider);
    }

    public Provider updateProvider(Long id, Provider provider) {
        provider.setId(id);
        return providerRepository.save(provider);
    }

    public void deleteProvider(Long id) {
        providerRepository.deleteById(id);
    }

    public List<Provider> getAllProviders(String query) {
        return providerRepository.findAll();
    }

    public List<Provider> searchProviders(String specialty, String location) {
        return providerRepository.findAll();
    }

    public List<String> getAllSpecialties() {
        return List.of();
    }

    public List<Object> getPublishedServices(Long providerId) {
        return List.of();
    }
}
