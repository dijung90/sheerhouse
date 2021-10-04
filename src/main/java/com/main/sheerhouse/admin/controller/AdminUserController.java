package com.main.sheerhouse.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.admin.service.AdminUserService;
import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private  AdminUserService service;
	
	@GetMapping("/userTable.mdo")
	public String userTable(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value = "result", required = false)String result) {
		
		List<UserVO> userList = new ArrayList<UserVO>();
		if(result == null) {
			
			int total = service.countBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), result);
			model.addAttribute("paging", vo);
			model.addAttribute("userList", service.selectBoard(vo));
			
			System.out.println("컨트롤러: " +service.selectBoard(vo));
			
		}else {
			System.out.println("진입");
			int total = service.countBoardKey(result);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), result);
			
			model.addAttribute("paging", vo);
			model.addAttribute("userList", service.selectBoardList(vo));
			
			System.out.println("컨트롤러: " +service.selectBoardList(vo));
		}
		
		return "admin/tables/userTable";
	}
	
	@PostMapping("/userTable.mdo")
	public String updatestatus(Model model) {
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = service.userListAll();
		model.addAttribute("userList", userList);
		return "redirect:/admin/tables/userTable";
	}

/*	
	@GetMapping("/userResultTable.mdo")
	public String userResultTable(Model model, String result) {
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = service.userResultList(result);
		model.addAttribute("userList", userList);
		return "admin/tables/userTable";
	}
*/
}
