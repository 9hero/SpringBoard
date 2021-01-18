package com.last.train.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.train.dto.BoardDTO;
import com.last.train.dto.PageDTO;

@Repository
public class BoardDAO {
	@Autowired
	SqlSessionTemplate sql;

	public List<BoardDTO> getBoardList() {
		// TODO Auto-generated method stub
		return sql.selectList("board.List");
	}

	public BoardDTO getBoardContents(String bnum) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.View",bnum);
	}

	public int boardModify(BoardDTO modiInfo) {
		System.out.println(modiInfo+"DAO");
		return sql.update("board.Modi", modiInfo);
	}

	public int boardDel(String bnum) {
		// TODO Auto-generated method stub
		return sql.delete("board.Delete",bnum);
	}

	public int boardWrite(BoardDTO writeInfo) {
		// TODO Auto-generated method stub
		System.out.println(writeInfo +"DAO");
		return sql.insert("board.Write",writeInfo);
	}

	public int getCountRow() {
		// TODO Auto-generated method stub
		return sql.selectOne("board.CountRow");
	}

	public List<BoardDTO> getBoardPaged(PageDTO pto) {
		// TODO Auto-generated method stub
		return sql.selectList("board.PagedList",pto);
	}

	public int viewHit(String bnum) {
		// TODO Auto-generated method stub
		return sql.update("board.upHit",bnum);
	}
	
	public List<BoardDTO> boardSearch(String type,String sWord) {
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("type", type);
		searchMap.put("word", sWord);
		return sql.selectList("board.search",searchMap);
	}
		
		
}
