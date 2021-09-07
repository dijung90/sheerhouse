package com.main.sheerhouse.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//로그인, 회원가입, mypage 관련 컨트롤러 입니다.
@Controller
public class UserController {
	
	@GetMapping("/main.do")
	public void main() {}
	
}
