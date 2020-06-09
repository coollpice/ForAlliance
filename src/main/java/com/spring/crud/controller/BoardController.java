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
import org.springframework.web.bind.annotation.RequestParam;
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
	public int boardWrite(@ModelAttribute BoardVO bvo, HttpServletRequest request, @RequestParam("check") List<String> check) throws IOException {
		System.out.println("글 등록");
		
		for(String i : check) {
			System.out.println(i);
		}
			
		// 첨부된파일이 있을경우 폴더생성후 저장
		if (bvo.getFile1() != null) {
			String board_file = FileUploadUtil.fileUpload(bvo.getFile1(), request, "guild");
			bvo.setBoard_file1(board_file);
		}
		// 첨부된파일이 있을경우 폴더생성후 저장
		if (bvo.getFile2() != null) {
			String board_file2 = FileUploadUtil.fileUpload(bvo.getFile2(), request, "guild");
			bvo.setBoard_file2(board_file2);
		}
		if (bvo.getFile3() != null) {
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

	// 글 상세보기
	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(int board_num, Model model) {
		System.out.println("글 상세보기");

		boardService.boardHistory(board_num);
		BoardVO bvo = boardService.boardDetail(board_num);

		model.addAttribute("detail", bvo);

		return "board/boardDetail";
	}

	// 글 수정 폼
	@RequestMapping(value = "/boardUpdateForm.do")
	public String boardUpdateForm(int board_num, Model model) {
		System.out.println("글 수정 폼");
		BoardVO bvo = boardService.boardDetail(board_num);
		model.addAttribute("update", bvo);

		return "board/boardUpdate";
	}

	// 글 수정하기
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdate(BoardVO bvo, HttpServletRequest request) throws IOException {
		System.out.println("글 수정하기");

		// 수정할떄 파일이 변경되면 기존 파일은 삭제되고 새로운파일로 등록됨
		if (!bvo.getFile3().isEmpty()) {
			if (!bvo.getBoard_image().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getBoard_image(), request);
			}
			String board_image = FileUploadUtil.fileUpload(bvo.getFile3(), request, "guild");
			bvo.setBoard_image(board_image);
		}

		// 파일선택을 안했을시에는 전에있던 파일명으로 파일이름을 설정한다.
		// DB에는 파일이름이 스트링으로 들어감 다운로드시 파일이름으로 접근해서 다운로드받으므로
		// 파일 수정없이 내용만수정해도 전에 파일이름이 들어가기때문에 다운로드가능
		if (bvo.getFile3().isEmpty()) {
			bvo.setBoard_image(bvo.getBoard_image());
		}

		int result = boardService.updateBoard(bvo);

		if (result == 1) {
			return "1";
		} else {
			return "0";
		}

	}

}
