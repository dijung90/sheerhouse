package com.main.sheerhouse.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HostController {
	
	@GetMapping("/homes.host")
	public String homes() {
		return "host/host";
	}
	
	@GetMapping("/hostRegulation.host")
	public String regulation() {
		return "host/hostRegulation";
	}

	@GetMapping("/register.host")
	public String register() {
		return "host/hostregister";
	}
}
