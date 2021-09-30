package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.user.domain.UserVO;

public interface AdminUserService {
	
	public List<UserVO> userListAll();
	
	// 게시물 총 갯수
	public int countBoard();

	public int countBoardKey(String result);
	// 페이징 처리 게시글 조회
	public List<UserVO> selectBoard(PagingVO vo);

	public List<UserVO> userResultList(String result);
	
	public List<UserVO> selectBoardList(PagingVO vo);

	
}
