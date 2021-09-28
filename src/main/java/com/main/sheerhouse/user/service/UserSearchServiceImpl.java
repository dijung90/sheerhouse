package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;

@Service
public class UserSearchServiceImpl implements UserSearchService {

	@Autowired
	private UserSearchResultMapper mapper;

	@Override
	public List<ResultVO> searchDetailList(String home_seq) {
		return mapper.getDetail(home_seq);
	}



	@Override
	public List<ResultVO> searchResultList(String location) {
		return mapper.getResult(location);
	}


	@Override
	public List<CommentVO> getCommentList(String home_seq) {
		// TODO Auto-generated method stub
		return mapper.getComment(home_seq);
	}

	
	
	

}
