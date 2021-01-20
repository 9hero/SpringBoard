package com.last.train.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.MemberDAO;
import com.last.train.dto.MemberDTO;

@Service
public class MemberService {
	ModelAndView mav;
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpSession session;
	
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


	public String doLogin(MemberDTO mib) {
		String destination = null;
		MemberDTO userInfo = mdao.doLogin(mib);
		if(userInfo != null) {
		session.setAttribute("userName", userInfo.getUserName());
		session.setAttribute("userID", userInfo.getUserId());
		destination = "redirect:/BoardPage";
		}else {
			destination = "Fail";
		}
		return destination;
	}

	public ModelAndView myPage(String uid) {
		mav = new ModelAndView();
		MemberDTO userInfo = mdao.getMyInfo(uid);
		if(userInfo != null) {
			mav.addObject("uib", userInfo);
			mav.setViewName("member/MyPage");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}
}
