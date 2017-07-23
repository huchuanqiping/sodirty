package com.qutaole.sodirty.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.qutaole.sodirty.model.User;
import com.qutaole.sodirty.service.UserService;

/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:26:10
 */

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger log = Logger.getLogger(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping("/querybyid")
	@ResponseBody
	public Map<String,Object> queryById(){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			User user = userService.queryUserById(1L);
			result.put("userJson", user);
			result.put("code",200);
			result.put("msg", "查询成功");
		}catch(Throwable e){
			log.error("异常",e);
		}
		log.info("返回结果:"+JSON.toJSONString(result));
		return result;
	}
	
	@RequestMapping("/queryallusers")
	@ResponseBody
	public Map<String,Object> queryAllUsers(User user,Integer pageNum,Integer pageSize){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			List<User> users = userService.queryUsersByCond(user, pageNum, pageSize);
			result.put("users", users);
			result.put("code",200);
			result.put("msg", "查询成功");
		}catch(Throwable e){
			log.error("异常",e);
		}
		log.info("返回结果:"+JSON.toJSONString(result));
		return result;
	}

}
