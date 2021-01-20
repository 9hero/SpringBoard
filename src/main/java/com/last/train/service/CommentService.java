package com.last.train.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.train.dao.CommentDAO;
import com.last.train.dto.CommentDTO;

@Service
public class CommentService {
	
	@Autowired
	CommentDAO cdao;
	
	public List<CommentDTO> commentWrite(CommentDTO cib) {
		List<CommentDTO> list = null;
		int result = cdao.commentWrite(cib);		
		if(result>0) {
		list = cdao.getComment(cib.getCbNumber());		
		}
		return list;
	}

	public List<CommentDTO> getComment(String bnum) {
		List<CommentDTO> list = null;
		list = cdao.getComment(bnum);				
		return list;
		
	}

	public String deleteComment(String cNum) {
		int result = cdao.deleteComment(cNum);
		String message = null;
		if(result>0) {
			message = "댓글삭제 완료";
		}else {
			message = "댓글삭제 실패";
		}
		return message;
	}
	

}
