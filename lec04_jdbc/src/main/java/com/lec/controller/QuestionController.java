package com.lec.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.service.QuestionService;
import com.lec.jdbc.vo.QuestionVO;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	Environment environment;
		
	
	private String uploadFolder = "";
		
		@PostConstruct
		public void getUploadPathPropeties() {
			uploadFolder = environment.getProperty("uploadFolder");
		}
	
	@RequestMapping("getQuestionList.do") 	
		public String getQuestionList(Model model, SearchVO searchVO,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="10") int rowSizePerPage,
				@RequestParam(defaultValue="") String searchCategory,
				@RequestParam(defaultValue="") String searchType,
				@RequestParam(defaultValue="") String searchWord) {
			
			searchVO.setTotalRowCount(questionService.getTotalRowCount(searchVO));
			searchVO.setCurPage(curPage);
			searchVO.setRowSizePerPage(rowSizePerPage);
			searchVO.setSearchCategory(searchCategory);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.pageSetting();
		
			List<QuestionVO> questionList = questionService.getQuestionList(searchVO);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("questionList", questionList);		
			return "question/question_list.jsp";
		}
	
	@RequestMapping("*/insertQuestion.do")
	public String insertQuestion(QuestionVO question) throws IOException {
		MultipartFile uploadFile1 = question.getUploadFile1();
		if (!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			uploadFile1.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			question.setFileName1(fileName);
		}	
		MultipartFile uploadFile2 = question.getUploadFile2();
		if (!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			uploadFile2.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			question.setFileName2(fileName);
		}	
		MultipartFile uploadFile3 = question.getUploadFile3();
		if (!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			uploadFile3.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			question.setFileName3(fileName);
		}	
		questionService.insertQuestion(question);
		return "redirect:/getQuestionList.do";
	}
	
	@RequestMapping(value="/getQuestion.do", method=RequestMethod.GET)
	public String getQuestion(@RequestParam int seq, QuestionVO question, Model model) {	
		
		model.addAttribute("question", questionService.getQuestion(question)); // Model 정보 저장
		questionService.updateCnt(seq);
		return "question/question_detail.jsp"; // View 이름 리턴
	}	

    
    
	
	@RequestMapping("/deleteQuestion.do")
	public String deleteQuestion(QuestionVO question) {
		questionService.deleteQuestion(question);
		return "getQuestionList.do";	
	}

	
	
	@RequestMapping(value="/updateQuestion.do", method=RequestMethod.GET)
	public String updateQuestion(Model model, QuestionVO question, SearchVO searchVO) {
		questionService.updateQuestion(question);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("question", questionService.getQuestion(question));
		return "question/updateQuestion.jsp";
	}
	
	@RequestMapping(value="/updateQuestion.do", method=RequestMethod.POST)
	public String updateQuestion(QuestionVO question) {
		questionService.updateQuestion(question);
		return "getQuestionList.do";
	}
	
//	@RequestMapping("/download.do")
//	public String download(HttpServletRequest req, HttpServletResponse res) throws Exception { 	
//		req.setCharacterEncoding("utf-8");
//		String fileName = req.getParameter("fn");
//		
//		String fromPath = "d:/lec03/99.temp/upload/" + fileName;
//		String toPath = "d:/lec03/99.temp/download/" + fileName;
//	
//		byte[] b = new byte[4096];
//		File f = new File(toPath);
//		FileInputStream fis = new FileInputStream(fromPath);
//		
//		String sMimeType = req.getSession().getServletContext().getMimeType(fromPath); // mimetype = file type : pdf, exe, txt.... 
//		if(sMimeType == null) sMimeType = "application/octet-stream";
//		
//		String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
//		String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
//		
//		res.setContentType(sMimeType);
//		res.setHeader("Content-Transfer-Encoding", "binary");
//		res.setHeader("Content-Disposition", "attachment; filename = " + sEncoding1);
//			
//		int numRead;
//		ServletOutputStream os = res.getOutputStream();
//	
//		while((numRead=fis.read(b, 0, b.length)) != -1 ) {
//			os.write(b, 0, numRead);
//		}
//		
//		os.flush();
//		os.close();
//		fis.close();
//		
//		return "getQuestionList.do";
//	}		
/* ----------------------------------------------------------------------- */	
//	@RequestMapping("getQuestionList.do") 
	public String getQuestionList(QuestionVO questionVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= questionService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("questionList", questionService.getQuestionList(searchVO));			
		return "question/question_list.jsp";
	}	
}

