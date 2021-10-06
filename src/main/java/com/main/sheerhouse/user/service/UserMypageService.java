package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;

public interface UserMypageService {
	
	public void userUpdate(UserVO user);
	public UserVO selectAll(UserVO user);
	public boolean passwordCheck(UserVO user);
	public List<WishListVO> wishlist(WishListVO wish);
	public List<WishListVO> wishListShow(WishListVO wish);
	
	public List<ResultVO> showWishLists(String email);
	public List<ReservationInfoVO> showReservationInfo(String email);
	
	public ReservationInfoVO reservationDetail(int apply_num);
	
	public String insertComment(CommentVO comment);
	public String deleteComment(CommentVO comment);

}
