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
}
