package com.my.pet.user.dao;

import com.my.pet.user.vo.UserVO;

public interface IUserRepository {

	void insert(UserVO vo);

	UserVO getPassSearch(String userId);

	String getLike_check(String userId);

	void getUserUpdate(UserVO vo);

	UserVO getInfo(String userId);
}
