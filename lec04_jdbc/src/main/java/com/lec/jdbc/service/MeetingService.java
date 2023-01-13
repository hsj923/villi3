package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.MeetingVO;

public interface MeetingService {

	MeetingVO getMeeting(MeetingVO meeting);
	int getTotalRowCount(SearchVO searchVO);
	int insertMeeting(MeetingVO meeting);
	int deleteMeeting(MeetingVO meeting);
	int updateMeeting(MeetingVO meeting);
	List<MeetingVO> getMeetingList(SearchVO searchVO);
	int updateCnt(int seq);
}
