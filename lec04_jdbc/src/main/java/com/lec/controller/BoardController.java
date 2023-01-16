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
import com.lec.jdbc.service.BoardService;
import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	Environment environment;
		
//	@Value("#boardsql['selectById']") private String selectById;	
//	@Value("#boardsql['selectBoardList']") private String selectBoardList;	
	
	private String uploadFolder = "";
		
		@PostConstruct
		public void getUploadPathPropeties() {
			uploadFolder = environment.getProperty("uploadFolder");
		}
	
	@RequestMapping("getBoardList.do") 	
		public String getBoardList(Model model, SearchVO searchVO,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="10") int rowSizePerPage,
				@RequestParam(defaultValue="") String searchCategory,
				@RequestParam(defaultValue="") String searchType,
				@RequestParam(defaultValue="") String searchWord) {
			
			searchVO.setTotalRowCount(boardService.getTotalRowCount(searchVO));
			searchVO.setCurPage(curPage);
			searchVO.setRowSizePerPage(rowSizePerPage);
			searchVO.setSearchCategory(searchCategory);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.pageSetting();
		
			List<BoardVO> boardList = boardService.getBoardList(searchVO);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("boardList", boardList);		
			return "board/board_list.jsp";
		}
	
	@RequestMapping("*/insertBoard.do")
	public String insertBoard(BoardVO board) throws IOException {
		MultipartFile uploadFile1 = board.getUploadFile1();
		if (!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			uploadFile1.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			board.setFileName1(fileName);
		}	
		MultipartFile uploadFile2 = board.getUploadFile2();
		if (!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			uploadFile2.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			board.setFileName2(fileName);
		}	
		MultipartFile uploadFile3 = board.getUploadFile3();
		if (!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			uploadFile3.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			board.setFileName3(fileName);
		}	
		MultipartFile uploadFile4 = board.getUploadFile4();
		if (!uploadFile4.isEmpty()) {
			String fileName = uploadFile4.getOriginalFilename();
			uploadFile4.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			board.setFileName4(fileName);
		}	
		MultipartFile uploadFile5 = board.getUploadFile5();
		if (!uploadFile5.isEmpty()) {
			String fileName = uploadFile5.getOriginalFilename();
			uploadFile5.transferTo(new File("C:/Users/ezen/Documents/GitHub/villi3/lec04_jdbc/src/main/webapp/resources/images/" + fileName));
			board.setFileName5(fileName);
		}	
		boardService.insertBoard(board);
		return "redirect:/getBoardList.do";
	}
	
	@RequestMapping(value="/getBoard.do", method=RequestMethod.GET)
	public String getBoard(@RequestParam int seq, BoardVO board, Model model) {	
		
		model.addAttribute("board", boardService.getBoard(board)); // Model 정보 저장
		boardService.updateCnt(seq);
		return "board/board_detail.jsp"; // View 이름 리턴
	}	

    
    
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO board) {
		boardService.deleteBoard(board);
		return "getBoardList.do";	
	}

	
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoard(Model model, BoardVO board, SearchVO searchVO) {
		boardService.updateBoard(board);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("board", boardService.getBoard(board));
		return "board/updateBoard.jsp";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(BoardVO board) {
		boardService.updateBoard(board);
		return "getBoardList.do";
	}
	
	@RequestMapping("/download.do")
	public String download(HttpServletRequest req, HttpServletResponse res) throws Exception { 	
		req.setCharacterEncoding("utf-8");
		String fileName = req.getParameter("fn");
		
		String fromPath = "d:/lec03/99.temp/upload/" + fileName;
		String toPath = "d:/lec03/99.temp/download/" + fileName;
	
		byte[] b = new byte[4096];
		File f = new File(toPath);
		FileInputStream fis = new FileInputStream(fromPath);
		
		String sMimeType = req.getSession().getServletContext().getMimeType(fromPath); // mimetype = file type : pdf, exe, txt.... 
		if(sMimeType == null) sMimeType = "application/octet-stream";
		
		String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
		String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
		
		res.setContentType(sMimeType);
		res.setHeader("Content-Transfer-Encoding", "binary");
		res.setHeader("Content-Disposition", "attachment; filename = " + sEncoding1);
			
		int numRead;
		ServletOutputStream os = res.getOutputStream();
	
		while((numRead=fis.read(b, 0, b.length)) != -1 ) {
			os.write(b, 0, numRead);
		}
		
		os.flush();
		os.close();
		fis.close();
		
		return "getBoardList.do";
	}		
/* ----------------------------------------------------------------------- */	
	//@RequestMapping("getBoardList.do") 
	public String getBoardList(BoardVO boardVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= boardService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("boardList", boardService.getBoardList(searchVO));			
		return "board/board_list.jsp";
	}	
}

