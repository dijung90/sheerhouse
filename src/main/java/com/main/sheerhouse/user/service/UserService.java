package com.main.sheerhouse.user.service;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserService {
	//ȸ������ -------------------------------------------------
	//�̸���üũ
	public boolean emailCheck(String email);
	//ȸ������
	public boolean insertUser(UserVO user);
	
}
