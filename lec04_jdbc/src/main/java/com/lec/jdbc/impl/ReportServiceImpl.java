package com.lec.jdbc.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.dao.ReportDAO;
import com.lec.jdbc.service.ReportService;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.ReportVO;


@Service("ReportService")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO ReportDAO;
	@Override
	public int insertReport(ReportVO report) {
		return ReportDAO.insertReport(report);
	}
	@Override
	public ReportVO getReport(ReportVO report) {
		return ReportDAO.getReport(report);
	}
	@Override
	public List<ReportVO> getReportList(int currentPage, int perPage) {
		return ReportDAO.getReportList(currentPage,perPage);
	}
	@Override
	public PageInfo getPageInfo(int currentPage, int perPage) {
		return ReportDAO.getPageInfo("Reports", currentPage,perPage);
	}

	

	/* ------------------------------------------------------------------------------*/	

	@Override
	public List<ReportVO> getReportList(SearchVO searchVO) {
		return ReportDAO.getReportList(searchVO);
	}
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return ReportDAO.getTotalRowCount(searchVO);
	}
	
	
}