package com.lec.jdbc.impl;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.dao.QuestionDAO;
import com.lec.jdbc.service.QuestionService;
import com.lec.jdbc.vo.QuestionVO;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDAO QuestionDAO;

	@Override
	public QuestionVO getQuestion(QuestionVO question) {
		return QuestionDAO.getQuestion(question);
	}
	

	@Override
	public List<QuestionVO> getQuestionList(SearchVO searchVO) {
		return QuestionDAO.getQuestionList(searchVO);
	}

	@Override
	public int insertQuestion(QuestionVO question) {
		return QuestionDAO.insertQuestion(question);
	}

	@Override
	public int deleteQuestion(QuestionVO question) {	
		return QuestionDAO.deleteQuestion(question);
	}
	
	@Override
	public int updateQuestion(QuestionVO question) {
		return QuestionDAO.updateQuestion(question);
	}

/* ------------------------------------------------------------------------------*/	
	
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return QuestionDAO.getTotalRowCount(searchVO);
	}

	  @Override
	   public int updateCnt(int seq) {
	      return QuestionDAO.updateCnt(seq);
	   }
}
