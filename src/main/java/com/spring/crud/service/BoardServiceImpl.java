package com.spring.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.crud.dao.BoardDao;
import com.spring.crud.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVO> boardList() {
		return boardDao.boardList();
	}

	@Override
	public int boardWrite(BoardVO bvo) {
		return boardDao.boardWrite(bvo);
	}

	@Override
	public BoardVO boardDetail(int board_num) {
		return boardDao.boardDetail(board_num);
	}

	@Override
	public void boardHistory(int board_num) {
		boardDao.boardHistory(board_num);
	}

	@Override
	public int updateBoard(BoardVO bvo) {
		return boardDao.updateBoard(bvo);
	}

}
