package com.main.sheerhouse.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.List;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.main.sheerhouse.commons.CoolSmsAPI;
import com.main.sheerhouse.commons.ImportAPI;
import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.service.NoticeImpl;
import com.main.sheerhouse.admin.service.TermServiceImpl;
import com.main.sheerhouse.commons.Sha256;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.service.UserLoginService;

//로그인, 회원가입 페이지
@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService service;

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	NoticeImpl noticeim;
	
	@Autowired
	private TermServiceImpl termim;

	//메인페이지
	@GetMapping("/index.do")
	public void index() {}

	//마이페이지
	/*
	 * @GetMapping("/mypage.do") public String mypage() { return "user/mypage"; }
	 */
	
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
	
	@PostMapping("/sendEmail.do")
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
	public String emailLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response, String e_check) throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		user.setPassword(Sha256.encrypt(user.getPassword()));
		
		System.out.println(e_check);
		if(!emailCheck) { //중복 이메일 없으면 회원가입 성공
			user.setEmailConfirm(true);
			service.insertUser(user);
		}else {
			//1정상 2탈퇴 3정지
			int status = service.getUserStatus(user.getEmail());
			if(status == 2 && e_check.equals("")) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('탈퇴처리된 사용자입니다. 이메일 인증 후 다시 가입해주세요');location.href='index.do'</script>");
				out.flush();
				return "index";
			}else if(status == 2 && e_check.equals("check")){	
				service.updateStatus(user.getEmail());
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('정지된 사용자입니다.');location.href='index.do'</script>");
				out.flush();
				return "index";
			}
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
		System.out.println(user);
		return "redirect:/index.do";
		
	}
	
	
	// 헤더 로그인
	@ResponseBody
	@PostMapping("/userLoginHeader.do")
	public String HeaderLogin(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		user.setPassword(Sha256.encrypt(user.getPassword()));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!emailCheck) { //중복 이메일이 없으면 회원가입 성공
			user.setEmailConfirm(true);
			service.insertUser(user);
		}
		
		boolean passwordCheck= service.passwordCheck(user);
		if(!passwordCheck) {
			
			out.print("<script>alert('로그인에 실패하였습니다.');location.href = document.referrer;</script>");
			out.flush();
			return "";
		}
		
		user = service.selectUserInfo(user);
		//세션에 회원정보 저장
		session = request.getSession();
		session.setAttribute("user", user);
		System.out.println(user);
		out.print("<script>alert('로그인에 성공하였습니다.');location.href = document.referrer;</script>");
		out.flush();
		return "";
		
	}

	@RequestMapping("/searchEmail.do")
	public String searchEmail(UserVO user,  HttpServletResponse response)  throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		//중복이메일과 상태가 1일결우 true
		if(!emailCheck) { //중복 이메일 없으면 회원가입 성공
			int status = service.getUserStatus(user.getEmail()); //2, 3 반환
			if(status == 3) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('정지된 사용자입니다.');location.href='index.do'</script>");
				out.flush();
				return "index";
			}
		}
		String result = String.valueOf(emailCheck);
		
		return result;
	}
	
	@PostMapping("/passwordUpdate.do")
	public String passwordUpdate(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		user.setPassword(Sha256.encrypt(user.getPassword()));
		boolean result = service.passwordUpdate(user);
		
		if(result) {
			user = service.selectUserInfo(user);
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
	
	@GetMapping("/logout.do")
	public void logout(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String path = (String)request.getHeader("referer");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('로그아웃 되었습니다.');location.href = document.referrer;</script>");
		out.close();
		session.invalidate();
	
	}
	

	@GetMapping("/newsroom.do")
    public String boardList(@ModelAttribute("noticeVO") NoticeVO notice, Model model) throws Exception{             
        List<NoticeVO> list = noticeim.selectnotice(notice);     
        model.addAttribute("Notice", list);       
        System.out.println(list);       
        return "user/newsroom";
    }
	
	
	@GetMapping("/termcheck.do")
	public String termcheckpage(TermVO term, HttpServletRequest request, HttpSession session, HttpServletResponse response)throws Exception{
		session = request.getSession();
		session.setAttribute("basic", termim.selectbasicterm(term));
		session.setAttribute("guest", termim.selectguestterm(term));
		session.setAttribute("host", termim.selecthostterm(term));
		return "user/termcheck";
	}
	
	@GetMapping("/termaccept.do")
	public String termpage(TermVO term, HttpServletRequest request, HttpSession session, HttpServletResponse response)throws Exception{
		session = request.getSession();
		session.setAttribute("basic", termim.selectbasicterm(term));
		session.setAttribute("guest", termim.selectguestterm(term));
		session.setAttribute("host", termim.selecthostterm(term));
		return "user/termaccept";
	}
}	
