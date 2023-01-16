package com.lec.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.service.VoteService;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.VoteVO;

@Controller
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	@RequestMapping("getVoteList.do") 
	public String getVoteList(VoteVO voteVO, Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {
		PageInfo pageInfo = voteService.getPageInfo(p, perPage);				
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("voteList", voteService.getVoteList(p, perPage));	
		return "vote/vote_list.jsp";
	}
	
//	@RequestMapping(value="/getBoard.do", method=RequestMethod.GET)
//	public String getBoard(@RequestParam int seq, BoardVO board, Model model) {	
//		
//		model.addAttribute("board", boardService.getBoard(board)); // Model 정보 저장
//		boardService.updateCnt(seq);
//		return "board/board_detail.jsp"; // View 이름 리턴
//	}	
	
	
	@RequestMapping("*/insertVote.do")
	public String insertVote(VoteVO vote) {
		voteService.insertVote(vote);
		return "redirect:/getVoteList.do";
	}
	
	
	@RequestMapping(value="/getVote.do", method=RequestMethod.GET)
	public String getVote(VoteVO vote, Model model) {	
		
		model.addAttribute("vote", voteService.getVote(vote)); // Model 정보 저장
		return "vote/vote_detail.jsp"; // View 이름 리턴
	}	

	/* ----------------------------------------------------------------------- */	
	//@RequestMapping("getvoteList.do") 
	public String getVoteList(VoteVO voteVO, SearchVO searchVO, Model model) {	
		
		int totalRowCount= voteService.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		model.addAttribute("pageInfo", searchVO);
		model.addAttribute("voteList", voteService.getVoteList(searchVO));			
		return "vote/vote_list.jsp";
	}	
}






















