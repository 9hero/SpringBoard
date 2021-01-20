package com.last.train.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.train.dto.CommentDTO;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	public int commentWrite(CommentDTO cib) {
		// TODO Auto-generated method stub
		System.out.println(cib);
		return sql.insert("comment.write", cib);
	}

	public List<CommentDTO> getComment(String cbNumber) {
		// TODO Auto-generated method stub
		return sql.selectList("comment.getComment",cbNumber);
	}

	public int deleteComment(String cNum) {
		// TODO Auto-generated method stub
		return sql.delete("comment.del",cNum);
	}

}
