package com.lec.jdbc.vo;

import java.util.Date;

public class VoteVO {


	
	private String id;
	private String question;
	private Date v_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	@Override
	public String toString() {
		return "VoteVO [id=" + id + ", question=" + question + ", v_date=" + v_date + "]";
	}

	

	
}
