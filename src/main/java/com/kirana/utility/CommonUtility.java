package com.kirana.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CommonUtility {

	static final Logger logger = LoggerFactory.getLogger(CommonUtility.class);
	
	public static <T> String convertObjectToJson(T t) {
		ObjectMapper mapper = new ObjectMapper();
			try {
				return mapper.writeValueAsString(t);
			} catch (JsonProcessingException e) {
				logger.info("there is exception with conversion object to json {}",e.getMessage());
		}
		return null;	
	}
}
