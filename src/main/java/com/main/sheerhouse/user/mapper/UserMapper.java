package com.main.sheerhouse.user.mapper;

import com.main.sheerhouse.user.domain.UserVO;


public interface UserMapper {

	//회원가입 ---------------------------------------------
	//email체크 (실패시 email을 return 합니다)
	public String emailCheck(String email);
	//회원 등록 (성공 여부를 return 합니다)
	public int insertUser(UserVO user);
	//로그인----------------------------------------- 
	public UserVO userLogin(UserVO user);
	
}