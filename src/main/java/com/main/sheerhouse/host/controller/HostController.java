package com.main.sheerhouse.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HostController {
	
	//호스트 메인
	@GetMapping("/homes.host")
	public String homes() {
		return "host/host";
	}
	
	//숙소등록
	@GetMapping("/register.host")
	public String register() {
		return "host/hostregister";
	}
}
