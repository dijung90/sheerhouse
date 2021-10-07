package com.main.sheerhouse.host.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;
import com.main.sheerhouse.host.mapper.HostPageMapper;

@Service
public class HostPageServiceImpl implements HostPageService{

	@Autowired
	private HostPageMapper mapper;
	
	@Override
	public void hostUpdate(HostVO host) {
	
		mapper.hostUpdate(host);
	}

	@Override
	public List<HomeVO> selectHome(HostVO host) {
		List<HomeVO> homeList = mapper.selectHome(host);
		
		return homeList;
	}

	@Override
	public List<HostReservationInfoVO> selectResInfo(int host_seq) {
		
		return mapper.selectResInfo(host_seq);
	}

	@Override
	public List<HostReservationInfoVO> selectHisInfo(int host_seq) {
		
		return mapper.selectHisInfo(host_seq);
	}

	@Override
	public void updateHostAccountUrl(String path, int host_seq) {
		mapper.updateHostAccountUrl(path, host_seq);
	}

	@Override
	public List<SettlementHistotyVO> selectSetList(boolean statusKeyword, int host_seq) {
		return mapper.selectSetList(statusKeyword, host_seq);
	}
	
	
	
}
