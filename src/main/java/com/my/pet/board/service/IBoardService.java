package com.my.pet.board.service;

import java.util.List;

import com.my.pet.board.vo.CatVo;
import com.my.pet.board.vo.ComVo;
import com.my.pet.board.vo.DogVo;
import com.my.pet.board.vo.LiketoVo;
import com.my.pet.board.vo.TrainingVo;

public interface IBoardService {
	
	// board
	void insert(CatVo vo);

	List<CatVo> getList();

//	DogVo getInfo(String cname);

//	List<CatVo> getSearch(String select);

	
	// 강아지
	List<DogVo> getDogList();
	
	void DogInsert(DogVo vo);

	DogVo getDogInfo(String d_name);
	
	DogVo getInfo(int d_num);
	
	List<DogVo> getSearch(String title);

	void getDogUpdate(DogVo vo);

	void getDogDelete(int d_num);

	int getLikeCount(int d_num);//좋아요 갯수

	int getLikeCheck(LiketoVo vo);//회원이 좋아요 눌렀는지 체크
	
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

	void trainingUpdate(TrainingVo vo);
	
	void trainingDelete(int t_num);
	
	List<TrainingVo> getTrainSearch(String title);
	//방문예약
	void setComIn(ComVo vo);

	List<ComVo> getComList();

	List<ComVo> getComSearch(String title);

	ComVo getComView(int com_num);

	void comUpdate(ComVo vo);

	void comDelete(int com_num);

	

	

	


	
	
}
