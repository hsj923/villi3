package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;

public interface BoardService {

	BoardVO getBoard(BoardVO board);
	int getTotalRowCount(SearchVO searchVO);
	int insertBoard(BoardVO board);
	int insertsBoard(BoardVO board);
	int deleteBoard(BoardVO board);
	int updateBoard(BoardVO board);
	List<BoardVO> getBoardList(SearchVO searchVO);
	int updateCnt(int seq);
}
