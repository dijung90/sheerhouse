package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.mapper.AdminMapper;

@Service
@Repository
public class NoticeImpl implements Notice{
	@Autowired
	AdminMapper mapper;
	
	@Override
	public List<NoticeVO> selectnotice(NoticeVO notice){
		List<NoticeVO> list = null;
		list= mapper.selectnotice(notice);
		System.out.println(list);
		return list;
	}
}
