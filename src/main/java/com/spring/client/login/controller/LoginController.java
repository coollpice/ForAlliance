package com.spring.client.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	// 회원가입 폼
	@RequestMapping(value="/joinForm.do")
	public String joinForm() {
		return "join/join";
	}
	
	// 회원가입시 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/joinIdCheck.do")
	public String joinIdCheck(@ModelAttribute LoginVO lvo) {
		int result = loginService.joinIdCheck(lvo.getC_id());
		
		if (result == 1) {
			return "1";
		} else {
			return "2";
		}
	}
}
