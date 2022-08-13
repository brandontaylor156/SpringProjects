package com.btaylor.productsandcategories.controllers;

import java.util.List;

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
public class ProductController {
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/products/new")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "/views/newProduct.jsp";
	}
	
	@PostMapping("/products/new")
	public String addProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors())
			return "/views/newProduct.jsp";
		else {
			productService.createProduct(product);
			return "redirect:/products/" + product.getId();
		}
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		Product product = productService.findProductById(id);
		model.addAttribute("product", product);
		
		List<Category> availableCategories = categoryService.allCategoriesByNotProduct(product);
		model.addAttribute("categories", availableCategories);
		return "/views/showProduct.jsp";
	}
	
	@PutMapping("/products/{id}/addCategory")
	public String addCategoryToProduct(@PathVariable("id") Long id, @RequestParam("category") Long categoryId) {
		Product product = productService.findProductById(id);
		Category category = categoryService.findCategoryById(categoryId);
		product.getCategories().add(category);
		productService.updateProduct(product);
		return "redirect:/products/" + id;
	}
}
