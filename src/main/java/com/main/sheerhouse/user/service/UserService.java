package com.main.sheerhouse.user.service;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserService {
	//회원가입 -------------------------------------------------
	//이메일체크
	public boolean emailCheck(String email);
	//회원가입
	public boolean insertUser(UserVO user);
	
}
