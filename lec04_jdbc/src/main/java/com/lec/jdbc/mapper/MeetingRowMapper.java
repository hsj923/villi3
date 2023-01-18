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
		meeting.setRegDate(rs.getDate("REGDATE"));
		meeting.setCnt(rs.getInt("CNT"));
        meeting.setPer(rs.getString("PER"));
        meeting.setMeet_Date(rs.getString("MEET_DATE"));
        meeting.setMeet_Time(rs.getString("MEET_TIME"));
        meeting.setPlace(rs.getString("PLACE"));
        meeting.setStatus(rs.getString("STATUS"));
        meeting.setFileName1(rs.getString("FILENAME1"));
        meeting.setFileName2(rs.getString("FILENAME2"));
        meeting.setFileName3(rs.getString("FILENAME3"));
		return meeting;
	}
}