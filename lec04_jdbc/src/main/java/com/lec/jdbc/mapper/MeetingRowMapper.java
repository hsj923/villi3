package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.MeetingVO;


public class MeetingRowMapper implements RowMapper<MeetingVO> {
	public MeetingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MeetingVO meeting = new MeetingVO();
		meeting.setSeq(rs.getInt("SEQ"));
		meeting.setTitle(rs.getString("TITLE"));
		meeting.setWriter(rs.getString("WRITER"));
		meeting.setContent(rs.getString("CONTENT"));
		meeting.setStatus(rs.getString("STATUS"));
		meeting.setRegDate(rs.getDate("REGDATE"));
		meeting.setCnt(rs.getInt("CNT"));
		meeting.setFileName1(rs.getString("FILENAME1"));
		meeting.setFileName2(rs.getString("FILENAME2"));
		meeting.setFileName3(rs.getString("FILENAME3"));
		meeting.setFileName4(rs.getString("FILENAME4"));
		meeting.setFileName5(rs.getString("FILENAME5"));
		meeting.setCate(rs.getString("CATE"));
		meeting.setCate2(rs.getString("CATE2"));
		// meeting.setUploadFile(rs.getString("FILE"));
		return meeting;
	}
}