package com.my.pet.board.dao;

import java.util.List;

import com.my.pet.board.vo.CatVo;
import com.my.pet.board.vo.ComVo;
import com.my.pet.board.vo.DogVo;
import com.my.pet.board.vo.LiketoVo;
import com.my.pet.board.vo.TrainingVo;


public interface IBoardRepository {

	void insert(CatVo vo);

	List<CatVo> getList();

//	CatVo getInfo(String cname);

//	List<CatVo> getSearch(String select);

	
	//강아지
	List<DogVo> getDogList();
	
	void DogInsert(DogVo vo);

	DogVo getDogInfo(String d_name);

	DogVo getInfo(int d_num);
	
	List<DogVo> getSearch(String title);

	void getDogUpdate(DogVo vo);

	void getDogDelete(int d_num);
	
	int getLikeCheck(LiketoVo vo);

	int getLikeCount(int d_num);

	void getLikeAdd(LiketoVo vo);

	void getLikeDelete(LiketoVo vo);

	
	//고양이
	List<CatVo> getCatList();

	void CatInsert(CatVo vo);

	CatVo getCatInfo(int c_num);

	List<CatVo> getCatSearch(String title);

	int CatLikeCount(int c_num);

	int getCL_Check(LiketoVo vo);

	void getCatLikeAdd(LiketoVo vo);

	void getCatLikeDelete(LiketoVo vo);


	
	//펫 트레이닝
	List<TrainingVo> trainingList();
	
	void getTInsert(TrainingVo vo);

	TrainingVo getTView(int t_num);

	void trainingDelete(int t_num);
	
	void trainingUpdate(TrainingVo vo);

	List<TrainingVo> getTrainSearch(String title);
	
	// 방문예약
	void setComIn(ComVo vo);

	List<ComVo> getComList();

	List<ComVo> getComSearch(String title);

	ComVo getComView(int com_num);

	void comUpdate(ComVo vo);

	void comDelete(int com_num);

	

	

	
	
}
