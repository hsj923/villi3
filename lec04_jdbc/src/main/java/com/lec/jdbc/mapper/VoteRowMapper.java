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
		vote.setCnum(rs.getInt("CNUM"));
		vote.setId(rs.getString("ID"));
		vote.setItem(rs.getString("ITEM"));
		vote.setItemnum(rs.getInt("ITEMNUM"));
		vote.setListnum(rs.getInt("LISTNUM"));
		vote.setQuestion(rs.getString("QUESTION"));
		vote.setV_date(rs.getDate("V_DATE"));
		
		return vote;
	}
}
