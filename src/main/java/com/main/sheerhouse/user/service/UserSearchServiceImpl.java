package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;

public class UserSearchServiceImpl implements UserSearchService {

	@Autowired
	private UserSearchResultMapper mapper;

	@Override
	public List<ResultVO> searhResultList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.getResult(search);
	}

	/*
	 * @Override public List<ResultVO> searhDetailList(ResultVO result) { // TODO
	 * Auto-generated method stub return mapper.getDetail(result); }
	 */

	@Override
	public List<ResultVO> searhDetailList(SearchVO search) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
//	@Override
//	public List<ResultVO> searhResultList(SearchVO search) {
//		// TODO Auto-generated method stub
//		return mapper.getResult();
//	}
//	@Override
//	public List<ResultVO> searhDetailList(SearchVO search) {
//		// TODO Auto-generated method stub
//		return mapper.getDetail();
//	}
	
	

}
