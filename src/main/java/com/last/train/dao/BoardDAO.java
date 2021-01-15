package com.last.train.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.train.dto.BoardDTO;

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

}
