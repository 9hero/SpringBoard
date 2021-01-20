package com.last.train;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dto.BoardDTO;
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
	@RequestMapping(value="/boardView")
	public ModelAndView boardView(@RequestParam("bnum") String bnum) {
		mav = bsvc.boardView(bnum); 
		return mav;
	}
	@RequestMapping(value="/boardModi")
	public ModelAndView boardModi(@RequestParam("bnum") String bnum) {
		mav = bsvc.boardModi(bnum); 
		return mav;
	}
	@RequestMapping(value="/boardModify")
	public ModelAndView boardModify(@ModelAttribute BoardDTO modiInfo) {
		mav = bsvc.boardModify(modiInfo); 
		return mav;
	}
	@RequestMapping(value="/boardDel")
	public ModelAndView boardDel(@RequestParam("bnum") String bnum) {
		mav = bsvc.boardDel(bnum); 
		return mav;
	}	
	@RequestMapping(value="/goWriteForm")
	public String boardWrite() {
		
		return "board/BoardWrite";
	}
	@RequestMapping(value="/boardWrite")
	public ModelAndView boardWrite(@ModelAttribute BoardDTO WriteInfo) throws IllegalStateException, IOException {
		mav = bsvc.boardWrite(WriteInfo); 
		return mav;
	}
	@RequestMapping(value="/BoardPage")
	public ModelAndView boardlistpage(@RequestParam (value="page", required=false,defaultValue="1") int page){		
		mav = bsvc.boardlistpage(page);		
		return mav;
	}
	@RequestMapping(value="/Boardsearch")
	public ModelAndView Boardsearch(@RequestParam (value="page", required=false,defaultValue="1") int page
			,@RequestParam("searchType") String type,@RequestParam("searchWord") String sWord) {
		mav = bsvc.Boardsearch(page,type,sWord);
		return mav;
	}
	
}
