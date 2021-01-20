package com.last.train;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.train.dto.CommentDTO;
import com.last.train.service.CommentService;



@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Autowired
	public CommentService csvc;
	
	@RequestMapping(value="write")
	public @ResponseBody List<CommentDTO> commentWrite(@ModelAttribute CommentDTO cib ){
		List<CommentDTO> Coment = csvc.commentWrite(cib);
		return Coment;
	}
	@RequestMapping(value="getComment")
	public @ResponseBody List<CommentDTO> getComment(@RequestParam("bnum") String bnum){
		List<CommentDTO> Coment = csvc.getComment(bnum);
		return Coment;
	}
	@RequestMapping(value="deleteComment" , produces = "application/text; charset=utf8")
	public @ResponseBody String deleteComment(@RequestParam("cNum") String cNum) {
		String result = csvc.deleteComment(cNum);
		return result;
	}
	
}
