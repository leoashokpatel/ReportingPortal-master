package com.comlink.dao;


import java.util.List;

import com.comlink.model.User;

public interface UserDao {
	public int registerUser(User user);
	public int updateUser(String id,String password);
	public User login(String username,String password);
	public User getUserById(String id);
	public List<User> getAllUser();
	public int editUser(User user);
	public int deleteUser(String id);
	public List<User> uniqueuser();
}
