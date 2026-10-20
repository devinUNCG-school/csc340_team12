package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.service.ProviderService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/providers")
public class ProviderController {

    private final ProviderService providerService;

    public ProviderController(ProviderService providerService) {
        this.providerService = providerService;
    }

    @PostMapping
    public ResponseEntity<?> registerProvider(@Valid @RequestBody Provider provider) {
        try {
            Provider saved = providerService.registerProvider(provider);
            saved.setPassword(null);
            return ResponseEntity.status(HttpStatus.CREATED).body(saved);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<List<Provider>> getProviders(@RequestParam(required = false) String specialty) {
        List<Provider> providers = providerService.getAllProviders(specialty);
        providers.forEach(p -> p.setPassword(null));
        return ResponseEntity.ok(providers);
    }

    @GetMapping("/{providerId}")
    public ResponseEntity<Provider> getProvider(@PathVariable Long providerId) {
        return providerService.getProviderById(providerId)
                .map(provider -> {
                    provider.setPassword(null);
                    return ResponseEntity.ok(provider);
                })
                .orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    @PutMapping("/{providerId}")
    public ResponseEntity<?> updateProvider(@PathVariable Long providerId, @Valid @RequestBody Provider updatedData) {
        try {
            Provider saved = providerService.updateProvider(providerId, updatedData);
            saved.setPassword(null);
            return ResponseEntity.ok(saved);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{providerId}")
    public ResponseEntity<Void> deleteProvider(@PathVariable Long providerId) {
        try {
            providerService.deleteProvider(providerId);
            return ResponseEntity.noContent().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
}
