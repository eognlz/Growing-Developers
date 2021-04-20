package com.my.pet.board.vo;

import java.util.Date;

public class DogVo {
 private int d_num;
 private String p_user;
 private String d_title;
 private String d_name;
 private String d_content;
 private Date d_date;
 private byte[] d_pic;
 private long d_picsize;
 
public Integer getD_num() {
	return d_num;
}
public void setD_num(Integer d_num) {
	this.d_num = d_num;
}
public String getP_user() {
	return p_user;
}
public void setP_user(String p_user) {
	this.p_user = p_user;
}
public String getD_title() {
	return d_title;
}
public void setD_title(String d_title) {
	this.d_title = d_title;
}
public String getD_name() {
	return d_name;
}
public void setD_name(String d_name) {
	this.d_name = d_name;
}
public String getD_content() {
	return d_content;
}
public void setD_content(String d_content) {
	this.d_content = d_content;
}
public Date getD_date() {
	return d_date;
}
public void setD_date(Date d_date) {
	this.d_date = d_date;
}
public byte[] getD_pic() {
	return d_pic;
}
public void setD_pic(byte[] d_pic) {
	this.d_pic = d_pic;
}
public long getD_picsize() {
	return d_picsize;
}
public void setD_picsize(long d_picsize) {
	this.d_picsize = d_picsize;
}
@Override
public String toString() {
	return "DogVo [d_num=" + d_num + ", p_user=" + p_user + ", d_title=" + d_title + ", d_name=" + d_name
			+ ", d_content=" + d_content + "]";
}

}
