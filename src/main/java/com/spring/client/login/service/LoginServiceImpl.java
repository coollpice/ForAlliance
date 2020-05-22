package com.spring.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.login.dao.LoginDao;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDao loginDao;
	
	@Override
	public int joinIdCheck(String c_id) {
		return loginDao.joinIdCheck(c_id);
	}

}
