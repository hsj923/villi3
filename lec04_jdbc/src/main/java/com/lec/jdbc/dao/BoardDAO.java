package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.BoardRowMapper;
import com.lec.jdbc.vo.BoardVO;

@Repository("BoardDAO")
@PropertySource("classpath:config/boardsql.properties")
public class BoardDAO {
	
	@Autowired                    
	private JdbcTemplate jdbcTemplate;

	@Autowired
	Environment environment;
	
	
	private String sql = "";
	private String get_pageinfo     = ""; //"select count(*) from board";
	private String insert_board     = ""; //"insert into board(title, writer, content, filename1, filename2, filename3, filename4, filename5, category, regdate) values(?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
	private String update_board     = ""; //"update board set title=?, content=? where seq=?";
	private String delete_board     = ""; //"delete from board where seq=?";
	private String get_board        = ""; //"select * from board where seq=?";
	private String get_board_list   = ""; //"select * from board order by seq desc";
	private String selectBoardListByTitle = ""; 
	private String selectBoardListByWriter = ""; 
	private String selectBoardListByCate = ""; 

	@PostConstruct
	public void getSqlPropeties() {
		get_pageinfo     = environment.getProperty("get_pageinfo");
		insert_board     = environment.getProperty("insert_board");
		update_board 	 = environment.getProperty("update_board");
		delete_board 	 = environment.getProperty("delete_board");
		get_board 		 = environment.getProperty("get_board");
		get_board_list   = environment.getProperty("get_board_list");
		selectBoardListByTitle   = environment.getProperty("selectBoardListByTitle");
		selectBoardListByWriter  = environment.getProperty("selectBoardListByWriter");
		selectBoardListByCate = environment.getProperty("selectBoardListByCate");
	}
//	
//	public List<BoardVO> getBoardList(int currentPage, int perPage) {		
//		Object[] args = {(currentPage-1)*perPage,  perPage };
//		return jdbcTemplate.query(get_board_list, args, new BoardRowMapper());		
//	}
		
	public BoardVO getBoard(BoardVO board) {
		Object[] args = { board.getSeq() };
		return jdbcTemplate.queryForObject(get_board, args, new BoardRowMapper());	
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
			} else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = get_pageinfo + " and cate2 like '%" + searchVO.getSearchWord() + "%'";
			}	
		}
		return jdbcTemplate.queryForInt(sql);
	}
	
	public List<BoardVO> getBoardList(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = selectBoardListByTitle;
			searchVO.setSearchType("title");
		} else {
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = selectBoardListByTitle;
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = selectBoardListByWriter;
			} else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = selectBoardListByCate;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new BoardRowMapper());
	}

	public int insertBoard(BoardVO board) {
		return jdbcTemplate.update(insert_board, board.getTitle(), board.getWriter(), board.getContent(), board.getFileName1(),board.getFileName2()
				                   ,board.getFileName3(), board.getFileName4(), board.getFileName5(), board.getCate2());
	}

	public int deleteBoard(BoardVO board) {
		return jdbcTemplate.update(delete_board, board.getSeq());
	}

	public int updateBoard(BoardVO board) {
		return jdbcTemplate.update(update_board, board.getTitle(), board.getContent(), board.getSeq());
	}	
	

		
/* --------------------------------------------------------------------------------------------------- */
	


	   public int updateCnt(int seq) {
		      int updateCount = 0;
		      String sql = "update board set cnt = cnt + 1 " + " where seq = ?";
		      jdbcTemplate.update(sql, seq);
		      return updateCount;
		   }



}
