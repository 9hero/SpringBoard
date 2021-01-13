package com.last.train.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String userEmail;
	private String userAdress;
	private String userPhone;
	private String userProfileName;	
	private MultipartFile userProfile;
}
