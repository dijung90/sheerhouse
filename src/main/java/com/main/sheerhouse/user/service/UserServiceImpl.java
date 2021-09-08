package com.main.sheerhouse.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Override //emailCheck(중복체크)에 값이 들어있지 않다면 true를 return
	public boolean emailCheck(String email) {
		boolean result = false;
		String emailCheck = mapper.emailCheck(email);
		if(emailCheck != null) result = true;
		return result;
	}

	@Override
	public boolean insertUser(UserVO user) {
		boolean result = false;
		int check = mapper.insertUser(user);
		if(check == 1) result = true; 
		
		return result;
	}


	@Override
	public UserVO userLogin(UserVO user) throws Exception{
		return mapper.userLogin(user);
	}
}
