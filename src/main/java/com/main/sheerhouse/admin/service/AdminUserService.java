package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.user.domain.UserVO;

public interface AdminUserService {
	
	public List<UserVO> userListAll();

	public List<UserVO> userResultList(String result);
	
	
}
