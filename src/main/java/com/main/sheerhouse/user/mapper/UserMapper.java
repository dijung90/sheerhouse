package com.main.sheerhouse.user.mapper;

import com.main.sheerhouse.user.domain.UserVO;


public interface UserMapper {

	//ȸ������ ---------------------------------------------
	//emailüũ (���н� email�� return �մϴ�)
	public String emailCheck(String email);
	//ȸ�� ��� (���� ���θ� return �մϴ�)
	public int insertUser(UserVO user);
	//�α���----------------------------------------- 
	public UserVO userLogin(UserVO user);
	
}