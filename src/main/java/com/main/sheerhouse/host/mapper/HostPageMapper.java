package com.main.sheerhouse.host.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;

public interface HostPageMapper {
	public void hostUpdate(HostVO host);
	
	public List<HomeVO> selectHome(HostVO host);
	
	public List<HostReservationInfoVO> selectResInfo(int host_seq);
	
	public List<HostReservationInfoVO> selectHisInfo(int host_seq);
	
	public void updateHostAccountUrl(@Param("path") String path, @Param("host_seq") int host_seq);
	
	public List<SettlementHistotyVO> selectSetList(@Param("statusKeyword")boolean statusKeyword, 
													@Param("host_seq") int host_seq);
}
