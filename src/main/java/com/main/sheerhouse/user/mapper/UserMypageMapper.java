package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;

public interface UserMypageMapper {
	public void userUpdate(UserVO user);
	public UserVO selectAll(UserVO user);
	public String passCheck(UserVO user);
	public List<WishListVO> wishlist(WishListVO wish);
	public List<WishListVO> wishListShow(WishListVO wish);
	
	
	public List<ResultVO> showWishLists(String email);
	public List<ReservationInfoVO> showReservationInfo(String email);
	public ReservationInfoVO showReservationDetail(int apply_num);
	
	public void insertComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
}
