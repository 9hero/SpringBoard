package com.last.train.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.MemberDAO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mdao;
	
	ModelAndView mav;
	
	public String doJoin(MemberDAO mib) {
		String results = null;
		int result  = mdao.doJoin(mib);
		if(result>0) {
			results = "redirect:/BoardList";
		}else {
			results = "Fail";
		}
		return results;
	}

	public String idCheck(String id) {
		String checkedId = mdao.idCheck(id);
		return checkedId;
	}
}
