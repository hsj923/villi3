package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.ReportVO;

public interface ReportService {

	ReportVO getReport(ReportVO report);
	List<ReportVO> getReportList(int currentPage, int perPage);
	PageInfo getPageInfo(int currentPage, int perPage);
	int insertReport(ReportVO report);
		
	
	List<ReportVO> getReportList(SearchVO searchVO);
	int getTotalRowCount(SearchVO searchVO);
	
}
