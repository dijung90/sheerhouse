package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.domain.NoticeVO;



public interface Notice {
	public List<NoticeVO> selectnotice(NoticeVO notice);
}
