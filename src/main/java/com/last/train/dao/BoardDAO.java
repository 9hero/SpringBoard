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
	
	
}
