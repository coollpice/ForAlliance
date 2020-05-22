package com.spring.crud.dao;

import java.util.List;

import com.spring.crud.vo.BoardVO;

public interface BoardDao {
	
	public List<BoardVO> boardList();
}
