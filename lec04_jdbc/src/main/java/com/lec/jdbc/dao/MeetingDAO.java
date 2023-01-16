package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.MeetingRowMapper;
import com.lec.jdbc.vo.MeetingVO;

@Repository("MeetingDAO")
@PropertySource("classpath:config/meetingsql.properties")
public class MeetingDAO {
	
	@Autowired                    
	private JdbcTemplate jdbcTemplate;

	@Autowired
	Environment environment;
	
	
	private String sql = "";
	private String get_pageinfo     = ""; 
	private String insert_Meeting     = ""; 
	private String update_Meeting     = ""; 
	private String delete_Meeting     = ""; 
	private String get_Meeting        = ""; 
	private String get_Meeting_list   = ""; 
	private String selectMeetingListByTitle = ""; 
	private String selectMeetingListByWriter = ""; 
	private String selectMeetingListByCate = ""; 

	@PostConstruct
	public void getSqlPropeties() {
		get_pageinfo     = environment.getProperty("get_pageinfo");
		insert_Meeting     = environment.getProperty("insert_Meeting");
		update_Meeting 	 = environment.getProperty("update_Meeting");
		delete_Meeting 	 = environment.getProperty("delete_Meeting");
		get_Meeting 		 = environment.getProperty("get_Meeting");
		get_Meeting_list   = environment.getProperty("get_Meeting_list");
		selectMeetingListByTitle   = environment.getProperty("selectMeetingListByTitle");
		selectMeetingListByWriter  = environment.getProperty("selectMeetingListByWriter");
		selectMeetingListByCate = environment.getProperty("selectMeetingListByCate");
	}
//	
//	public List<meetingVO> getmeetingList(int currentPage, int perPage) {		
//		Object[] args = {(currentPage-1)*perPage,  perPage };
//		return jdbcTemplate.query(get_meeting_list, args, new meetingRowMapper());		
//	}
		
	public MeetingVO getMeeting(MeetingVO Meeting) {
		Object[] args = { Meeting.getSeq() };
		return jdbcTemplate.queryForObject(get_Meeting, args, new MeetingRowMapper());	
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
	
	public List<MeetingVO> getMeetingList(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = selectMeetingListByTitle;
			searchVO.setSearchType("title");
		} else {
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = selectMeetingListByTitle;
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = selectMeetingListByWriter;
			} else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = selectMeetingListByCate;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new MeetingRowMapper());
	}

	public int insertMeeting(MeetingVO Meeting) {
		return jdbcTemplate.update(insert_Meeting, Meeting.getTitle(), Meeting.getWriter(), Meeting.getContent(), Meeting.getFileName1(),Meeting.getFileName2()
				                   ,Meeting.getFileName3(), Meeting.getFileName4(), Meeting.getFileName5(), Meeting.getCate2());
	}

	public int deleteMeeting(MeetingVO Meeting) {
		return jdbcTemplate.update(delete_Meeting, Meeting.getSeq());
	}

	public int updateMeeting(MeetingVO Meeting) {
		return jdbcTemplate.update(update_Meeting, Meeting.getTitle(), Meeting.getContent(), Meeting.getSeq());
	}	
	

		
/* --------------------------------------------------------------------------------------------------- */
	


	   public int updateCnt(int seq) {
		      int updateCount = 0;
		      String sql = "update Meeting set cnt = cnt + 1 " + " where seq = ?";
		      jdbcTemplate.update(sql, seq);
		      return updateCount;
		   }



}
