package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;

public interface UserSearchResultMapper {

	public List<ResultVO> getResult(String location);
	
	public List<ResultVO> getDetail(String home_seq);
	
	public List<CommentVO> getComment(String home_seq);
	
	public String searchHostEmail(String home_seq);
}
