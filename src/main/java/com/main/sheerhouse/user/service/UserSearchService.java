package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;

public interface UserSearchService {
	
	List<ResultVO> searchResultList(String location);
	List<ResultVO> searchDetailList(String home_seq);
	List<CommentVO> getCommentList(String home_seq);
}
