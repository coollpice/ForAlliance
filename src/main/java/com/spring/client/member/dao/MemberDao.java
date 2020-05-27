package com.spring.client.member.dao;

import com.spring.client.member.vo.MemberVO;

public interface MemberDao {
	public int joinIdCheck(String c_id);
	public int joinEmailCheck(String c_email);
	public int joinSubmit(MemberVO mvo);
	public int loginSubmit(MemberVO mvo);
}
