package com.main.sheerhouse.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//로그인, 회원가입, mypage 관련 컨트롤러 입니다.
@Controller
public class UserController {
	
	//메인 페이지
	@GetMapping("/index.do")
	public void index() {}
	
	//마이페이지
	@GetMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
}
