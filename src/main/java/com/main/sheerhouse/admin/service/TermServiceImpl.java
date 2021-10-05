package com.main.sheerhouse.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.mapper.AdminMapper;

@Service
public class TermServiceImpl implements TermService{
	@Autowired
	AdminMapper mapper;
	
	@Override
	public TermVO selectguestterm(TermVO term) {
		term = mapper.selectguestterm(term);
		return term;
	}
	
	@Override
	public TermVO selecthostterm(TermVO term) {
		term = mapper.selecthostterm(term);
		return term;
	}
	
	@Override
	public TermVO selectbasicterm(TermVO term) {
		term = mapper.selectbasicterm(term);
		return term;
	}
}
