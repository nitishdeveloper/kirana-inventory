package com.kirana.dao;

import java.util.List;

import com.kirana.model.Product;

public interface ProductDao {
	void addProducts(Product product);
	void updateProducts(Product product);
	void deleteProducts(Long entityId);
	List<Product> findAllProduct();
	Product findProductsByEntityId(long entityId);
	void builkUploadProduct(List<Product> products);
}
