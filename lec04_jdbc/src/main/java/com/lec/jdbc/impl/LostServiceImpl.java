package com.lec.jdbc.impl;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.dao.LostDAO;
import com.lec.jdbc.service.LostService;
import com.lec.jdbc.vo.LostVO;


@Service("lostService")
public class LostServiceImpl implements LostService {
	
	@Autowired
	private LostDAO LostDAO;

	@Override
	public LostVO getLost(LostVO lost) {
		return LostDAO.getLost(lost);
	}
	

	@Override
	public List<LostVO> getLostList(SearchVO searchVO) {
		return LostDAO.getLostList(searchVO);
	}

	@Override
	public int insertLost(LostVO lost) {
		return LostDAO.insertLost(lost);
	}

	@Override
	public int deleteLost(LostVO lost) {	
		return LostDAO.deleteLost(lost);
	}
	
	@Override
	public int updateLost(LostVO lost) {
		return LostDAO.updateLost(lost);
	}

/* ------------------------------------------------------------------------------*/	
	
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return LostDAO.getTotalRowCount(searchVO);
	}

	  @Override
	   public int updateCnt(int seq) {
	      return LostDAO.updateCnt(seq);
	   }
}
