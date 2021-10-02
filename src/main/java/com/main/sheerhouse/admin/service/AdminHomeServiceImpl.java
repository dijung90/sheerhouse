package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.mapper.AdminHomeMapper;
import com.main.sheerhouse.user.domain.HomeVO;

@Service
public class AdminHomeServiceImpl implements AdminHomeService{
	
	@Autowired
	private AdminHomeMapper mapper;
	
	@Override
	public List<HomeVO> homeListAll() {
		
		return mapper.homeListAll();
	}

}
