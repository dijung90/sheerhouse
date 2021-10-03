package com.main.sheerhouse.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.ReservationVO;
import com.main.sheerhouse.user.mapper.UserPaymentMapper;

@Service
public class UserPaymentServiceImpl implements UserPaymentService{

	@Autowired
	private UserPaymentMapper mapper;
	
	@Override
	public void insertHomeReservation(ReservationVO res, String title, String hostEmail) {
		mapper.insertHomeReservation(res, title, hostEmail);
	}
	
}
