package com.last.train.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.train.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public int doJoin(MemberDAO mib) {
		// TODO Auto-generated method stub
		return sql.insert("member.join",mib);
	}

	public String idCheck(String id) {
		// TODO Auto-generated method stub
		return sql.selectOne("member.idCheck", id);
	}

	public List<MemberDTO> boardList() {
		// TODO Auto-generated method stub
		return sql.selectList("member.boardList");
	}

}
