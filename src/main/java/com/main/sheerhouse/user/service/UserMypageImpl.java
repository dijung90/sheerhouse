package com.main.sheerhouse.user.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishlistVO;
import com.main.sheerhouse.user.mapper.UserMypageMapper;
@Service
public class UserMypageImpl implements UserMypage{
	
	@Autowired
	private UserMypageMapper mapper;
	
	@Override
	public void userUpdate(UserVO user) {
		mapper.userUpdate(user);
	}
	
	@Override
	public UserVO selectAll(UserVO user) {
		user = mapper.selectAll(user);
		return user;
	}
	
	@Override
	public boolean passwordCheck(UserVO user) {
		boolean result = false;
		String passCheck = mapper.passCheck(user);
		if(user.getPassword().equals(passCheck)) {
			return true;
		}
		return result;
	}
	
	@Override
	public List<WishlistVO> wishListShow(WishlistVO wish){
		return mapper.wishListShow(wish);
	}
	
	@Override
	public List<WishlistVO> wishlist(WishlistVO wish) {
		return mapper.wishlist(wish);
	}
}