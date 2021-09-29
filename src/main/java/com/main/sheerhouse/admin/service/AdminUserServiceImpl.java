package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.mapper.AdminUserMapper;
import com.main.sheerhouse.user.domain.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService{

	@Autowired
	private AdminUserMapper mapper;
	
	@Override
	public List<UserVO> userListAll() {
		
		return mapper.userListAll();
	}
	
	@Override
	public List<UserVO> userResultList(String result) {
		
		return mapper.userResultList(result);
	}
	
	}
