package com.main.sheerhouse.user.service;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserLoginService {

	public boolean emailCheck(String email);
	public void insertUser(UserVO user);
	public boolean passwordCheck(UserVO user);
	public boolean passwordUpdate(UserVO user);
	
	public UserVO selectUserInfo(UserVO user);
}
