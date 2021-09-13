package com.main.sheerhouse.user.mapper;

import com.main.sheerhouse.user.domain.UserVO;


public interface UserLoginMapper {


	public String emailCheck(String email);

	public void insertUser(UserVO user);

	public String passwordCheck(UserVO user);
	
	public int passwordUpdate(UserVO user);
	
	public UserVO selectUserInfo(UserVO user);
}