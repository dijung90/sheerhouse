package com.main.sheerhouse.user.controller;

import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.commons.Sha256;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishlistVO;
import com.main.sheerhouse.user.service.UserLoginService;
import com.main.sheerhouse.user.service.UserMypage;
@Controller
public class UserMypageController {

	@Autowired
	private UserMypage mypage;

	@RequestMapping(value="/updateUser.do",method =  RequestMethod.POST)
	public String updatemypage(WishlistVO wish, HttpServletRequest req,UserVO user,HttpSession session,HttpServletResponse res) throws Exception{
			mypage.userUpdate(user);
			
			user = mypage.selectAll(user);
			session = req.getSession();
			session.setAttribute("user", user);
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(user.getPhone());
			System.out.println(user.getBirthday());
			System.out.println("wishList" + mypage.wishlist(wish));
			System.out.println(session.getAttribute("wish"));
			return "redirect:/mypage.do";

	}

}
	
