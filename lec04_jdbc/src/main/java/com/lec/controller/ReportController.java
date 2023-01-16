package com.lec.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.service.ReportService;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.ReportVO;
import com.lec.jdbc.vo.UserVO;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping("getReportList.do") 
	public String getReportList(ReportVO reportVO, Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {
		PageInfo pageInfo = reportService.getPageInfo(p, perPage);				
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reportList", reportService.getReportList(p, perPage));	
		return "report/report_list.jsp";
	}
	
	@RequestMapping("*/insertReport.do")
	public String insertReport(ReportVO report) {
		reportService.insertReport(report);
		return "redirect:/getReportList.do";
	}

//	@RequestMapping(value="/getVote.do", method=RequestMethod.GET)
//	public String getVote(@RequestParam int seq, VoteVO vote, Model model) {	
//		
//		model.addAttribute("vote", voteService.getVote(vote)); // Model 정보 저장
//		return "vote/vote_detail.jsp"; // View 이름 리턴
//	}
	
	@RequestMapping("/getReport.do")
	public String getReport(ReportVO report, Model model) {	
		model.addAttribute("report", reportService.getReport(report)); // Model 정보 저장
		return "report/report_detail.jsp"; // View 이름 리턴
	}	
	
	
	/* ----------------------------------------------------------------------- */	
	//@RequestMapping("getreportList.do") 
	public String getReportList(ReportVO reportVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= reportService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("reportList", reportService.getReportList(searchVO));			
		return "report/report_list.jsp";
	}	
}






















