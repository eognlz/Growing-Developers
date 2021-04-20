package com.my.pet.board.vo;

import java.util.Date;

public class CatVo {

	/* 고양이 테이블
	CREATE TABLE cattable (
		c_num	    number	        primary key,
		p_user	    varchar2(20)	NOT NULL,
		c_title 	varchar2(20)	NOT NULL,
		c_name 	    varchar2(10)	NOT NULL,
	    c_content	varchar2(50)	NULL,
		c_date	    Date	NULL,
		c_pic	    blob	NULL,
		c_picsize	varchar2(100)	NULL,
	    FOREIGN KEY (p_user) REFERENCES usertable (p_user)
	);
	*/

	private int c_num;
	private String p_user;
	private String c_title;
	private String c_name;
	private String c_content;
	private Date c_date;
	private byte[] c_pic;
	private long c_picsize;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getP_user() {
		return p_user;
	}
	public void setP_user(String p_user) {
		this.p_user = p_user;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public byte[] getC_pic() {
		return c_pic;
	}
	public void setC_pic(byte[] c_pic) {
		this.c_pic = c_pic;
	}
	public long getC_picsize() {
		return c_picsize;
	}
	public void setC_picsize(long c_picsize) {
		this.c_picsize = c_picsize;
	}
	@Override
	public String toString() {
		return "CatVo [c_num=" + c_num + ", p_user=" + p_user + ", c_title=" + c_title + ", c_name=" + c_name
				+ ", c_content=" + c_content + "]";
	}
	
}
