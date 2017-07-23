package com.qutaole.sodirty.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qutaole.sodirty.dao.UserDao;
import com.qutaole.sodirty.model.User;
import com.qutaole.sodirty.service.UserService;

/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:23:13
 */
@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao userDao;
	
	
	@Override
	public User queryUserById(Long userId) {
		return userDao.queryUserById(userId);
	}


	@Override
	public List<User> queryUsersByCond(User user, Integer pageNum, Integer pageSize) {
		return userDao.queryAllUser(user, pageNum, pageSize);
	}

}
