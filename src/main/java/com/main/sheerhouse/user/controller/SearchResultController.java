package com.main.sheerhouse.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//search result CONTROLLER
@Controller
public class SearchResultController {
	
	@RequestMapping("/searchResult.do")
	public String searchResult() {
		return "search/searchResult";
	}
}
