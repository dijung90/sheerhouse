package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.mapper.UserMypageMapper;

@Service
public class UserMypageServiceImpl implements UserMypageService {

	@Autowired
	private UserMypageMapper mapper;
	
	@Override
	public void userUpdate(UserVO user) {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO selectAll(UserVO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean passwordCheck(UserVO user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<WishListVO> wishlist(WishListVO wish) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WishListVO> wishListShow(WishListVO wish) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ResultVO> showWishLists(String email) {
		// TODO Auto-generated method stub
		return mapper.showWishLists(email);
	}

	@Override
	public List<ReservationInfoVO> showReservationInfo(String email) {
		// TODO Auto-generated method stub
		return mapper.showReservationInfo(email);
	}

	@Override
	public ReservationInfoVO reservationDetail(int apply_num) {
		// TODO Auto-generated method stub
		return mapper.showReservationDetail(apply_num);
	}




}
