package com.main.sheerhouse.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//�α���, ȸ������, mypage ���� ��Ʈ�ѷ� �Դϴ�.
@Controller
public class UserController {
	
	//���� ������
	@GetMapping("/index.do")
	public void index() {}
	
	//����������
	@GetMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
}
