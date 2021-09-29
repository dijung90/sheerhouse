package com.main.sheerhouse.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.admin.service.AdminUserService;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private  AdminUserService service;
	
	@GetMapping("/userTable.mdo")
	public String userTable(Model model) {
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = service.userListAll();
		model.addAttribute("userList",userList);
		
		return "admin/tables/userTable";
	}
	
	@GetMapping("/userResultTable.mdo")
	public String userResultTable(Model model, String result) {
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = service.userResultList(result);
		model.addAttribute("userList",userList);
		return "admin/tables/userTable";
	}
	
	
	

}
