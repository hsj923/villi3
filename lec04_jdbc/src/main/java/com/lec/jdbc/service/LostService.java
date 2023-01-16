package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.LostVO;


public interface LostService {

	LostVO getLost(LostVO lost);
	int getTotalRowCount(SearchVO searchVO);
	int insertLost(LostVO lost);
	int deleteLost(LostVO lost);
	int updateLost(LostVO lost);
	List<LostVO> getLostList(SearchVO searchVO);
	int updateCnt(int seq);
}
