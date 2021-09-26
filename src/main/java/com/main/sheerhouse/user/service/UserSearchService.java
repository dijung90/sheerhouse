package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;

public interface UserSearchService {
	
	//List<ResultVO> searhResultList(SearchVO search);
	List<ResultVO> searhResultList(SearchVO search);
	List<ResultVO> searhDetailList(SearchVO search);
	
	List<CommentVO> getCommentList(ResultVO result);
}
