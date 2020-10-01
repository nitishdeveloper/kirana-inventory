package com.kirana.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.kirana.dao.ProductDao;
import com.kirana.exception.GlobalProductException;
import com.kirana.model.Product;
import com.kirana.utility.CommonUtility;

@Service
public class ProductServiceImpl implements ProductService {

	static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	ProductDao  productDao;
	
	
	
	
	@Override
	public void addProducts(Product product) {
		if(validate(product)) {
			List<Product> products = productDao.findByProductId(product.getProductId());
			if(!products.isEmpty() || products.size() > 0) {
				logger.info("product already present in the system : {}",CommonUtility.convertObjectToJson(products));
				throw new GlobalProductException("this product "+product.getProductId()+" already added in the system...!!!");
			}
			logger.info("add product request : {}",CommonUtility.convertObjectToJson(product));
			product.setCreatedAt(new Date());
			productDao.addProducts(product);
		}
	}

	@Override
	public void updateProducts(Product product) {
		if(product !=null) {
			logger.info("update product request : {}",CommonUtility.convertObjectToJson(product));
			productDao.updateProducts(product);
		}
	}

	@Override
	public void deleteProducts(Long entityId) {
		if(entityId != null) {
			productDao.deleteProducts(entityId);
		}
	}
	
	private boolean validate(Product product) {
		
		if(StringUtils.isEmpty(product.getProductId())) {
			logger.info("productId is empty or null");
			throw new GlobalProductException("productId is empty or null");
		}
		
		if(StringUtils.isEmpty(product.getProductName())) {
			logger.info("product name is empty or null");
			throw new GlobalProductException("product name is empty or null");
		}
		
		if(StringUtils.isEmpty(product.getQuantity())) {
			logger.info("product quatity is empty or null");
			throw new GlobalProductException("product quatity is empty or null");
		}
		
		if(StringUtils.isEmpty(product.getMarketPrice())) {
			logger.info("product market price is empty or null");
			throw new GlobalProductException("product market price is empty or null");
		}
		
		if(StringUtils.isEmpty(product.getActualPrice())) {
			logger.info("product actual price is empty or null");
			throw new GlobalProductException("product actual price is empty or null");
		}
		
		return true;
	}

	@Override
	public List<Product> findAllProduct() {
		return productDao.findAllProduct();
	}

	@Override
	public Product findProductsByEntityId(Long entityId) {
		logger.info("productId : {}",entityId);
		Product product = productDao.findProductsByEntityId(entityId);
		if(product == null) {
			 throw new GlobalProductException("product not found");
		}
		logger.info("product details : {}",CommonUtility.convertObjectToJson(product));
		return product;
		
	}

	@Override
	public void builkUploadProduct(List<Product> products) {
		if(products.isEmpty() || products.size() == 0) {
		
			throw new GlobalProductException("file does not contain any element");
		}
		productDao.builkUploadProduct(products);
	}

	
	
	
}
