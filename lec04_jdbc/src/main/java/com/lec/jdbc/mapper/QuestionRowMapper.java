package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.lec.jdbc.vo.QuestionVO;

public class QuestionRowMapper implements RowMapper<QuestionVO> {
	public QuestionVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		QuestionVO question = new QuestionVO();
		question.setSeq(rs.getInt("SEQ"));
		question.setTitle(rs.getString("TITLE"));
		question.setWriter(rs.getString("WRITER"));
		question.setContent(rs.getString("CONTENT"));
		question.setStatus(rs.getString("STATUS"));
		question.setRegDate(rs.getDate("REGDATE"));
		question.setCnt(rs.getInt("CNT"));
		question.setFileName1(rs.getString("FILENAME1"));
		question.setFileName2(rs.getString("FILENAME2"));
		question.setFileName3(rs.getString("FILENAME3"));
		question.setFileName4(rs.getString("FILENAME4"));
		question.setFileName5(rs.getString("FILENAME5"));
		question.setCate(rs.getString("CATE"));
		question.setCate2(rs.getString("CATE2"));
		// question.setUploadFile(rs.getString("FILE"));
		return question;
	}
}