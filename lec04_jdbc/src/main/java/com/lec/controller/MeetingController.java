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
import com.lec.jdbc.service.MeetingService;
import com.lec.jdbc.vo.MeetingVO;
import com.lec.jdbc.vo.PageInfo;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	Environment environment;
		
	
	private String uploadFolder = "";
		
		@PostConstruct
		public void getUploadPathPropeties() {
			uploadFolder = environment.getProperty("uploadFolder");
		}
	
	@RequestMapping("getMeetingList.do") 	
		public String getMeetingList(Model model, SearchVO searchVO,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="10") int rowSizePerPage,
				@RequestParam(defaultValue="") String searchCategory,
				@RequestParam(defaultValue="") String searchType,
				@RequestParam(defaultValue="") String searchWord) {
			
			searchVO.setTotalRowCount(meetingService.getTotalRowCount(searchVO));
			searchVO.setCurPage(curPage);
			searchVO.setRowSizePerPage(rowSizePerPage);
			searchVO.setSearchCategory(searchCategory);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.pageSetting();
		
			List<MeetingVO> meetingList = meetingService.getMeetingList(searchVO);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("meetingList", meetingList);		
			return "meeting/meeting_list.jsp";
		}
	
	@RequestMapping("*/insertMeeting.do")
	public String insertMeeting(MeetingVO meeting) throws IOException {
		MultipartFile uploadFile1 = meeting.getUploadFile1();
		if (!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			uploadFile1.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			meeting.setFileName1(fileName);
		}	
		MultipartFile uploadFile2 = meeting.getUploadFile2();
		if (!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			uploadFile2.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			meeting.setFileName2(fileName);
		}	
		MultipartFile uploadFile3 = meeting.getUploadFile3();
		if (!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			uploadFile3.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			meeting.setFileName3(fileName);
		}	
		MultipartFile uploadFile4 = meeting.getUploadFile4();
		if (!uploadFile4.isEmpty()) {
			String fileName = uploadFile4.getOriginalFilename();
			uploadFile4.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			meeting.setFileName4(fileName);
		}	
		MultipartFile uploadFile5 = meeting.getUploadFile5();
		if (!uploadFile5.isEmpty()) {
			String fileName = uploadFile5.getOriginalFilename();
			uploadFile5.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			meeting.setFileName5(fileName);
		}	
		meetingService.insertMeeting(meeting);
		return "redirect:/getMeetingList.do";
	}
	
	@RequestMapping(value="/getMeeting.do", method=RequestMethod.GET)
	public String getMeeting(@RequestParam int seq, MeetingVO meeting, Model model) {	
		
		model.addAttribute("meeting", meetingService.getMeeting(meeting)); // Model 정보 저장
		meetingService.updateCnt(seq);
		return "meeting/meeting_detail.jsp"; // View 이름 리턴
	}	

    
    
	
	@RequestMapping("/deleteMeeting.do")
	public String deleteMeeting(MeetingVO meeting) {
		meetingService.deleteMeeting(meeting);
		return "getMeetingList.do";	
	}

	
	
	@RequestMapping(value="/updatemeeting.do", method=RequestMethod.GET)
	public String updatemeeting(Model model, MeetingVO meeting, SearchVO searchVO) {
		meetingService.updateMeeting(meeting);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("meeting", meetingService.getMeeting(meeting));
		return "meeting/updateMeeting.jsp";
	}
	
	@RequestMapping(value="/updatemeeting.do", method=RequestMethod.POST)
	public String updatemeeting(MeetingVO meeting) {
		meetingService.updateMeeting(meeting);
		return "getMeetingList.do";
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
//		return "getmeetingList.do";
//	}		
/* ----------------------------------------------------------------------- */	
	//@RequestMapping("getmeetingList.do") 
	public String getmeetingList(MeetingVO meetingVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= meetingService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("meetingList", meetingService.getMeetingList(searchVO));			
		return "meeting/meeting_list.jsp";
	}	
}

