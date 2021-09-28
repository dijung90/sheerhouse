package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.HomeVO;
import com.main.sheerhouse.user.mapper.UserMyPageMapper;

@Service
public class UserMyPageServiceImpl implements UserMyPageService {
	
	@Autowired
	public UserMyPageMapper mapper;
	
	@Override
	public List<HomeVO> getHomeList(HomeVO home) {
		
		return mapper.getHomeList();
		
	}

}
