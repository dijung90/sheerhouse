package com.main.sheerhouse.user.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.service.UserService;

//�α���, ȸ������, mypage ���� ��Ʈ�ѷ� �Դϴ�.
@Controller
@RequestMapping(value = "/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//���� ������
	@GetMapping("/index.do")
	public void index() {}
	
	//����������
	@GetMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
	
	@Autowired
	private UserService userservice;
	// 로그인
	@RequestMapping(value = "index.do", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr)throws Exception{
		System.out.println("로그인 기능 진입");
		System.out.println("입력데이터"+user);
		
		HttpSession session = request.getSession();		
		UserVO uvo = userservice.userLogin(user);

		if(uvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/index.do";
        }     
        session.setAttribute("user", uvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)     
        return "redirect:/mypage.do";
	}
}
