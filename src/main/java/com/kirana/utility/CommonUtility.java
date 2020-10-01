package com.kirana.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CommonUtility {

	static final Logger logger = LoggerFactory.getLogger(CommonUtility.class);
	
	@Autowired
	public static AuthenticationTrustResolver authenticationTrustResolver;
	
	public static String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	public static boolean isCurrentAuthenticationAnonymous() {
	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    return authenticationTrustResolver.isAnonymous(authentication);
	}

	
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
