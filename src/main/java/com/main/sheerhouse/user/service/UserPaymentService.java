package com.main.sheerhouse.user.service;

import com.main.sheerhouse.user.domain.ReservationVO;

public interface UserPaymentService {

	public void insertHomeReservation(ReservationVO res, String title, String hostEmail);
}
