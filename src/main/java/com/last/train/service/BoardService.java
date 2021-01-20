package com.last.train.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.last.train.dao.BoardDAO;
import com.last.train.dto.BoardDTO;
import com.last.train.dto.PageDTO;

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
		int hit = bdao.viewHit(bnum);
		if(BoardInfo != null && hit>0) {			
			mav.addObject("BoardInfo", BoardInfo);
			mav.setViewName("board/BoardView");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	public ModelAndView boardModi(String bnum) {
		mav = boardView(bnum);		
		mav.setViewName("board/BoardModiForm");
		//사용자가 상세보기 페이지에서 수정을 눌렀을 때 관리자가 삭제한 상태라면 오류
		return mav;
	}

	public ModelAndView boardModify(BoardDTO modiInfo) {		
		int UpdateResult = bdao.boardModify(modiInfo);
		if(UpdateResult>0) {
			mav = boardView(modiInfo.getBNUMBER());
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}
	
	public ModelAndView boardDel(String bnum) {
		mav = new ModelAndView();		
		int DelResult  = bdao.boardDel(bnum);
		if(DelResult>0) {
			mav.setViewName("redirect:/BoardPage");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	public ModelAndView boardWrite(BoardDTO writeInfo) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile bfile = writeInfo.getBFILE();
		String bFileName = bfile.getOriginalFilename();
		bFileName = System.currentTimeMillis() + "_" + bFileName;//구분용 현재시간ms단위로 앞에 추가
		String savePath = "C:\\Users\\rngnl\\Desktop\\스프링\\spring_workspace\\bmTable\\src\\main\\webapp\\resources\\BoardFile\\"+bFileName;		
		if(!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath));
			
		}writeInfo.setBFILENAME(bFileName);
		
		int InsertResult = bdao.boardWrite(writeInfo);
		if(InsertResult>0) {
			mav.setViewName("redirect:/BoardPage");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}
	private static final int rowPP = 10; //rowPerPage 페이지 당 게시글 갯수
	private static final int pbuttonPP = 5; //pageButtomPerPage 페이지 버튼 갯수 1~5, 6~10
	public PageDTO paging(int totalRowNum,int page) {
		PageDTO pto = new PageDTO();
		int gRow_lo = (page-1)*rowPP+1; //getRow_lowRange
		pto.setGRow_lo(gRow_lo);
		// 가져올 범위중 높은 숫자 10,20,30......
		int gRow_Hi = page*rowPP; //getRow_HighRange
		pto.setGRow_Hi(gRow_Hi);
		int lastPage = (int)Math.ceil((double)totalRowNum/(double)rowPP);
		pto.setLastPage(lastPage);
		int pageBtnStart = (int)Math.ceil((double)page/(double)pbuttonPP)*pbuttonPP-pbuttonPP+1; //1,6,11버튼
		int pageBtnEnd = (int)Math.ceil((double)page/(double)pbuttonPP)*pbuttonPP; // 5,10,15...마지막		
		pto.setPageBtnStart(pageBtnStart);
		pto.setPageBtnEnd(pageBtnEnd);
		if(pageBtnEnd >= lastPage) {
			pto.setPageBtnEnd(lastPage);
		}pto.setPage(page);
		return pto;
	}

	public ModelAndView boardlistpage(int page) {
		mav = new ModelAndView();
		int totalRowNum= bdao.getCountRow();
		PageDTO pto = paging(totalRowNum,page);
		List<BoardDTO> boardList = bdao.getBoardPaged(pto);
		if(boardList != null) {
		mav.addObject("BoardList", boardList);
		mav.addObject("page",pto);
		mav.setViewName("board/BoardPage");
		}else{
			mav.setViewName("Fail");
		}
		return mav;
	}

	public ModelAndView Boardsearch(int page, String type, String sWord) {
		mav = new ModelAndView();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("type", type);
		searchMap.put("word", sWord);
		int totalRowNum = bdao.CountSearch(searchMap);
		
		if(totalRowNum>0) {
			PageDTO pto = paging(totalRowNum,page);	
			searchMap.put("RL", pto.getGRow_lo());
			searchMap.put("RH", pto.getGRow_Hi());
			
			List<BoardDTO> list= bdao.boardSearch(searchMap);
			
			if(list != null) {
			mav.addObject("page",pto);
			mav.addObject("BoardList", list);
			mav.setViewName("board/BoardPage");
			}else {
				mav.setViewName("Fail");
			}
		}else {
			mav.setViewName("board/BoardList");
		}		
		return mav;
	}

	public ModelAndView HaveWrited(int page ,String uid) {
		mav = new ModelAndView();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		int totalRowNum= bdao.MygetCountRow(uid);
		PageDTO pto = paging(totalRowNum,page);
		searchMap.put("RL", pto.getGRow_lo());
		searchMap.put("RH", pto.getGRow_Hi());		
		searchMap.put("uid", uid);
		
		List<BoardDTO> boardList = bdao.getMyBoardPaged(searchMap);
		if(boardList != null) {
		mav.addObject("BoardList", boardList);
		mav.addObject("page",pto);
		mav.setViewName("board/BoardPage");
		}else{
			mav.setViewName("Fail");
		}
		return mav;	
	}

}
