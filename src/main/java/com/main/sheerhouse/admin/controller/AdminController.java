package com.main.sheerhouse.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/index.mdo")
	public String index() {
		return "admin/index";
	}
	
	
	
}
