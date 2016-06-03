package com.jz13.service;

import java.util.List;

import com.jz13.entity.PageBean;
import com.jz13.entity.User;

public interface UserService {

	public void saveUser(User user);
	
	public boolean existUserWithName(String name);
	
	public User login(User user);
	
	public List<User> findUserList(User s_user,PageBean pageBean);
	
	public Long getUserCount(User s_user);
	
	public void delete(User user);
	
	public User getUserById(int id);
	
	public User getUserByName(String name);
}
