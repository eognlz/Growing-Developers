package com.my.pet.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.board.dao.IBoardRepository;
import com.my.pet.board.vo.CatVo;
import com.my.pet.board.vo.ComVo;
import com.my.pet.board.vo.DogVo;
import com.my.pet.board.vo.LiketoVo;
import com.my.pet.board.vo.TrainingVo;

@Service
public class BoardService implements IBoardService {

	@Autowired
	IBoardRepository ibrepository;

	@Override
	public List<CatVo> getList() {
		return ibrepository.getList();
	}
	@Override
	public void insert(CatVo vo) {
		ibrepository.insert(vo);
	}
	
	
	// 강아지
	@Override
	public List<DogVo> getDogList() {
		return ibrepository.getDogList();
	}
	
	@Override
	public void DogInsert(DogVo vo) {
		ibrepository.DogInsert(vo);
	}
	@Override
	public DogVo getDogInfo(String d_name) {
		return ibrepository.getDogInfo(d_name);
	}
	
	@Override
	public DogVo getInfo(int d_num) {
		return ibrepository.getInfo(d_num);
	}
	
	@Override
	public List<DogVo> getSearch(String title) {
		return ibrepository.getSearch(title);
	}
	@Override
	public void getDogUpdate(DogVo vo) {
		ibrepository.getDogUpdate(vo);
	}
	@Override
	public void getDogDelete(int d_num) {
		ibrepository.getDogDelete(d_num);
	}
	@Override
	public int getLikeCount(int d_num) {
		return ibrepository.getLikeCount(d_num);
	}
	@Override
	public int getLikeCheck(LiketoVo vo) {
		return ibrepository.getLikeCheck(vo);
	}
	@Override
	public void getLikeAdd(LiketoVo vo) {
		 ibrepository.getLikeAdd(vo);
	}
	@Override
	public void getLikeDelete(LiketoVo vo) {
		 ibrepository.getLikeDelete(vo);
	}
	
	//고양이
	@Override
	public List<CatVo> getCatList() {
		return ibrepository.getCatList();
	}
	@Override
	public void CatInsert(CatVo vo) {
		ibrepository.CatInsert(vo);
	}
	@Override
	public CatVo getCatInfo(int c_num) {
		return ibrepository.getCatInfo(c_num);
	}
	@Override
	public List<CatVo> getCatSearch(String title) {
		return ibrepository.getCatSearch(title);
	}
	@Override
	public int CatLikeCount(int c_num) {
		return ibrepository.CatLikeCount(c_num);
	}
	@Override
	public int getCL_Check(LiketoVo vo) {
		return ibrepository.getCL_Check(vo);
	}
	@Override
	public void getCatLikeAdd(LiketoVo vo) {
		ibrepository.getCatLikeAdd(vo);
	}
	@Override
	public void getCatLikeDelete(LiketoVo vo) {
		ibrepository.getCatLikeDelete(vo);
		
	}
	@Override
	public void getTInsert(TrainingVo vo) {
		ibrepository.getTInsert(vo);
	}
	
	//펫 트레이닝
	@Override
	public List<TrainingVo> trainingList() {
		return ibrepository.trainingList();
	}
	@Override
	public TrainingVo getTView(int t_num) {
		return ibrepository.getTView(t_num);
	}
	
	@Override
	public void trainingUpdate(TrainingVo vo) {
		ibrepository.trainingUpdate(vo);
	}
	
	@Override
	public void trainingDelete(int t_num) {
		ibrepository.trainingDelete(t_num);
	}
	@Override
	public List<TrainingVo> getTrainSearch(String title) {
		return ibrepository.getTrainSearch(title);
	}
	
	//방문 예약
	@Override
	public void setComIn(ComVo vo) {
		ibrepository.setComIn(vo);
	}
	@Override
	public List<ComVo> getComList() {
		return ibrepository.getComList();
	}
	@Override
	public List<ComVo> getComSearch(String title) {
		return ibrepository.getComSearch(title);
	}
	@Override
	public ComVo getComView(int com_num) {
		return ibrepository.getComView(com_num);
	}
	@Override
	public void comUpdate(ComVo vo) {
		ibrepository.comUpdate(vo);
	}
	@Override
	public void comDelete(int com_num) {
		ibrepository.comDelete(com_num);
	}
	
	
	
}
