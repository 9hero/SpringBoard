package com.last.train;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.service.MemberService;

@Controller
public class BoardController {
	@Autowired
	MemberService msvc;
	
	ModelAndView mav;
	
	@RequestMapping(value="/BoardList")
	public String boardList() {
		String test= "board/BoardList";
		return test;
	}
}
