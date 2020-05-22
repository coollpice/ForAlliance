package com.spring.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.crud.service.BoardService;
import com.spring.crud.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
		
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		System.out.println("게시판 리스트");
		
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList",boardList);
		
		return "board/boardList";
	}

}
