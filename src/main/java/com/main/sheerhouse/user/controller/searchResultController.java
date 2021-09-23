package com.main.sheerhouse.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;

//searchResult CONTROLLER
@Controller
public class searchResultController {
	
	@Autowired
	private UserSearchResultMapper resultMapper;
	
	@RequestMapping("/searchResult.do")
	public String searchResult(Model model, ResultVO result, SearchVO search, @RequestParam("searchLocation") String location, @RequestParam("searchCheckin") String checkin, 
			@RequestParam("searchCheckout") String checkout, @RequestParam("searchMaxPeople") String people) {
		//SearchVO search = new SearchVO();
		System.out.println(location);
		System.out.println(checkin);
		System.out.println(checkout);
		System.out.println(people);

		model.addAttribute("location", location);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("people", people);
		model.addAttribute("resultList", resultMapper.getResult(search));
		System.out.println("resultList" + resultMapper.getResult(search));
		return "search/searchResult";
	}
	
	@RequestMapping("/searchResultDetail.do")
	public String resultDatail(Model model, ResultVO result, @RequestParam("home_seq") String home_seq , @RequestParam("title") String title) {
		System.out.println(home_seq);
		System.out.println(title);
		
		model.addAttribute("home_seq", home_seq);
		model.addAttribute("title", title);
		model.addAttribute("DetailInfo", resultMapper.getDetail(result));
		return "search/searchResultDetail";
	}
}
