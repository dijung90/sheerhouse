package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.mapper.UserWishListMapper;
import com.mysql.cj.protocol.Resultset;

@Service
public class UserWishListServiceImpl implements UserWishListService {

	@Autowired
	UserWishListMapper mapper;
	
	@Override
	public String wishlist(WishListVO wish) {
		try {
			
			mapper.insertWishList(wish);
			System.out.println("selected");
			return "selected";
		}catch(DataAccessException e) {
//			e.printStackTrace();
			mapper.deleteWishlist(wish);
			System.out.println("unselected");
			return "unselected";
		}
	}

}
