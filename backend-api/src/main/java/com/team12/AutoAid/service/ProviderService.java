package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.repository.ProviderRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProviderService {

    private final ProviderRepository providerRepository;

    public ProviderService(ProviderRepository providerRepository) {
        this.providerRepository = providerRepository;
    }

    public Provider registerProvider(Provider provider) {
        if (providerRepository.findByEmail(provider.getEmail()).isPresent()) {
            throw new IllegalArgumentException("Email already in use.");
        }
        return providerRepository.save(provider);
    }

    public List<Provider> getAllProviders(String specialty) {
        if (specialty != null && !specialty.isBlank()) {
            return providerRepository.findBySpecialtiesContainingIgnoreCase(specialty);
        }
        return providerRepository.findAll();
    }

    public Optional<Provider> getProviderById(Long id) {
        return providerRepository.findById(id);
    }

    public Provider updateProvider(Long id, Provider updatedData) {
        Provider provider = providerRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Provider not found."));
        
        provider.setName(updatedData.getName());
        provider.setPhoneNumber(updatedData.getPhoneNumber());
        provider.setProfession(updatedData.getProfession());
        provider.setCertifications(updatedData.getCertifications());
        provider.setSpecialties(updatedData.getSpecialties());
        
        return providerRepository.save(provider);
    }

    public void deleteProvider(Long id) {
        if (!providerRepository.existsById(id)) {
            throw new IllegalArgumentException("Provider not found.");
        }
        providerRepository.deleteById(id);
    }
}
