package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Customer;
import com.team12.AutoAid.service.CustomerService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/customers")
public class CustomerPageController {

    private final CustomerService customerService;

    public CustomerPageController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customer-form";
    }

    @PostMapping
    public String createCustomer(@Valid @ModelAttribute("customer") Customer customer,
                                 BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors().stream()
                    .map(e -> e.getDefaultMessage()).toList());
            return "customer-form";
        }
        Customer saved = customerService.createCustomer(customer);
        return "redirect:/customers/" + saved.getId();
    }

    @GetMapping("/{id}")
    public String showProfile(@PathVariable Long id, Model model) {
        try {
            model.addAttribute("customer", customerService.getCustomerById(id));
            return "customer-profile";
        } catch (ResponseStatusException e) {
            model.addAttribute("message", "Customer " + id + " was not found.");
            return "error-message";
        }
    }
}