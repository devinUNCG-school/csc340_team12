package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Provider;
import com.team12.AutoAid.entity.ServiceOffering;
import com.team12.AutoAid.service.ProviderService;
import com.team12.AutoAid.service.ServiceOfferingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/provider")
public class ProviderWebController {

    private final ProviderService providerService;
    private final ServiceOfferingService serviceOfferingService;

    public ProviderWebController(ProviderService providerService, ServiceOfferingService serviceOfferingService) {
        this.providerService = providerService;
        this.serviceOfferingService = serviceOfferingService;
    }

    // 1. View Provider Dashboard with live database data
    @GetMapping("/dashboard/{id}")
    public String viewDashboard(@PathVariable Long id, Model model) {
        Provider provider = providerService.findById(id)
            .orElseThrow(() -> new RuntimeException("Provider not found with ID: " + id));
        
        model.addAttribute("provider", provider);
        model.addAttribute("services", serviceOfferingService.findByProviderId(id));
        return "provider-dashboard";
    }

    // 2. Show form to create/edit provider profile
    @GetMapping("/profile/form")
    public String showProfileForm(@RequestParam(required = false) Long id, Model model) {
        if (id != null) {
            Provider provider = providerService.findById(id)
                .orElseThrow(() -> new RuntimeException("Provider not found"));
            model.addAttribute("provider", provider);
        } else {
            model.addAttribute("provider", new Provider());
        }
        return "provider-profile-form";
    }

    // 3. Save provider profile and redirect
    @PostMapping("/profile/save")
    public String saveProfile(@ModelAttribute Provider provider) {
        Provider saved = providerService.save(provider);
        return "redirect:/provider/dashboard/" + saved.getId();
    }

    // 4. Show form to add a new service offering
    @GetMapping("/{providerId}/services/new")
    public String showServiceForm(@PathVariable Long providerId, Model model) {
        ServiceOffering service = new ServiceOffering();
        service.setProviderId(providerId);
        model.addAttribute("service", service);
        model.addAttribute("providerId", providerId);
        return "provider-service-form";
    }

    // 5. Save new service offering
    @PostMapping("/services/save")
    public String saveService(@ModelAttribute ServiceOffering serviceOffering) {
        serviceOfferingService.save(serviceOffering);
        return "redirect:/provider/dashboard/" + serviceOffering.getProviderId();
    }
}
