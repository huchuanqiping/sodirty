package com.qutaole.sodirty.service;

import java.util.List;

import com.qutaole.sodirty.model.User;

/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:18:03
 */
public interface UserService {
	
	
	public User queryUserById(Long userId);
	
	public List<User> queryUsersByCond(User user,Integer pageNum,Integer pageSize);
}
