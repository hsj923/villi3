package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;
import com.lec.jdbc.vo.VoteVO;



public class VoteRowMapper implements RowMapper<VoteVO> {

	@Override
	public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		VoteVO vote = new VoteVO();
		vote.setId(rs.getString("ID"));
		vote.setQuestion(rs.getString("QUESTION"));
		vote.setV_date(rs.getDate("V_DATE"));
		
		return vote;
	}
}
