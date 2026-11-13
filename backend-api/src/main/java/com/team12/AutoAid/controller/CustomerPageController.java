package com.team12.AutoAid.controller;

import com.team12.AutoAid.entity.Customer;
import com.team12.AutoAid.service.CustomerService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        return "public/register";
    }

    @PostMapping
    public String createCustomer(@Valid @ModelAttribute("customer") Customer customer,
                                 BindingResult result, Model model,
                                 RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors().stream()
                    .map(e -> e.getDefaultMessage()).toList());
            return "public/register";
        }
        Customer saved = customerService.createCustomer(customer);
        redirectAttributes.addFlashAttribute("success", "Account created. Welcome to AutoAid!");
        return "redirect:/customers/" + saved.getId();
    }

    @PostMapping("/{id}")
    public String updateCustomer(@PathVariable Long id,
                                 @Valid @ModelAttribute("customer") Customer customer,
                                 BindingResult result, Model model,
                                 RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            customer.setId(id);
            model.addAttribute("errors", result.getAllErrors().stream()
                    .map(e -> e.getDefaultMessage()).toList());
            return "customer/profile";
        }
        try {
            customerService.updateCustomer(id, customer);
        } catch (ResponseStatusException e) {
            model.addAttribute("message", "Customer " + id + " was not found.");
            return "shared/error";
        }
        redirectAttributes.addFlashAttribute("success", "Profile updated.");
        return "redirect:/customers/" + id;
    }

    @PostMapping("/{id}/delete")
    public String deleteCustomer(@PathVariable Long id, Model model,
                                 RedirectAttributes redirectAttributes) {
        try {
            customerService.deleteCustomer(id);
        } catch (ResponseStatusException e) {
            model.addAttribute("message", "Customer " + id + " was not found.");
            return "shared/error";
        }
        redirectAttributes.addFlashAttribute("success", "Your account was deleted.");
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String showProfile(@PathVariable Long id, Model model) {
        try {
            model.addAttribute("customer", customerService.getCustomerById(id));
            return "customer/profile";
        } catch (ResponseStatusException e) {
            model.addAttribute("message", "Customer " + id + " was not found.");
            return "shared/error";
        }
    }
}