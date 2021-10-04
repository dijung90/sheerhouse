package com.main.sheerhouse.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.sheerhouse.admin.service.AdminHomeService;
import com.main.sheerhouse.user.domain.HomeVO;


@Controller
public class AdminHomeController {
	
	@Autowired
	private AdminHomeService service;
	
	@GetMapping("/homeTable.mdo")
	public String userTable(Model model) {
		
		List<HomeVO> homeList = new ArrayList<HomeVO>();
		homeList = service.homeListAll();
		model.addAttribute("homeList", homeList);
		return "admin/tables/homeTable";
	}

}
