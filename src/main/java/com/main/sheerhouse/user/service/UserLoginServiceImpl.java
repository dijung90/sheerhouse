package com.main.sheerhouse.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.mapper.UserLoginMapper;

@Service
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserLoginMapper mapper;
	
	@Override
	public boolean emailCheck(String email) {
		boolean result = false;
		String emailCheck = mapper.emailCheck(email);
		if(emailCheck != null) result = true;
		return result;
	}

	@Override
	public void insertUser(UserVO user) {
		mapper.insertUser(user);
	
	}

	@Override
	public boolean passwordCheck(UserVO user) {
		boolean result = false;
		String passwordCheck = mapper.passwordCheck(user);
		if(user.getPassword().equals(passwordCheck)) {
			return true;
		}
		return result;
	}

	@Override
	public boolean passwordUpdate(UserVO user) {
		int check = mapper.passwordUpdate(user);
		boolean result = false;
		if(check == 1) {
			result = true;
		}
		return result;
	}
	
	
	
	
}