package com.main.sheerhouse.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper usermapper;
	
	@Override
	public UserVO userLogin(UserVO user) throws Exception{
		return usermapper.userLogin(user);
	}
}
