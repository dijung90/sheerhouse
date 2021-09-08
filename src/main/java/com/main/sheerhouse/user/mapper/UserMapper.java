package com.main.sheerhouse.user.mapper;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserMapper {
	// 로그인
	public UserVO userLogin(UserVO user);
	
}
