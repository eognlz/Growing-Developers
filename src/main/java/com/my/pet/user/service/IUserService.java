package com.my.pet.user.service;

import com.my.pet.user.vo.UserVO;

public interface IUserService {

	void insert(UserVO vo);

	UserVO getPassSearch(String userId);

	String getLike_check(String userId);

	void getUserUpdate(UserVO vo);

	UserVO getInfo(String userId);

	

	
	
}
