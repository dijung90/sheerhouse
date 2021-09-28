package com.main.sheerhouse.host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.service.HostPageService;
import com.main.sheerhouse.host.service.HostRegistService;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class HostPageController {
	
	@Autowired
	private HostPageService service;
	
	@Autowired
	private HostRegistService regService;
	
	@GetMapping("/hostPage.host")
	public String hostPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		HostVO host = regService.hostSelect(user.getEmail());
		List<HomeVO> homeList = service.selectHome(host);
		session.setAttribute("host", host);
		session.setAttribute("homeList", homeList);
		
		return "host/hostPage";
	}
	
	@PostMapping("/hostUpdate.host")
	public String hostUpdate(HostVO host, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		service.hostUpdate(host);
		List<HomeVO> homeList = service.selectHome(host);
		session.setAttribute("host", host);
		session.setAttribute("homeList", homeList);
		return "host/hostPage";
	}
	

	
}
