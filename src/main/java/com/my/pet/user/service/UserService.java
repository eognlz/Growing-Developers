package com.my.pet.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.user.dao.IUserRepository;
import com.my.pet.user.vo.UserVO;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserRepository repository;
	
	@Override
	public UserVO getInfo(String userId) {
		return repository.getInfo(userId);
	}
	
	@Override
	public void insert(UserVO vo) {
		 repository.insert(vo);
	}

	@Override
	public UserVO getPassSearch(String userId) {
		return repository.getPassSearch(userId);
	}

	@Override
	public String getLike_check(String userId) {
		return repository.getLike_check(userId);
	}

	

	@Override
	public void getUserUpdate(UserVO vo) {
		repository.getUserUpdate(vo);
		
	}

	

}
