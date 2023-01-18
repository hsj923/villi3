package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.QuestionRowMapper;
import com.lec.jdbc.vo.QuestionVO;

@Repository("questionDAO")
@PropertySource("classpath:config/questionsql.properties")
public class QuestionDAO {
	
	@Autowired                    
	private JdbcTemplate jdbcTemplate;

	@Autowired
	Environment environment;
	
	
	private String sql = "";
	private String get_pageinfo     = ""; 
	private String insert_question     = ""; 
	private String update_question     = ""; 
	private String delete_question     = ""; 
	private String get_question        = ""; 
	private String get_question_list   = ""; 
	private String selectQuestionListByTitle = ""; 
	private String selectQuestionListByWriter = ""; 
	private String selectQuestionListByCate = ""; 

	@PostConstruct
	public void getSqlPropeties() {
		get_pageinfo     = environment.getProperty("get_pageinfo");
		insert_question     = environment.getProperty("insert_question");
		update_question 	 = environment.getProperty("update_question");
		delete_question 	 = environment.getProperty("delete_question");
		get_question 		 = environment.getProperty("get_question");
		get_question_list   = environment.getProperty("get_question_list");
		selectQuestionListByTitle   = environment.getProperty("selectQuestionListByTitle");
		selectQuestionListByWriter  = environment.getProperty("selectQuestionListByWriter");
		selectQuestionListByCate  = environment.getProperty("selectQuestionListByCate");
	}
//	
//	public List<QuestionVO> getQuestionList(int currentPage, int perPage) {		
//		Object[] args = {(currentPage-1)*perPage,  perPage };
//		return jdbcTemplate.query(get_question_list, args, new questionRowMapper());		
//	}
		
	public QuestionVO getQuestion(QuestionVO question) {
		Object[] args = { question.getSeq() };
		return jdbcTemplate.queryForObject(get_question, args, new QuestionRowMapper());	
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = get_pageinfo;
			searchVO.setSearchType("title");
		} else {			
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = get_pageinfo + " and title like '%" + searchVO.getSearchWord() + "%'";
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = get_pageinfo + " and writer like '%" + searchVO.getSearchWord() + "%'";
			}else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = get_pageinfo + " and cate2 like '%" + searchVO.getSearchWord() + "%'";
			}
		}
		return jdbcTemplate.queryForInt(sql);
	}
	
	public List<QuestionVO> getQuestionList(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = selectQuestionListByTitle;
			searchVO.setSearchType("title");
		} else {
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = selectQuestionListByTitle;
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = selectQuestionListByWriter;
			}	else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = selectQuestionListByCate;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new QuestionRowMapper());
	}

	public int insertQuestion(QuestionVO question) {
		return jdbcTemplate.update(insert_question, question.getTitle(), question.getWriter(), question.getContent(), question.getFileName1(),question.getFileName2()
				                   ,question.getFileName3());
	}

	public int deleteQuestion(QuestionVO question) {
		return jdbcTemplate.update(delete_question, question.getSeq());
	}

	public int updateQuestion(QuestionVO question) {
		return jdbcTemplate.update(update_question, question.getTitle(), question.getContent(), question.getSeq());
	}	
	

		
/* --------------------------------------------------------------------------------------------------- */
	


	   public int updateCnt(int seq) {
		      int updateCount = 0;
		      String sql = "update question set cnt = cnt + 1 " + " where seq = ?";
		      jdbcTemplate.update(sql, seq);
		      return updateCount;
		   }



}
