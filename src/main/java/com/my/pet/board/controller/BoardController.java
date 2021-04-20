package com.my.pet.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.pet.board.service.IBoardService;
import com.my.pet.board.vo.CatVo;
import com.my.pet.board.vo.ComVo;
import com.my.pet.board.vo.DogVo;
import com.my.pet.board.vo.LiketoVo;
import com.my.pet.board.vo.TrainingVo;
import com.my.pet.user.vo.UserVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	IBoardService ibservice;

	@GetMapping(value = "list")
	public String boardList(Model model) {
		model.addAttribute("list", ibservice.getList());
		return "board/boardList";
	}

	@GetMapping(value = "boardInsertPage")
	public void bipage() {
	}

	@PostMapping(value = "boardinsert")
	public String boardinsert(@RequestParam MultipartFile file, Model model, CatVo vo) {
		if (file != null & !file.isEmpty()) {
			try {
				vo.setC_pic(file.getBytes());
				vo.setC_picsize(file.getSize());
			} catch (IOException e) {
				System.out.println("파일 pic,size 오류!");
				e.printStackTrace();
			}
			ibservice.insert(vo);
		}
		return "redirect:/board/list";
	}

	@GetMapping(value = "pic/{d_num}")
	public ResponseEntity<byte[]> getPic(@PathVariable int d_num, Model model) {
		//System.out.println("pic 실행");
		//System.out.println("p_num: " + d_num);
		DogVo dvo = ibservice.getInfo(d_num);
		System.out.println("dvo= " + dvo);
		final HttpHeaders headers = new HttpHeaders(); // http헤더
		if (dvo.getD_pic() != null) {
			headers.setContentType(new MediaType("image", "jpeg"));
			headers.setContentDispositionFormData("attachment", "사진");
			headers.setContentLength(dvo.getD_picsize());

			return new ResponseEntity<byte[]>(dvo.getD_pic(), headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping(value = "d_search")
	public String boardSearch(String title, Model model) {
		System.out.println("d_select: " + title);
		title = "%" + title + "%";
		model.addAttribute("list", ibservice.getSearch(title));
		return "dog/dogList";
	}

	// --------------------- 강이지 -----------------------------------

	@GetMapping(value = "dogList")
	public String dogList(Model model, HttpSession session, DogVo vo) {
		session.setAttribute("userId", session.getAttribute("userId"));
		List<DogVo> dnum = ibservice.getDogList();
		model.addAttribute("list", dnum);
		// int cnt = ibservice.getLikeCount(dnum.get(vo.getD_num()));
		// System.out.println("dogList_vo.getD_num: "+dnum.get(vo.getD_num()));
		return "dog/dogList";
	}

	@GetMapping(value = "dogInsertPage")
	public String dogInsertPage() {
		return "dog/dogInsertPage";
	}

	@PostMapping(value = "dogInsert")
	public String dogInsert(@RequestParam MultipartFile file, Model model, DogVo vo, HttpSession session) {
		if (file != null & !file.isEmpty()) {
			try {
				vo.setD_pic(file.getBytes());
				vo.setD_picsize(file.getSize());
			} catch (IOException e) {
				System.out.println("파일 pic,size 오류!");
				e.printStackTrace();
			}

			System.out.println("dogInsert");
			String userId = (String) session.getAttribute("userId");
			System.out.println("userId : " + userId);
			vo.setP_user(userId);

			System.out.println("----------------");
			System.out.println("p_user: " + vo.getP_user());
			System.out.println("d_title: " + vo.getD_title());
			System.out.println("d_name: " + vo.getD_name());
			System.out.println("d_content: " + vo.getD_content());
			System.out.println("d_pic : " + file);
			System.out.println("-----------------");
			ibservice.DogInsert(vo);
		}
		return "redirect:/board/dogList";
	}

	@GetMapping(value = "dogView/{d_num}")
	public String dogView(@PathVariable int d_num, DogVo vo, Model model) {
		model.addAttribute("info", ibservice.getInfo(d_num));
		return "dog/dogView";
	}

	@GetMapping(value = "updatePage/{d_num}")
	public String updatePage(@PathVariable int d_num, DogVo vo, Model model) {
		// DogVo dvo = ibservice.getInfo(d_num);
		System.out.println("update_d_num: " + d_num);
		DogVo dvo = ibservice.getInfo(d_num);
		model.addAttribute("info", dvo);

		return "dog/dogUpdatePage";
	}

	@PostMapping(value = "dogUpdate")
	public String dogUpdate(MultipartFile file, Model model, DogVo vo) {
		System.out.println("dogUpdate 실행");
		if (file != null && !file.isEmpty()) {
			try {
				vo.setD_pic(file.getBytes());
				vo.setD_picsize(file.getSize());
			} catch (IOException e) {
				System.out.println("파일 pic,size 오류!");
				e.printStackTrace();
			}
		}
//		System.out.println("dogUpdate 실행");
//		System.out.println("d_content: "+vo.getD_content());
//		System.out.println("VO - d_num: "+vo.getD_num());
//		System.out.println("d_num: "+d_num);
//		System.out.println("d_pic: "+vo.getD_pic());

		ibservice.getDogUpdate(vo);
		return "redirect:/board/dogList";
	}

	@GetMapping(value = "dogDelete/{d_num}")
	public String dogDelete(@PathVariable int d_num, Model model) {
		ibservice.getDogDelete(d_num);
		return "redirect:/board/dogList";
	}

	@GetMapping(value = "likeCount")
	@ResponseBody
	public int likeCount(Model model, int d_num, String p_user) {
		// System.out.println("LikeCount 실행");
		int cnt = ibservice.getLikeCount(d_num);
		// model.addAttribute("count",ibservice.getLikeCount(d_num));
		// model.addAttribute("check",ibservice.getLikeCheck());
		/*
		 * System.out.println("vo.getD_num: "+vo.getD_num());
		 * System.out.println("vo.getP_user: "+vo.getP_user());
		 * model.addAttribute("count",ibservice.getLikeCount(vo));
		 */
		return cnt;
	}

	@PostMapping(value = "likeCheck")
	@ResponseBody
	public int likeCheck(LiketoVo vo) {
		int likeSu = ibservice.getLikeCheck(vo);
		// System.out.println("likeSu: "+likeSu);
		return likeSu;
	}

	@PostMapping(value = "likeUpdate")
	@ResponseBody
	public int likeUpdate(Model model, LiketoVo vo) {
		System.out.println("체크먼저 실행한다");
		System.out.println(vo);
		int likeSu = ibservice.getLikeCheck(vo);
//		System.out.println("likeSu: "+likeSu);
		// model.addAttribute("likeCheck",likeSu);
		if (likeSu == 0) {
			System.out.println("likeADD 실행한다");
			ibservice.getLikeAdd(vo);
			System.out.println("likeUpdate: " + vo);
			model.addAttribute("likeCheck", 1); // 모델은 jsp파일에 DB데이터 옮겨주려고 사용한다!
		} else {
			System.out.println("likeDELETE 실행한다");
			ibservice.getLikeDelete(vo);
			model.addAttribute("likeCheck", 0);
		}
//		System.out.println("likeUpdate 실행");
//		System.out.println("p_user: "+vo.getP_user());
		return likeSu;
	}

	// --------------------- 고양이 -----------------------------------

	@GetMapping(value = "catList")
	public String catList(Model model, HttpSession session, CatVo vo) {
		session.setAttribute("userId", session.getAttribute("userId"));
		List<CatVo> clist = ibservice.getCatList();

		// for문 돌리고 Map 사용 해보자! pic 에 count 넣어놓았다.
//		for(int i=0;i<clist.size();i++) {
//			System.out.println("catList_c_num "+i+" : "+clist.get(i).getC_num());
//			c_count(clist.get(i).getC_num(),model);
//		}
		model.addAttribute("list", clist);
		// model.addAttribute("c_count",ibservice.getLikeCount());
		// catInsertPage();
		// Map {key:c_num: link}

		return "cat/catList";
	}

	@GetMapping(value = "catInsertPage")
	public String catInsertPage() {
		// System.out.println("catInsertPage 실행");
		return "cat/catInsertPage";
	}

	@PostMapping(value = "catInsert.do")
	public String catInsert(@RequestParam MultipartFile file, Model model, CatVo vo, HttpSession session) {
		if (file != null && !file.isEmpty()) {
			try {
				vo.setC_pic(file.getBytes());
				vo.setC_picsize(file.getSize());
			} catch (IOException e) {
				System.out.println("파일 pic,size 오류!");
				e.printStackTrace();
			}
			System.out.println("catInsert.do 실행");
			String userId = (String) session.getAttribute("userId");
			System.out.println("userId : " + userId);
			vo.setP_user(userId);

			ibservice.CatInsert(vo);
		}
		return "redirect:/board/catList";
	}

	@GetMapping(value = "cpic/{c_num}")
	public ResponseEntity<byte[]> getcPic(@PathVariable int c_num, Model model) {
//		System.out.println("cpic 실행");
//		System.out.println("c_num: " + c_num);
		CatVo cvo = ibservice.getCatInfo(c_num);
		// c_count(c_num, model);
		System.out.println("cvo= " + cvo);
		final HttpHeaders headers = new HttpHeaders(); // http헤더
		if (cvo.getC_pic() != null) {
			headers.setContentType(new MediaType("image", "jpeg"));
			headers.setContentDispositionFormData("attachment", "사진");
			headers.setContentLength(cvo.getC_picsize());

			return new ResponseEntity<byte[]>(cvo.getC_pic(), headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping(value = "c_count")
	@ResponseBody
	public int c_count(int c_num, Model model) {
		//System.out.println("c_count 값(" + c_num + "): " + ibservice.CatLikeCount(c_num));
		int cnt = ibservice.CatLikeCount(c_num);
		return cnt;

	}

	@GetMapping(value = "c_search")
	public String c_search(String title, Model model) {
		System.out.println("c_title: " + title);
		title = "%" + title + "%";
		model.addAttribute("list", ibservice.getCatSearch(title));
		return "cat/catList";
	}

	@PostMapping(value = "CL_Check")
	@ResponseBody
	public int c_Check(LiketoVo vo) {
		int likeCheck = ibservice.getCL_Check(vo);
		// System.out.println("clikeCheck: "+likeCheck);
		// System.out.println("likeSu: "+likeSu);
		return likeCheck;
	}

	@PostMapping(value = "clikeUpdate")
	@ResponseBody
	public int clikeUpdate(LiketoVo vo) {
		int likeCheck = ibservice.getCL_Check(vo);
		if (likeCheck == 0) {
			System.out.println("CatLikeADD 실행한다");
			ibservice.getCatLikeAdd(vo);
			System.out.println("clikeUpdateADD: " + vo);
			likeCheck = 1;
		} else {
			System.out.println("CatLikeDelete 실행한다");
			ibservice.getCatLikeDelete(vo);
			System.out.println("clikeUpdateDELETE: " + vo);
			likeCheck = 0;
		}
		return likeCheck;
	}

	// --------------------------펫 트레이닝----------------------------
	@GetMapping(value = "trainingList")
	public String trainingList(Model model, TrainingVo vo) {
		List<TrainingVo> tList = ibservice.trainingList();
		model.addAttribute("tList", tList);
		return "training/trainingList";
	}

	@GetMapping(value = "trainingInsertPage")
	public String TrainingInsertPage() {
		return "training/trainingInsertPage";
	}

	@PostMapping(value = "trainingInsert.do")
	public String trainingInsert(Model model, HttpSession session, TrainingVo vo) {
		System.out.println("trainingInsert 실행");
		String userId = (String) session.getAttribute("userId");
		String userNick = (String) session.getAttribute("userNick");
		System.out.println("userId: " + userId + " userNick: " + userNick);
		vo.setT_content(vo.getT_content().replaceAll("\r\n", "<br>"));
		// replaceAll("\r\n", "<br>");
		// 이 매서드가 개행문자를 문자열로 처리하는 기능을 합니다. DB에는 <br>이라고 저장이 됩니다.
		String t_path = vo.getT_path().replace("\r\n", "<br>");
		vo.setP_user(userId);
		vo.setP_nick(userNick);

		vo.setT_path(t_path);
		// vo.setT_path("'"+vo.getT_path()+"'");
		System.out.println(vo);
		ibservice.getTInsert(vo);
		return "redirect:/board/trainingList";
	}

	@GetMapping(value = "trainingView/{t_num}")
	public String trainingView(@PathVariable int t_num, Model model) {
		TrainingVo vo = ibservice.getTView(t_num);
		model.addAttribute("trainView", vo);
		return "training/trainingView";
	}
	
	@GetMapping(value="trainingUpdatePage/{t_num}")
	public String trainingUpdatePage(@PathVariable int t_num, Model model, TrainingVo vo) {
		vo = ibservice.getTView(t_num);
		vo.setT_content(vo.getT_content().replace("<br>","\r\n"));	//DB<br>을 다시 원래대로 돌리기 !!
		model.addAttribute("trainView", vo);
		return "training/trainingUpdatePage";
	}

	@PostMapping(value="trainingUpdate.do")
	public String trainingUpdate(Model model, TrainingVo vo) {
		int t_num = vo.getT_num();
		vo.setT_content(vo.getT_content().replaceAll("\r\n", "<br>"));
		vo.setT_path(vo.getT_path().replace("\r\n", "<br>"));
		ibservice.trainingUpdate(vo);
		return "redirect:/board/trainingView/"+t_num;
	}
	
	@GetMapping(value="trainingDelete/{t_num}")
	public String trainingDelete(@PathVariable int t_num) {
		ibservice.trainingDelete(t_num);
		return "redirect:/board/trainingList";
	}
	
	@GetMapping(value="trainingSearch")
	public String trainSearch(TrainingVo vo, Model model) {
		System.out.println("trainingSearch 실행");
		String title = "%" + vo.getT_title() + "%";
		System.out.println("t_title: "+title);
		List<TrainingVo> tList = ibservice.getTrainSearch(title);
		for(TrainingVo tl : tList) {
		System.out.println("TListSize: "+ tl);
		}
		model.addAttribute("tList",tList);
		return "training/trainingList";
	}
	

	// --------------------------방문예약----------------------------

	@GetMapping(value = "comList")
	public String comList(Model model, ComVo vo) {
		List<ComVo> cvo = ibservice.getComList();
		model.addAttribute("comList", cvo);
		return "com/comList";
	}

	@GetMapping(value = "comInsertPage")
	public String comInsertPage() {
		return "com/comInsertPage";
	}

	@PostMapping(value = "comInsert.do")
	public String comInsert(Model model, HttpSession session, ComVo vo) {
		System.out.println("comInsert.do 실행");
		String userId = (String) session.getAttribute("userId");
		String userNick = (String) session.getAttribute("userNick");
		String userPhone = (String) session.getAttribute("userPhone");
		/*
		 * 안되는 코드 UserVO uvo = (UserVO) session.getAttribute("userInfo");
		 * System.out.println("uvo : "+uvo);
		 */
		vo.setP_user(userId);
		vo.setP_nick(userNick);
		vo.setP_phone(userPhone);
		vo.setCom_content(vo.getCom_content().replaceAll("\r\n", "<br>"));
		ibservice.setComIn(vo);
		return "redirect:/board/comList";
	}

	@GetMapping(value = "comSearch")
	@ResponseBody
	public List<ComVo> comSearch(String c_title) {
		System.out.println("comSearch 실행");
		String title = "%" + c_title + "%";
		System.out.println("c_title: "+title);
		List<ComVo> cList = ibservice.getComSearch(title);
		for(ComVo cl : cList) {
		System.out.println("cListSize: "+ cl);
		}
		return cList;
	}
	
	@GetMapping(value = "comSearch2")
	public String comSearch2(ComVo vo,Model model) {
		System.out.println("comSearch2 실행");
		String title = "%" + vo.getCom_title() + "%";
		System.out.println("c_title2: "+title);
		List<ComVo> cList = ibservice.getComSearch(title);
		for(ComVo cl : cList) {
		System.out.println("cListSize2: "+ cl);
		}
		model.addAttribute("comList",cList);
		return "com/comList";
	}

	@GetMapping(value = "comView/{com_num}")
	public String comView(@PathVariable int com_num, Model model) {
		model.addAttribute("comView", ibservice.getComView(com_num));
		return "com/comView";
	}

	 @GetMapping(value="comUpdatePage/{com_num}")
	 public String comUpdatePage(@PathVariable int com_num, Model model, ComVo vo) {
		 vo = ibservice.getComView(com_num);
		 vo.setCom_content(vo.getCom_content().replace("<br>","\r\n"));	//DB<br>을 다시 원래대로 돌리기 !!
		 model.addAttribute("comView",vo);
		 return "com/comUpdatePage"; 
	}
	 @PostMapping(value="comUpdatePage.do")
	 public String comUpdate( ComVo vo, Model model){
		 System.out.println("comUpdate 실행");
		 vo.setCom_content(vo.getCom_content().replace("\r\n","<br>"));
		 ibservice.comUpdate(vo);
		 return "redirect:/board/comList";
	 }
	
	 @GetMapping(value="comDelete/{com_num}")
	 public String comDelete(@PathVariable int com_num, Model model) {
		 ibservice.comDelete(com_num);
		 return "redirect:/board/comList";
	 }
}
