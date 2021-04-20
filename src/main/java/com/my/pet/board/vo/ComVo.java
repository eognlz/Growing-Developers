package com.my.pet.board.vo;

public class ComVo {
	/*
	CREATE TABLE comtable (
			com_num 	number	primary key,
			p_user	    varchar2(20)	NOT NULL,
			com_nick	varchar2(30)	NOT NULL,
			com_title	varchar2(50)	NOT NULL,
			com_content	varchar2(100)	NULL,
		    p_phone     number(13)	    NOT NULL,
		    FOREIGN KEY (p_user) REFERENCES usertable (p_user)
		);*/
	
	private int com_num;
	private String p_user;
	private String p_nick;
	private String com_title;
	private String com_content;
	private String p_phone;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getP_user() {
		return p_user;
	}
	public void setP_user(String p_user) {
		this.p_user = p_user;
	}
	public String getP_nick() {
		return p_nick;
	}
	public void setP_nick(String p_nick) {
		this.p_nick = p_nick;
	}
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	@Override
	public String toString() {
		return "ComVo [com_num=" + com_num + ", p_user=" + p_user + ", p_nick=" + p_nick + ", com_title="
				+ com_title + ", com_content=" + com_content + ", p_phone=" + p_phone + "]";
	}
	
	
	
}
