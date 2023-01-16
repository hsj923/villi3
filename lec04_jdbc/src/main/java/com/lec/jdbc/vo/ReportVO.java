package com.lec.jdbc.vo;

import java.util.Date;

public class ReportVO {

	private int r_seq;
    private String r_status;
    private String r_rs1;
    private String r_rs2;
    private String r_rs3;
    private String r_con;
    private Date r_time;
    private Date r_e_time;
	private int seq;
	private String title;
	

	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	public String getR_rs1() {
		return r_rs1;
	}
	public void setR_rs1(String r_rs1) {
		this.r_rs1 = r_rs1;
	}
	public String getR_rs2() {
		return r_rs2;
	}
	public void setR_rs2(String r_rs2) {
		this.r_rs2 = r_rs2;
	}
	public String getR_rs3() {
		return r_rs3;
	}
	public void setR_rs3(String r_rs3) {
		this.r_rs3 = r_rs3;
	}
	public String getR_con() {
		return r_con;
	}
	public void setR_con(String r_con) {
		this.r_con = r_con;
	}
	public Date getR_time() {
		return r_time;
	}
	public void setR_time(Date r_time) {
		this.r_time = r_time;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getR_e_time() {
		return r_e_time;
	}
	public void setR_e_time(Date r_e_time) {
		this.r_e_time = r_e_time;
	}
	@Override
	public String toString() {
		return "ReportVO [r_seq=" + r_seq + ", r_status=" + r_status + ", r_rs1=" + r_rs1 + ", r_rs2=" + r_rs2
				+ ", r_rs3=" + r_rs3 + ", r_con=" + r_con + ", r_time=" + r_time + ", r_e_time=" + r_e_time + ", seq="
				+ seq + ", title=" + title + "]";
	}

    

}
