package com.qutaole.sodirty.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qutaole.sodirty.dao.UserDao;
import com.qutaole.sodirty.dao.pagination.PaginationInfo;
import com.qutaole.sodirty.dao.pagination.PaginationList;
import com.qutaole.sodirty.model.User;

/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:11:48
 */

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl implements UserDao{

	@Override
	public User queryUserById(Long id) {
		return selectOne("selectUserByPrimaryKey",id);
	}

	@Override
	public List<User> queryAllUser(User user,Integer pageNum, Integer pageSize) {
		PaginationInfo pageInfo = null;
		if(null != pageNum && pageNum > 0){
			if(pageSize == null || pageSize <= 0){
				pageSize = PaginationInfo.defaultRecordPerPage;
			}
			pageInfo = new PaginationInfo(pageNum,pageSize);
		}
		Map<String,Object> params = new HashMap<String,Object>();
		if(null != user.getStatus()){
			params.put("status",user.getStatus());
		}
		//这里可以添加查询条件
		PaginationList<User> paginationList = selectPaginationList("selectUsersByCond",params,pageInfo);
		return paginationList;
	}

}
