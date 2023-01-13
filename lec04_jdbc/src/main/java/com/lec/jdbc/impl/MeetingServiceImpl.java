package com.lec.jdbc.impl;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.dao.MeetingDAO;
import com.lec.jdbc.service.MeetingService;
import com.lec.jdbc.vo.MeetingVO;


@Service("meetingService")
public class MeetingServiceImpl implements MeetingService {
	
	@Autowired
	private MeetingDAO MeetingDAO;

	@Override
	public MeetingVO getMeeting(MeetingVO meeting) {
		return MeetingDAO.getMeeting(meeting);
	}
	

	@Override
	public List<MeetingVO> getMeetingList(SearchVO searchVO) {
		return MeetingDAO.getMeetingList(searchVO);
	}

	@Override
	public int insertMeeting(MeetingVO meeting) {
		return MeetingDAO.insertMeeting(meeting);
	}

	@Override
	public int deleteMeeting(MeetingVO meeting) {	
		return MeetingDAO.deleteMeeting(meeting);
	}
	
	@Override
	public int updateMeeting(MeetingVO meeting) {
		return MeetingDAO.updateMeeting(meeting);
	}

/* ------------------------------------------------------------------------------*/	
	
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return MeetingDAO.getTotalRowCount(searchVO);
	}

	  @Override
	   public int updateCnt(int seq) {
	      return MeetingDAO.updateCnt(seq);
	   }
}
