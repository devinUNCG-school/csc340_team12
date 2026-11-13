package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.repository.ProviderRepository;
import com.team12.AutoAid.repository.ServiceRepository;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class ProviderService {

    private final ProviderRepository providerRepository;
    private final ServiceRepository serviceRepository;

    public ProviderService(ProviderRepository providerRepository, ServiceRepository serviceRepository) {
        this.providerRepository = providerRepository;
        this.serviceRepository = serviceRepository;
    }

    public List<Provider> searchProviders(String query, String specialty) {
        String q = query == null ? "" : query.trim().toLowerCase();
        String s = specialty == null ? "" : specialty.trim();

        return providerRepository.findAll().stream()
                .filter(p -> q.isEmpty()
                        || containsIgnoreCase(p.getName(), q)
                        || containsIgnoreCase(p.getProfession(), q)
                        || p.getSpecialties().stream().anyMatch(sp -> containsIgnoreCase(sp, q)))
                .filter(p -> s.isEmpty()
                        || p.getSpecialties().stream().anyMatch(sp -> sp != null && sp.equalsIgnoreCase(s)))
                .sorted(Comparator.comparing(Provider::getName,
                        Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER)))
                .toList();
    }

    /**
     * Every distinct specialty offered by any provider, for the search
     * dropdown.
     */
    public List<String> getAllSpecialties() {
        return providerRepository.findAll().stream()
                .flatMap(p -> p.getSpecialties().stream())
                .filter(sp -> sp != null && !sp.isBlank())
                .map(String::trim)
                .distinct()
                .sorted(String.CASE_INSENSITIVE_ORDER)
                .toList();
    }

    public List<com.team12.AutoAid.entity.Service> getPublishedServices(Long providerId) {
        return serviceRepository.findByProviderId(providerId).stream()
                .filter(svc -> svc.getStatus() == null || svc.getStatus().equalsIgnoreCase("PUBLISHED"))
                .toList();
    }

    private static boolean containsIgnoreCase(String text, String lowerQuery) {
        return text != null && text.toLowerCase().contains(lowerQuery);
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
