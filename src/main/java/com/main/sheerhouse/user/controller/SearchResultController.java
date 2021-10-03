package com.main.sheerhouse.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;
import com.main.sheerhouse.user.service.UserSearchService;

//searchResult CONTROLLER
@Controller
public class SearchResultController {
	
	@Autowired
	private UserSearchResultMapper resultMapper;
	
	@Autowired
	private UserSearchService service;
	
	@GetMapping("/searchResult.do")
	public String searchResult(Model model, ResultVO result, SearchVO search, @RequestParam("searchLocation") String location, @RequestParam("searchCheckin") String checkin, 
			@RequestParam("searchCheckout") String checkout, @RequestParam("searchMaxPeople") String people) {
		
		System.out.println(location);
		System.out.println(checkin);
		System.out.println(checkout);
		System.out.println(people);
		
		
		
		model.addAttribute("location", location);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("people", people);
		model.addAttribute("resultList", service.searchResultList(location));
		System.out.println("resultList" + service.searchResultList(location));
		
		return "search/searchResult";
	}
	
	@RequestMapping("/searchResultDetail.do")
	public String resultDatail(Model model, ResultVO result, SearchVO search, @RequestParam("home_seq") String home_seq , @RequestParam("title") String title) {
		System.out.println(home_seq);
		System.out.println(title);
		
		model.addAttribute("home_seq", home_seq);
		model.addAttribute("title", title);
		model.addAttribute("DetailInfo", resultMapper.getDetail(home_seq));
		System.out.println(resultMapper.getDetail(home_seq));
		model.addAttribute("CommentInfo", resultMapper.getComment(home_seq));
		System.out.println("CommentInfo" + resultMapper.getComment(home_seq));
		return "search/searchResultDetail";
	}
}