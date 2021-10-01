package com.main.sheerhouse.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.user.domain.ReservationVO;

public interface UserPaymentMapper {

	public void insertHomeReservation(@Param("res")ReservationVO res, @Param("title") String title, @Param("hostEmail") String hostEmail);
}
