package com.my.pet.user.vo;

/*CREATE TABLE usertable (
		p_user	    varchar2(20)	primary key,
		p_pass	    varchar2(20)	NOT NULL,
		p_name	    varchar2(10)	NOT NULL,
		p_nick	    varchar2(10)	NOT NULL,
	    p_phone	    number(13)	    NOT NULL,
		p_email 	varchar2(40)	NOT NULL,
		p_address	varchar2(50)	NOT NULL,
		p_point	    number(10)	NULL
	);*/
public class UserVO {
	String userId;
	String userPw;
	String userName;
	String userNick;
	String userPhone;
	String userEmail;
	String userAddnum;
	String userAddress;
	String userDetails;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddnum() {
		return userAddnum;
	}
	public void setUserAddnum(String userAddnum) {
		this.userAddnum = userAddnum;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(String userDetails) {
		this.userDetails = userDetails;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userNick=" + userNick
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userAddnum=" + userAddnum
				+ ", userAddress=" + userAddress + ", userDetails=" + userDetails + "]";
	}

	
}
