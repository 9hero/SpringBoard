package com.last.train;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService bsvc;
	
	ModelAndView mav;
	
	@RequestMapping(value="/BoardList")
	public ModelAndView boardList() {
		mav = bsvc.boardList();
		return mav;
	}
}
