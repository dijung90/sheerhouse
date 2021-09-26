package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;

public interface UserSearchResultMapper {

	public List<ResultVO> getResult(SearchVO search);
	
	public List<ResultVO> getDetail(ResultVO result);
	
	public List<CommentVO> getComment(ResultVO result);
}