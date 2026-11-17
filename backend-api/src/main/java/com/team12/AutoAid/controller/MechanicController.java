package com.autoaid.controller;

import com.autoaid.model.MechanicService;
import com.autoaid.service.MechanicServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/services")
public class MechanicController {

    @Autowired
    private MechanicServiceService serviceManager;

    // 1. List all services
    @GetMapping
    public String listServices(Model model) {
        model.addAttribute("services", serviceManager.findAll());
        return "services/list"; // maps to src/main/resources/templates/services/list.ftlh
    }

    // 2. View single service with error handling for unknown IDs
    @GetMapping("/{id}")
    public String getServiceDetail(@PathVariable Long id, Model model) {
        MechanicService service = serviceManager.findById(id);
        
        if (service == null) {
            model.addAttribute("errorMessage", "The requested mechanic service with ID " + id + " does not exist.");
            return "services/error"; // maps to src/main/resources/templates/services/error.ftlh
        }
        
        model.addAttribute("service", service);
        return "services/detail";
    }

    // 3. Handle Create Form Submission with validation & bad input handling
    @PostMapping("/add")
    public String createService(@Valid @ModelAttribute("service") MechanicService service, 
                                BindingResult result, 
                                RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "services/add-form"; // return to form with validation errors
        }
        
        serviceManager.save(service);
        redirectAttributes.addFlashAttribute("successMessage", "Service successfully created!");
        return "redirect:/services";
    }
}
