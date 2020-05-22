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

}
