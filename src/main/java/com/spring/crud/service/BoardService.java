package com.spring.crud.service;

import java.util.List;

import com.spring.crud.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> boardList(); //게시판 리스트
	public int boardWrite(BoardVO bvo); //글 등록폼
	public BoardVO boardDetail(int board_num); //글 상세보기
	public void boardHistory(int board_num); //조회수 
	public int updateBoard(BoardVO bvo); //글 수정하기
}
