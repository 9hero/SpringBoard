package com.last.train.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public int doJoin(MemberDAO mib) {
		// TODO Auto-generated method stub
		return sql.insert("member.join",mib);
	}

}
