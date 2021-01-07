package com.last.train;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.MemberDAO;
import com.last.train.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService msvc;
	
	ModelAndView mav;
	
	@RequestMapping(value="/DoJoin")
	public String doJoin(@ModelAttribute MemberDAO mib) {
		String result;
		result = msvc.doJoin(mib); 
		return result;
	}
	
}
