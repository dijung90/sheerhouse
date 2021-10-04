package com.main.sheerhouse.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.service.NoticeImpl;



@Controller
public class AdminController {
	
	@Autowired
	NoticeImpl noticeim;
	
	@PostMapping("/newsroom.do")
    public String boardList(@ModelAttribute("noticeVO") NoticeVO notice, Model model) throws Exception{
                
        List<NoticeVO> list = noticeim.selectnotice(notice);
        
        model.addAttribute("Notice", list);
        
        System.out.println(list);
        
        return "user/newsroom";
    }

}
