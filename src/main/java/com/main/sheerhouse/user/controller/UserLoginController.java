package com.main.sheerhouse.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.commons.Sha256;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishlistVO;
import com.main.sheerhouse.user.mapper.UserMypageMapper;
import com.main.sheerhouse.user.service.UserLoginService;
import com.main.sheerhouse.user.service.UserMypage;

//로그인, 회원가입 페이지
@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService service;

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserMypageMapper mypage;
	
	//메인페이지
	@GetMapping("/index.do")
	public void index() {}

	//마이페이지
	@GetMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
	
	@PostMapping("/kakaoUserInfo.do")
	public String naverLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//이메일로 회원가입 여부 체크
		boolean check = service.emailCheck(user.getEmail());
		if(!check) { //중복 이메일이 없으면 회원가입 성공
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);
		
		//세션에 회원정보 저장
		session = request.getSession();
		session.setAttribute("user", user);
		return "index";
	}

	

	@PostMapping("/facebookUserInfo.do")
	public String facebookLoginAndRegist(UserVO user,HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//이메일로 회원가입 여부 체크
		boolean check = service.emailCheck(user.getEmail());
		
		if(!check) { //중복 이메일이 없으면 회원가입 성공
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);

		//세션에 회원정보 저장
		session = request.getSession();
		session.setAttribute("user", user);
		
		return "index";
	}
	
	
	@PostMapping("/googleUserInfo.do")
	public String googleLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//이메일로 회원가입 여부 체크
		boolean check = service.emailCheck(user.getEmail());
		
		if(!check) { //중복 이메일이 없으면 회원가입 성공
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);

		//세션에 회원정보 저장
		session = request.getSession();
		session.setAttribute("user", user);
		
		return "index";
	}
	
	@GetMapping("/sendEmail.do")
	public String emailSend(String email, String code) {
		final MimeMessagePreparator pre = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = 
						new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("sheerhouse25@gmail.com");
				helper.setTo(email);
				helper.setSubject("sheerhouse 인증번호");
				helper.setText("인증번호 : "+ code);
			}
		};
		mailSender.send(pre);
		
		return "forward:/index.do";
	}
	
	@PostMapping("/emailUserInfo.do")
	public String emailLoginAndRegist(Model model,WishlistVO wish, UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		user.setPassword(Sha256.encrypt(user.getPassword()));
		
		if(!emailCheck) { //중복 이메일이 없으면 회원가입 성공
			user.setEmailConfirm(true);
			service.insertUser(user);
		}
		
		boolean passwordCheck= service.passwordCheck(user);
		if(!passwordCheck) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인에 실패하였습니다.');location.href='index.do'</script>");
			out.flush();
			return "index";
		}

		user = service.selectUserInfo(user);
		//세션에 회원정보 저장
		session = request.getSession();
		session.setAttribute("user", user);
		model.addAttribute("wish", mypage.wishlist(wish));
		System.out.println("wish" + mypage.wishlist(wish));
		session.setAttribute("wish", model);
		System.out.println(session.getAttribute("wish"));
		System.out.println(user.getRole());
		return "redirect:/index.do";
		
	}
	@RequestMapping("/searchEmail.do")
	@ResponseBody
	public String searchEmail(UserVO user) {
		boolean emailCheck = service.emailCheck(user.getEmail());
		String result = String.valueOf(emailCheck);
		return result;
	}
	
	@PostMapping("/passwordUpdate.do")
	public String passwordUpdate(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(user.toString());
		user.setPassword(Sha256.encrypt(user.getPassword()));
		boolean result = service.passwordUpdate(user);
		
		if(result) {
			session = request.getSession();
			session.setAttribute("user", user);
			return "redirect:/index.do";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('패스워드 변경에 실패하였습니다. 다시 시도해주세요.');location.href='index.do'</script>");
		out.flush();
		return "index";
	}
}	
