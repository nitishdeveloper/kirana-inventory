package com.kirana.service;

import java.util.List;

import com.kirana.model.User;


public interface UserService {
	
	User findById(int id);
	
	User findByUsername(String username);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUserByUsername(String username);

	List<User> findAllUsers(); 
	
	boolean isUniqueUsername(Integer id, String username);

}