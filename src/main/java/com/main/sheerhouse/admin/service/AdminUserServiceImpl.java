package com.main.sheerhouse.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.mapper.AdminUserMapper;
import com.main.sheerhouse.admin.util.PagingVO;
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
	
	@Override
	public int countBoard() {
		return mapper.countBoard();
	}

	@Override
	public int countBoardKey(String result) {
		return mapper.countBoardKey(result);
	}

	@Override
	public List<UserVO> selectBoard(PagingVO vo) {
		System.out.println("서비스 : " + vo);
		return mapper.selectBoard(vo);
	}
	
	@Override
	public List<UserVO> selectBoardList(PagingVO vo) {
		
		return mapper.selectBoardList(vo);
		
	}

	
}
