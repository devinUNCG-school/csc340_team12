package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.service.ProviderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/mechanics")
public class MechanicPageController {

    private final ProviderService providerService;

    public MechanicPageController(ProviderService providerService) {
        this.providerService = providerService;
    }

    @GetMapping
    public String listMechanics(@RequestParam(required = false) String name,
            @RequestParam(required = false) String specialty,
            Model model) {
        model.addAttribute("providers", providerService.searchProviders(name, specialty));
        model.addAttribute("specialties", providerService.getAllSpecialties());
        // Send the typed values back so the search inputs stay filled in
        model.addAttribute("name", name == null ? "" : name);
        model.addAttribute("specialty", specialty == null ? "" : specialty);
        return "customer/mechanics";
    }

    @GetMapping("/{id}")
    public String showMechanic(@PathVariable Long id, Model model) {
        Optional<Provider> provider = providerService.getProviderById(id);
        if (provider.isEmpty()) {
            model.addAttribute("message", "Mechanic " + id + " was not found.");
            return "shared/error";
        }
        model.addAttribute("provider", provider.get());
        model.addAttribute("services", providerService.getPublishedServices(id));
        return "customer/mechanic-profile";
    }
}
