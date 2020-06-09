package com.spring.crud.dao;

import java.util.List;

import com.spring.crud.vo.BoardVO;

public interface BoardDao {
	
	public List<BoardVO> boardList();
	public int boardWrite(BoardVO bvo);
	public BoardVO boardDetail(int board_num); //글 상세보기
	public void boardHistory(int board_num);
	public int updateBoard(BoardVO bvo); //글 수정하기
}
