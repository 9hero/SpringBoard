package com.last.train;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.MemberDAO;
import com.last.train.dto.MemberDTO;
import com.last.train.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService msvc;
	
	ModelAndView mav;
	
	@RequestMapping(value="/doJoin")
	public ModelAndView doJoin(@ModelAttribute MemberDTO mib) throws IllegalStateException, IOException {
		mav = msvc.doJoin(mib); 
		return mav;
	}
	
	@RequestMapping(value="/idCheck")
	public @ResponseBody String idCheck(@RequestParam("userId") String id) {		
		String checkedId = msvc.idCheck(id); 
		System.out.println("idCheck 중복 결과값" + checkedId);
		return checkedId;
	}
	@RequestMapping(value="/boardList")
	public ModelAndView boardList() {
		mav=msvc.boardList();
		return mav;
	}
}
