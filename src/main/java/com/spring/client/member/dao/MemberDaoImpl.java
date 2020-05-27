package com.spring.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int joinIdCheck(String c_id) {
		return session.selectOne("joinIdCheck", c_id);
	}
	
	@Override
	public int joinEmailCheck(String c_email) {
		return session.selectOne("joinEmailCheck", c_email);
	}

	@Override
	public int joinSubmit(MemberVO mvo) {
		return session.insert("joinSubmit", mvo);
	}

	@Override
	public int loginSubmit(MemberVO mvo) {
		return session.insert("loginSubmit", mvo);
	}


}
