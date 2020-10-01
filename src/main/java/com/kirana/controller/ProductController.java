
package com.kirana.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kirana.model.Product;
import com.kirana.service.ProductService;
import com.kirana.utility.CommonUtility;

@Controller
@RequestMapping("/product")
@SessionAttributes("roles")
public class ProductController {

	static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	ProductService productServerice;

	@RequestMapping(value = "/productlist", method = RequestMethod.GET)
	public String productList(ModelMap model) {
		List<Product> productlist = productServerice.findAllProduct();
		model.addAttribute("products", productlist);
		model.addAttribute("loggedinuser",CommonUtility.getPrincipal());
		return "productList";
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public @ResponseBody String  addProduct(@RequestBody Product product) {
		productServerice.addProducts(product);
		return "OK";
	}
	
	@RequestMapping(value = "{entityId}", method = RequestMethod.GET)
	public @ResponseBody Product getProduct(@PathVariable("entityId") Long entityId) {
		return productServerice.findProductsByEntityId(entityId); 
	}
	
	@RequestMapping(value = "deleteproduct/{entityId}", method = RequestMethod.GET)
	public @ResponseBody String deleteProduct(@PathVariable("entityId") Long entityId) {
		 productServerice.deleteProducts(entityId);
		 return "productlist";
	}
	
	@RequestMapping(value = "updateproduct", method = RequestMethod.POST)
	public @ResponseBody String updateProduct(@RequestBody Product product) {
		 productServerice.updateProducts(product);
		 return "productlist";
	}

}
