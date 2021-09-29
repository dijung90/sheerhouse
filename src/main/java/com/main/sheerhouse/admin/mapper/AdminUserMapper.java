package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.UserVO;

public interface AdminUserMapper {
	
	public List<UserVO> userListAll();
	
	public List<UserVO> userResultList(String result);
	
	
}
