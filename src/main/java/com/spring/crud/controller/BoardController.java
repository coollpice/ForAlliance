package com.spring.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.crud.service.BoardService;
import com.spring.crud.vo.BoardVO;

import com.spring.common.FileUploadUtil;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시판 리스트 출력
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		System.out.println("게시판 리스트");

		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);

		return "board/boardList";
	}

	// 글쓰기 폼
	@RequestMapping(value = "/writeForm.do", method = RequestMethod.GET)
	public String writeForm() {
		System.out.println("글쓰기 폼");
		return "board/boardWriteForm";
	}

	// 글쓰기
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public int boardWrite(@ModelAttribute BoardVO bvo , HttpServletRequest request) throws IOException {
		System.out.println("글 등록");

		//첨부된파일이 있을경우 폴더생성후 저장
				if(bvo.getFile1()!=null) {
					String board_file = FileUploadUtil.fileUpload(bvo.getFile1(), request, "guild");
					bvo.setBoard_file1(board_file);
				}
				//첨부된파일이 있을경우 폴더생성후 저장
				if(bvo.getFile2()!=null) {
					String board_file2 = FileUploadUtil.fileUpload(bvo.getFile2(), request, "guild");
					bvo.setBoard_file2(board_file2);
				}
				if(bvo.getFile3()!=null) {
					String board_image = FileUploadUtil.fileUpload(bvo.getFile3(), request, "guild");
					bvo.setBoard_image(board_image);
				}
		
				
		int result = boardService.boardWrite(bvo);

		if (result == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	//글 상세보기
	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(int board_num, Model model) {
		System.out.println("글 상세보기");
		
		boardService.boardHistory(board_num);
		BoardVO bvo = boardService.boardDetail(board_num);
		
		model.addAttribute("detail",bvo);
			
		return "board/boardDetail";
	}
}
