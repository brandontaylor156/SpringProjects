package com.btaylor.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.productsandcategories.models.Category;
import com.btaylor.productsandcategories.models.Product;
import com.btaylor.productsandcategories.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository categoryRepository;
	
	public Category findCategoryById(Long id) {
		Optional<Category> optionalCategory = categoryRepository.findById(id);
		if (optionalCategory.isPresent()) {
			return optionalCategory.get();
		}
		return null;
	}
	
	public List<Category> allCategories(){
		return categoryRepository.findAll();
	}
	
	public List<Category> allCategoriesByProduct(Product product){
		List<Category> categories = categoryRepository.findAllByProducts(product);
		return categories;
	}
	
	public List<Category> allCategoriesByNotProduct(Product product){
		List<Category> categories = categoryRepository.findByProductsNotContains(product);
		return categories;
	}
	
	public Category createCategory(Category c) {
		return categoryRepository.save(c);
	}
	
	
	public Category updateCategory(Category c) {
    	return categoryRepository.save(c);
    }
	
	public void deleteCategory(Long id) {
    	categoryRepository.deleteById(id);
    }
}
