package com.qutaole.sodirty.dao;

import java.util.List;

import com.qutaole.sodirty.model.User;

/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:09:43
 */

public interface UserDao {
	
	public User queryUserById(Long id);
	
	public List<User> queryAllUser(User user,Integer pageNum,Integer pageSize);

}
