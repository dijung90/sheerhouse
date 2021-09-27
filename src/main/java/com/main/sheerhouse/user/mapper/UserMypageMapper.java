package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishlistVO;

public interface UserMypageMapper {
	public void userUpdate(UserVO user);
	public UserVO selectAll(UserVO user);
	public String passCheck(UserVO user);
	public List<WishlistVO> wishlist(WishlistVO wish);
	public List<WishlistVO> wishListShow(WishlistVO wish);
}
