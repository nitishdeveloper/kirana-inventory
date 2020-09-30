package com.kirana.dao;

import java.util.Date;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kirana.exception.GlobalProductException;
import com.kirana.model.Product;
import com.kirana.utility.CommonUtility;

@Repository
@Transactional
public class ProductDaoImpl extends AbstractDao<Long, Product> implements ProductDao {

	static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);
	
	@Override
	public void addProducts(Product product) {
		 product.setCreatedAt(new Date());
		 product.setUpdatedAt(new Date());
		 persist(product);
	}

	@SuppressWarnings("unused")
	@Override
	public void updateProducts(Product product) {
		
		Product updateDetails = findProductsByEntityId(product.getEntityId());
		logger.info("updateDetails : {}",CommonUtility.convertObjectToJson(updateDetails));
		if(updateDetails != null) {
			updateDetails.setProductId(product.getProductId());
			updateDetails.setProductName(product.getProductName());
			updateDetails.setBrandName(product.getBrandName());
			updateDetails.setQuantity(product.getQuantity());
			updateDetails.setCategoryName(product.getCategoryName());
			updateDetails.setActualPrice(product.getActualPrice());
			updateDetails.setMarketPrice(product.getMarketPrice());
			updateDetails.setUpdatedAt(new Date());
			update(updateDetails);
			return;
		}
			throw new GlobalProductException("product not found");
		
	}

	@Override
	public void deleteProducts(Long entityId) {
		delete(findProductsByEntityId(entityId));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findAllProduct() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("updatedAt"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Product> products = (List<Product>) criteria.list();
		return products;
	}

	@Override
	public Product findProductsByEntityId(long entityId) {
		return  (Product) getSession().get(Product.class, entityId);
	}

	@Override
	public void builkUploadProduct(List<Product> products) {
			  for(Product entity: products){
			     persist(entity);
			}
	}
	
	
}
