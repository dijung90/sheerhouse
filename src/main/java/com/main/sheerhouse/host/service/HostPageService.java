package com.main.sheerhouse.host.service;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;

public interface HostPageService {
	
	public void hostUpdate(HostVO host);
	
	public List<HomeVO> selectHome(HostVO host);
}
