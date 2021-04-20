package com.my.pet.board.vo;

public class LiketoVo {

	private int c_num;
	private int d_num;
	private String p_user;
	private int lt_like;
	
	int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public String getP_user() {
		return p_user;
	}
	public void setP_user(String p_user) {
		this.p_user = p_user;
	}
	public int getLt_like() {
		return lt_like;
	}
	public void setLt_like(int lt_like) {
		this.lt_like = lt_like;
	}
	@Override
	public String toString() {
		return "LiketoVo [c_num=" + c_num + ", d_num=" + d_num + ", p_user=" + p_user + ", lt_like=" + lt_like + "]";
	}
	
	
}
