package com.kirana.service;

import java.util.List;

import com.kirana.model.Product;

public interface ProductService {
	void addProducts(Product product);
	void updateProducts(Product product);
	Product findProductsByEntityId(long entityId);
	List<Product> findAllProduct();
	void deleteProducts(Long entityId);
	void builkUploadProduct(List<Product> products);
}
