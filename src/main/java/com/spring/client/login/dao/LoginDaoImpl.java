package com.spring.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int joinIdCheck(String c_id) {
		return session.selectOne("joinIdCheck", c_id);
	}

}
