package com.main.sheerhouse.host.mapper;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;

public interface HostPageMapper {
	public void hostUpdate(HostVO host);
	
	public List<HomeVO> selectHome(HostVO host);
}
