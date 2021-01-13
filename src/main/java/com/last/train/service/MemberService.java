package com.last.train.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.MemberDAO;
import com.last.train.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mdao;
	
	ModelAndView mav;
	
	public ModelAndView doJoin(MemberDTO mib) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile userProfile = mib.getUserProfile();
		String userProfileName = userProfile.getOriginalFilename();
		userProfileName = System.currentTimeMillis() + "_" + userProfileName;
		
		String savePath =
		"C:\\Users\\rngnl\\Desktop\\스프링\\spring_workspace\\bmTable\\src\\main\\webapp\\resources\\MemberProfile\\"+userProfileName;
		
		if(!userProfile.isEmpty()) {
			userProfile.transferTo(new File(savePath));
		}
		mib.setUserProfileName(userProfileName);
		
		
		int result  = mdao.doJoin(mib);
		if(result>0) {
			mav.addObject("joinDone", "wellDone");
			mav.setViewName("home");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	public String idCheck(String id) {
		String checkedId = mdao.idCheck(id);
		return checkedId;
	}

	public ModelAndView boardList() {
		mav = new ModelAndView();
		List<MemberDTO> boardList = mdao.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("BoardList");
		return mav;
	}
}
