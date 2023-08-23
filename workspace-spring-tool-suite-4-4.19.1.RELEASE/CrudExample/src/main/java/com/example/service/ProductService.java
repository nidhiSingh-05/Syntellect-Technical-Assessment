package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.Product;
import com.example.repository.ProductRepository;

@Service
public class ProductService 
{
	@Autowired
	private ProductRepository repository;
	
	
	public Product saveProduct(Product product)
	{
		return repository.save(product);
	}
	
	public List<Product> saveProductList(List<Product> product)
	{
		return repository.saveAll(product);
	}
	
	public List<Product> getProduct()
	{
		return repository.findAll();
	}
	@SuppressWarnings("unchecked")
	public List<Product> getProductById(int id)
	{
		return (List<Product>) repository.findById(id).orElse( null);
	}
	
	public Product getProductByName(String name)
	{
		return repository.findByName(name);
	}
	public String deleteProduct(int id)
	{
		repository.deleteById(id);
		return "Product Removed Successfully" + id;
	}
	public Product updateProduct(Product product)
	{
		Product existingProduct = repository.findById(product.getId()).orElse(null);
		existingProduct.setName(product.getName());
		existingProduct.setDescription(product.getDescription());
		existingProduct.setPrice(product.getPrice());
		return repository.save(existingProduct);
	}
}
