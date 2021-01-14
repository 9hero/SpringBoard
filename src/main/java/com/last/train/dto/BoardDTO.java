package com.last.train.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private String BNUMBER;
	private String BWRITER;
	private String BPASSWORD;
	private String BTITLES;
	private String BCONTENTS;
	private String BDATE;
	private String BHITS;
	
	private MultipartFile BFILE;
	private String BFILENAME;
}
