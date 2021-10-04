package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;

public interface AdminMapper {
	public List<NoticeVO> selectnotice(NoticeVO notice);
	public TermVO selectguestterm(TermVO guestterm);
	public TermVO selecthostterm(TermVO hostterm);
	public TermVO selectbasicterm(TermVO basicterm);
}

