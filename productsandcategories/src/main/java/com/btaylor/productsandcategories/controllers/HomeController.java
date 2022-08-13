package com.btaylor.productsandcategories.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.btaylor.productsandcategories.models.Category;
import com.btaylor.productsandcategories.models.Product;
import com.btaylor.productsandcategories.services.CategoryService;
import com.btaylor.productsandcategories.services.ProductService;

@Controller
public class HomeController {
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/")
	public String index(Model model) {
		List<Product> products = productService.allProducts();
		model.addAttribute("products", products);
		
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
		return "/views/index.jsp";
	}
}
