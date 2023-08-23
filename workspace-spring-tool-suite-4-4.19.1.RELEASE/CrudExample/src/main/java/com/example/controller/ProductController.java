package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.entity.Product;
import com.example.service.ProductService;

@RestController
public class ProductController {

	@Autowired
	private ProductService service;
	
	@PostMapping("/addProduct")
	public Product addProduct(@RequestBody Product product) 
	{
		return service.saveProduct(product);
	}
	
	@PostMapping("/addProductList")
	public List<Product> addProductList(@RequestBody List<Product> product)
	{
		return service.saveProductList(product);
	}
	
	@GetMapping("/products")
	public List<Product> findAllProduct()
	{
		return service.getProduct();
	}
	
	@GetMapping("/product/{id}")
	public List<Product> findProductById(@PathVariable int id)
	{
		return service.getProductById(id);
	}
	
	@GetMapping("/product/{name}")
	public Product findPRoductByName(@PathVariable String name)
	{
		return service.getProductByName(name);
	}
	
	@PostMapping("/update")
	public Product updateProduct(@RequestBody Product product)
	{
		return service.updateProduct(product);
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteProduct(int id)
	{
		return service.deleteProduct(id);
	}
}

