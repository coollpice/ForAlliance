package com.spring.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.member.dao.MemberDao;
import com.spring.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int joinIdCheck(String c_id) {
		return memberDao.joinIdCheck(c_id);
	}
	
	@Override
	public int joinEmailCheck(String c_email) {
		return memberDao.joinEmailCheck(c_email);
	}

	@Override
	public int joinSubmit(MemberVO mvo) {
		int result = 0;
		try {
			result = memberDao.joinSubmit(mvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int loginSubmit(MemberVO mvo) {
		int result = 0;
		try {
			result = memberDao.joinSubmit(mvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}


}
