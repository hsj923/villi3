package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.QuestionVO;

public interface QuestionService {

	QuestionVO getQuestion(QuestionVO question);
	int getTotalRowCount(SearchVO searchVO);
	int insertQuestion(QuestionVO question);
	int deleteQuestion(QuestionVO question);
	int updateQuestion(QuestionVO question);
	List<QuestionVO> getQuestionList(SearchVO searchVO);
	int updateCnt(int seq);
}
