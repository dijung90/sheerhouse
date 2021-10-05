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
import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.service.UserLoginService;
import com.main.sheerhouse.user.service.UserMypageService;
import com.main.sheerhouse.user.service.UserSearchService;

@Controller
public class UserMypageController {

	@Autowired
	private UserMypageService service;
	
	@Autowired
	private UserSearchService userService;

	@RequestMapping(value="/updateUser.do",method =  RequestMethod.POST)
	public String updatemypage(WishListVO wish, HttpServletRequest req,UserVO user,HttpSession session,HttpServletResponse res) throws Exception{
			service.userUpdate(user);
			
			user = service.selectAll(user);
			session = req.getSession();
			session.setAttribute("user", user);
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(user.getPhone());
			System.out.println(user.getBirthday());
			System.out.println("wishList" + service.wishlist(wish));
			System.out.println(session.getAttribute("wish"));
			return "redirect:/mypage.do";

	}
	
	@GetMapping("/mypage.do")
	public String showWishlist(WishListVO wish, ResultVO result, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		session.setAttribute("user", user);
		System.out.println(wish);
		String email = user.getEmail();
		System.out.println(email);
		model.addAttribute("wishList", service.showWishLists(email));
		System.out.println("wishList" + service.showWishLists(email));
		model.addAttribute("reservationlist", service.showReservationInfo(email));
		System.out.println("reservation" + service.showReservationInfo(email));
			return "user/mypage";
		}
	
	
	
	
	
	@RequestMapping("/mypageBookingInfo.do")
	public String showBookingDetail(Model model, ResultVO result, @RequestParam("home_seq") String home_seq ,@RequestParam("apply_num") int apply_num){
		
		model.addAttribute("bookingDetail",service.reservationDetail(apply_num));
		model.addAttribute("hostEmail", userService.searchHostEmail(home_seq));
		System.out.println("show detail reservation " +service.reservationDetail(apply_num));
		System.out.println(userService.searchHostEmail(home_seq));
		return "user/mypageBookingDetail";
	}
	

	
	
}