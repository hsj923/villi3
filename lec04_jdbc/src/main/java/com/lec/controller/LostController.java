package com.lec.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.service.LostService;
import com.lec.jdbc.vo.LostVO;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class LostController {
	
	@Autowired
	private LostService lostService;
	
	@Autowired
	Environment environment;
		
	
	private String uploadFolder = "";
		
		@PostConstruct
		public void getUploadPathPropeties() {
			uploadFolder = environment.getProperty("uploadFolder");
		}
	
	@RequestMapping("getLostList.do") 	
		public String getLostList(Model model, SearchVO searchVO,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="10") int rowSizePerPage,
				@RequestParam(defaultValue="") String searchCategory,
				@RequestParam(defaultValue="") String searchType,
				@RequestParam(defaultValue="") String searchWord) {
			
			searchVO.setTotalRowCount(lostService.getTotalRowCount(searchVO));
			searchVO.setCurPage(curPage);
			searchVO.setRowSizePerPage(rowSizePerPage);
			searchVO.setSearchCategory(searchCategory);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.pageSetting();
		
			List<LostVO> lostList = lostService.getLostList(searchVO);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("lostList", lostList);		
			return "lost/lost_list.jsp";
		}
	
	@RequestMapping("*/insertLost.do")
	public String insertLost(LostVO lost) throws IOException {
		MultipartFile uploadFile1 = lost.getUploadFile1();
		if (!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			uploadFile1.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			lost.setFileName1(fileName);
		}	
		MultipartFile uploadFile2 = lost.getUploadFile2();
		if (!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			uploadFile2.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			lost.setFileName2(fileName);
		}	
		MultipartFile uploadFile3 = lost.getUploadFile3();
		if (!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			uploadFile3.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			lost.setFileName3(fileName);
		}	
		MultipartFile uploadFile4 = lost.getUploadFile4();
		if (!uploadFile4.isEmpty()) {
			String fileName = uploadFile4.getOriginalFilename();
			uploadFile4.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			lost.setFileName4(fileName);
		}	
		MultipartFile uploadFile5 = lost.getUploadFile5();
		if (!uploadFile5.isEmpty()) {
			String fileName = uploadFile5.getOriginalFilename();
			uploadFile5.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			lost.setFileName5(fileName);
		}	
		lostService.insertLost(lost);
		return "redirect:/getLostList.do";
	}
	
	@RequestMapping(value="/getLost.do", method=RequestMethod.GET)
	public String getLost(@RequestParam int seq, LostVO lost, Model model) {	
		
		model.addAttribute("lost", lostService.getLost(lost)); // Model 정보 저장
		lostService.updateCnt(seq);
		return "lost/lost_detail.jsp"; // View 이름 리턴
	}	

    
    
	
	@RequestMapping("/deleteLost.do")
	public String deleteLost(LostVO lost) {
		lostService.deleteLost(lost);
		return "getLostList.do";	
	}

	
	
	@RequestMapping(value="/updateLost.do", method=RequestMethod.GET)
	public String updateLost(Model model, LostVO lost, SearchVO searchVO) {
		lostService.updateLost(lost);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("lost", lostService.getLost(lost));
		return "lost/updateLost.jsp";
	}
	
	@RequestMapping(value="/updateLost.do", method=RequestMethod.POST)
	public String updateLost(LostVO lost) {
		lostService.updateLost(lost);
		return "getLostList.do";
	}
///* ----------------------------------------------------------------------- */	
//	@RequestMapping("getlostList.do") 
	public String getLostList(LostVO lostVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= lostService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("lostList", lostService.getLostList(searchVO));			
		return "lost/lost_list.jsp";
	}	
}

