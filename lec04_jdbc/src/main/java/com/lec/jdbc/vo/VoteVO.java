package com.lec.jdbc.vo;

import java.util.Date;

public class VoteVO {


	
	private String id;
	private String question;
	private Date v_date;
	private int listnum;
	private int itemnum;
	private String item;
	private int cnum;
	
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
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	@Override
	public String toString() {
		return "VoteVO [id=" + id + ", question=" + question + ", v_date=" + v_date + ", listnum=" + listnum
				+ ", itemnum=" + itemnum + ", item=" + item + ", cnum=" + cnum + "]";
	}

	
}
