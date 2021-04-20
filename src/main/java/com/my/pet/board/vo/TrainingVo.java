package com.my.pet.board.vo;

import java.util.Date;

public class TrainingVo {
/*
 CREATE TABLE training (
	t_num	    number	primary key,
	p_user	    varchar2(20)	NOT NULL,
    p_nick      varchar2(20)    NOT NULL,
	t_title	    varchar2(20)	NOT NULL,
	t_content	varchar2(100)	NULL,
    t_path      varchar2(300)   NULL,
    FOREIGN KEY (p_user) REFERENCES usertable (p_user)
);
 */
	
	private int t_num;
	private String p_user;
	private String p_nick;
	private String t_title;
	private String t_content;
	private String t_path;
	private Date t_date;
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
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
	public String getT_title() {
		return t_title;
	}
	public void setT_title(String t_title) {
		this.t_title = t_title;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public String getT_path() {
		return t_path;
	}
	public void setT_path(String t_path) {
		this.t_path = t_path;
	}
	public Date getT_date() {
		return t_date;
	}
	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}
	@Override
	public String toString() {
		return "TrainingVo [t_num=" + t_num + ", p_user=" + p_user + ", p_nick=" + p_nick + ", t_title=" + t_title
				+ ", t_content=" + t_content + ", t_path=" + t_path + "]";
	}
	
	
}
