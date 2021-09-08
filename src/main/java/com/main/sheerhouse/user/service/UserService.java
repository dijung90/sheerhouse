package com.main.sheerhouse.user.service;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserService {
	public UserVO userLogin(UserVO user) throws Exception;
}
