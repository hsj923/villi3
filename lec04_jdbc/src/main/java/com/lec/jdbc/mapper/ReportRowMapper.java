package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.ReportVO;


public class ReportRowMapper implements RowMapper<ReportVO> {

	@Override
	public ReportVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReportVO report = new ReportVO();
		report.setR_seq(rs.getInt("R_SEQ"));
		report.setR_status(rs.getString("R_STATUS"));
		report.setR_rs1(rs.getString("R_RS1"));
		report.setR_rs2(rs.getString("R_RS2"));
		report.setR_rs3(rs.getString("R_RS3"));
		report.setR_con(rs.getString("R_CON"));
		report.setR_time(rs.getDate("R_TIME"));
		report.setR_e_time(rs.getDate("R_E_TIME"));
//		report.setTitle(rs.getString("TITLE"));	
//		report.setSeq(rs.getInt("SEQ"));
		return report;
		
		
		

	}
}
