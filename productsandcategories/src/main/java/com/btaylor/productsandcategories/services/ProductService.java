package com.btaylor.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btaylor.productsandcategories.models.Category;
import com.btaylor.productsandcategories.models.Product;
import com.btaylor.productsandcategories.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	public Product findProductById(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if (optionalProduct.isPresent()) {
			return optionalProduct.get();
		}
		return null;
	}
	
	public List<Product> allProducts() {
        return productRepository.findAll();
    } 
	
	public List<Product> allProductsByCategory(Category category){
		List<Product> products = productRepository.findAllByCategories(category);
		return products;
	}
	
	public List<Product> allProductsByNotCategory(Category category){
		List<Product> products = productRepository.findByCategoriesNotContains(category);
		return products;
	}
	
	public Product createProduct(Product p) {
		return productRepository.save(p);
	}
	
	
	public Product updateProduct(Product p) {
    	return productRepository.save(p);
    }
	
	public void deleteProduct(Long id) {
    	productRepository.deleteById(id);
    }
}

