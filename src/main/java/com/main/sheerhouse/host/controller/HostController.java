package com.main.sheerhouse.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HostController {
	
	//ȣ��Ʈ ����
	@GetMapping("/homes.host")
	public String homes() {
		return "host/host";
	}
	
	//���ҵ��
	@GetMapping("/register.host")
	public String register() {
		return "host/hostregister";
	}
}
