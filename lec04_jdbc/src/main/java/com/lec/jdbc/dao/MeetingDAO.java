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

@Repository("meetingDAO")
@PropertySource("classpath:config/meetingsql.properties")
public class MeetingDAO {
	
	@Autowired                    
	private JdbcTemplate jdbcTemplate;

	@Autowired
	Environment environment;
	
	
	private String sql = "";
	private String get_pageinfo     = ""; 
	private String insert_meeting     = ""; 
	private String update_meeting     = ""; 
	private String delete_meeting     = ""; 
	private String get_meeting        = ""; 
	private String get_meeting_list   = ""; 
	private String selectMeetingListByTitle = ""; 
	private String selectMeetingListByWriter = ""; 
	private String selectMeetingListByCate = ""; 

	@PostConstruct
	public void getSqlPropeties() {
		get_pageinfo     = environment.getProperty("get_pageinfo");
		insert_meeting     = environment.getProperty("insert_meeting");
		update_meeting 	 = environment.getProperty("update_meeting");
		delete_meeting 	 = environment.getProperty("delete_meeting");
		get_meeting 		 = environment.getProperty("get_meeting");
		get_meeting_list   = environment.getProperty("get_meeting_list");
		selectMeetingListByTitle   = environment.getProperty("selectMeetingListByTitle");
		selectMeetingListByWriter  = environment.getProperty("selectMeetingListByWriter");
		selectMeetingListByCate  = environment.getProperty("selectMeetingListByCate");
	}
//	
//	public List<MeetingVO> getMeetingList(int currentPage, int perPage) {		
//		Object[] args = {(currentPage-1)*perPage,  perPage };
//		return jdbcTemplate.query(get_meeting_list, args, new MeetingRowMapper());		
//	}
		
	public MeetingVO getMeeting(MeetingVO meeting) {
		Object[] args = { meeting.getSeq() };
		return jdbcTemplate.queryForObject(get_meeting, args, new MeetingRowMapper());	
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
			}else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
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
			}	else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = selectMeetingListByCate;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new MeetingRowMapper());
	}

	public int insertMeeting(MeetingVO meeting) {
		return jdbcTemplate.update(insert_meeting, meeting.getTitle(), meeting.getWriter(), meeting.getContent(), meeting.getPer(), meeting.getMeet_Date(), meeting.getMeet_Time(),
				meeting.getPlace(), meeting.getFileName1(),meeting.getFileName2(), meeting.getFileName3());
	}

	public int deleteMeeting(MeetingVO meeting) {
		return jdbcTemplate.update(delete_meeting, meeting.getSeq());
	}

	public int updateMeeting(MeetingVO meeting) {
		return jdbcTemplate.update(update_meeting, meeting.getTitle(), meeting.getContent(), meeting.getSeq());
	}	
	

		
/* --------------------------------------------------------------------------------------------------- */
	


	   public int updateCnt(int seq) {
		      int updateCount = 0;
		      String sql = "update meeting set cnt = cnt + 1 " + " where seq = ?";
		      jdbcTemplate.update(sql, seq);
		      return updateCount;
		   }



}
