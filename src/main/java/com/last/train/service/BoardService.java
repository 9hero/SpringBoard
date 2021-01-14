package com.last.train.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.BoardDAO;
import com.last.train.dto.BoardDTO;

@Service
public class BoardService {
	ModelAndView mav;
	
	@Autowired
	BoardDAO bdao;
	
	public ModelAndView boardList() {
		mav = new ModelAndView();
		List<BoardDTO> board = bdao.getBoardList();
		if(board !=null) {
			mav.addObject("BoardList", board);
			mav.setViewName("board/BoardList");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	public ModelAndView boardView(String bnum) {
		mav = new ModelAndView();
		BoardDTO BoardInfo = bdao.getBoardContents(bnum);
		if(BoardInfo != null) {
			mav.addObject("BoardInfo", BoardInfo);
			mav.setViewName("board/BoardView");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

}
