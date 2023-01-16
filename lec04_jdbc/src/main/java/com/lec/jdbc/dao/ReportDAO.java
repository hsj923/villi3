package com.lec.jdbc.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.ReportRowMapper;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.ReportVO;



@Repository("reportDAO")
public class ReportDAO {

	@Autowired                    
	private JdbcTemplate jdbcTemplate;
	
	private String sql = "";
	private String insert_report = "insert into report(r_seq, r_rs1, r_rs2, r_rs3, r_con, r_time) values(?,?,?,?,?,now())";
	private String get_pageinfo = "select count(*) from report";
	private String get_report = "select * from report where r_seq=?";
	private String get_report_list = "select * from report order by r_seq desc limit ?, ?";
//	SELECT * FROM report , board WHERE board.seq = report.R_ID;
//	SELECT b.seq, b.writer, b.title, b.content, b.filename1, b.filename2, b.filename3, r.R_TIME, r.R_RS1, r.R_RS2, r.R_RS3 ,r.R_CON, r.R_STATUS
//	  FROM report R, board b
//	  WHERE b.seq = r.R_ID;
	

	public List<ReportVO> getReportList(int currentPage, int perPage) {
		Object[] args = {(currentPage-1)*perPage, perPage};
		return jdbcTemplate.query(get_report_list, args, new ReportRowMapper());
	}
	public ReportVO getReport(ReportVO report) {
		Object[] args = {report.getR_seq() };
		return jdbcTemplate.queryForObject(get_report, args, new ReportRowMapper());
	}

	
	public List<ReportVO> getReportList(SearchVO searchVO) {
		sql = "select * from report where 1 = 1 "
		    + " and "      + searchVO.getSearchCategory() 
		    + " like '%"   + searchVO.getSearchWord() + "'%"
		    + " limit    " + searchVO.getCurPage() + ", " + searchVO.getRowSizePerPage()
		    + " order by " + searchVO.getSearchCategory() + "desc";
		return jdbcTemplate.query(sql, new ReportRowMapper());
	}
	
public PageInfo getPageInfo(String tableName, int currentPage, int perPage) {
		
		PageInfo pageInfo = new PageInfo();
		int totalCount = 0;
		int totalPages = 0;
		int startPage = 0;
		int endPage = 0;

		totalCount = jdbcTemplate.queryForInt(get_pageinfo);
		
		if(totalCount>0) {
			totalPages = (int)(totalCount / perPage) + ((totalCount % perPage == 0) ? 0 : 1);
			startPage = (int)(currentPage / perPage) * perPage + 1 + ((currentPage % perPage == 0) ? -perPage : 0);
			endPage = startPage + perPage - 1;
			endPage = (endPage >= totalPages) ? totalPages : endPage;
		}				
		pageInfo.setTotalPages(totalPages);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		return pageInfo;
	}
	public int insertReport(ReportVO report) {
		return jdbcTemplate.update(insert_report, report.getR_seq(), report.getR_rs1(), report.getR_rs2(), report.getR_rs3(), report.getR_con());
	}
	public int getTotalRowCount(SearchVO searchVO) {
		sql = "select count(*) from report where 1 = 1 "
			    + " and "      + searchVO.getSearchCategory() 
			    + " like '%"   + searchVO.getSearchWord() + "'%"
			    + " limit    " + searchVO.getCurPage() + ", " + searchVO.getRowSizePerPage()
			    + " order by " + searchVO.getSearchCategory() + "desc";
		return jdbcTemplate.queryForInt(sql);
	}

}



