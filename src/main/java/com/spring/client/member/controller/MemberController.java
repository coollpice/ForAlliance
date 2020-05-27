package com.spring.client.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	// 회원가입 폼
	@RequestMapping(value="/joinForm.do", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join";
	}
	
	// 회원가입시 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/joinIdCheck.do", method = RequestMethod.GET)
	public String joinIdCheck(@ModelAttribute MemberVO mvo) {
		int result = memberService.joinIdCheck(mvo.getC_id());
		
		if (result == 1) {
			return "1";
		} else {
			return "2";
		}
	}
	
	// 이메일 중복 체크폼
	@RequestMapping(value="/joinEmailCheckForm.do", method = RequestMethod.GET)
	public String joinEmailCheckForm() {
		return "member/pop/joinPop";
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="joinEmailCheck.do", method = RequestMethod.GET)
	public String joinEmailCheck(@ModelAttribute MemberVO mvo) {
		int result = memberService.joinEmailCheck(mvo.getC_email());
		
		if (result == 1) {
			return "1";
		} else {
			return "2";
		}
	}
	
	// 회원가입 처리
	@RequestMapping(value="/joinSubmit.do", method = RequestMethod.POST)
	public String joinSubmit(@ModelAttribute MemberVO mvo) {
		int result = memberService.joinSubmit(mvo);
		
		if (result == 1) {
			return "/member/loginForm.do";
		} else {
			return "redirect:/member/joinForm.do";
		}
	}
	
	// 로그인 폼
	@RequestMapping(value="/loginForm.do")
	public String loginForm() {
		return "member/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginSubmit.do", method = RequestMethod.POST)
	public String loginSubmit(@ModelAttribute MemberVO mvo, HttpSession session) {
		int result = memberService.loginSubmit(mvo);
			
		if (result == 1) {
			session.setAttribute("login_id", mvo.getC_id());
			return "/";
		} else {
			return "redirect:/member/loginForm.do";
		}
	}
}
