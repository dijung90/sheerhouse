package com.main.sheerhouse.user.service;

import java.sql.Date;
import java.util.List;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishlistVO;

public interface UserMypage {
	public void userUpdate(UserVO user);
	public UserVO selectAll(UserVO user);
	public boolean passwordCheck(UserVO user);
	public List<WishlistVO> wishlist(WishlistVO wish);
	public List<WishlistVO> wishListShow(WishlistVO wish) ;

}