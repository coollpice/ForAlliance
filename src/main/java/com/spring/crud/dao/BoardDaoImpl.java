package com.spring.crud.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.crud.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<BoardVO> boardList() {
		return sqlsession.selectList("boardList");
	}

	@Override
	public int boardWrite(BoardVO bvo) {
		return sqlsession.insert("boardWrite",bvo);
	}

	@Override
	public BoardVO boardDetail(int board_num) {
		return sqlsession.selectOne("boardDetail",board_num);

	}

	@Override
	public void boardHistory(int board_num) {
		sqlsession.update("boardHistory",board_num);
	}

	@Override
	public int updateBoard(BoardVO bvo) {
		return sqlsession.update("updateBoard",bvo);
	}
}
