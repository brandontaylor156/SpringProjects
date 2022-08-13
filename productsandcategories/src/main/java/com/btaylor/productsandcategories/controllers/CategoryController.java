package com.btaylor.productsandcategories.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btaylor.productsandcategories.models.Category;
import com.btaylor.productsandcategories.models.Product;
import com.btaylor.productsandcategories.services.CategoryService;
import com.btaylor.productsandcategories.services.ProductService;

@Controller
public class CategoryController {
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/categories/new")
	public String newCategory(@ModelAttribute("category") Category category) {
		return "/views/newCategory.jsp";
	}
	
	@PostMapping("/categories/new")
	public String addCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if (result.hasErrors())
			return "/views/newCategory.jsp";
		else {
			categoryService.createCategory(category);
			return "redirect:/categories/" + category.getId();
		}
	}
	
	@GetMapping("/categories/{id}")
	public String showCategory(@PathVariable("id") Long id, Model model) {
		Category category = categoryService.findCategoryById(id);
		model.addAttribute("category", category);
		
		List<Product> availableProducts = productService.allProductsByNotCategory(category);
		model.addAttribute("products", availableProducts);
		return "/views/showCategory.jsp";
	}
	
	@PutMapping("/categories/{id}/addProduct")
	public String addProductToCategory(@PathVariable("id") Long id, @RequestParam("product") Long productId) {
		Category category = categoryService.findCategoryById(id);
		Product product = productService.findProductById(productId);
		category.getProducts().add(product);
		categoryService.updateCategory(category);
		return "redirect:/categories/" + id;
	}
}
