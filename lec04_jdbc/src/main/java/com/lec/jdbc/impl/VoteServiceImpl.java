package com.lec.jdbc.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.dao.VoteDAO;
import com.lec.jdbc.service.VoteService;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.VoteVO;


@Service("VoteService")
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	private VoteDAO VoteDAO;

	@Override
	public VoteVO getVote(VoteVO vote) {
		return VoteDAO.getVote(vote);
	}
	@Override
	public List<VoteVO> getVoteList(int currentPage, int perPage) {
		return VoteDAO.getVoteList(currentPage,perPage);
	}
	@Override
	public PageInfo getPageInfo(int currentPage, int perPage) {
		return VoteDAO.getPageInfo("Votes", currentPage,perPage);
	}

	

	/* ------------------------------------------------------------------------------*/	

	@Override
	public List<VoteVO> getVoteList(SearchVO searchVO) {
		return VoteDAO.getVoteList(searchVO);
	}
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return VoteDAO.getTotalRowCount(searchVO);
	}
	@Override
	public int insertVote(VoteVO vote) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}