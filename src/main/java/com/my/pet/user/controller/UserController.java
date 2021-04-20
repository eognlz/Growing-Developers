package com.my.pet.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.pet.user.service.IUserService;
import com.my.pet.user.vo.UserVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	IUserService iservice;
	
	//문자열 배열 ( dog폴더의 파일이름을 
	
	
	@GetMapping(value="")
	public String main(Model model, HttpSession session) {
		System.out.println("test");
		//model.addAttribute("godList", 배열);
		//String userId = (String) session.getAttribute("userId");
		System.out.println("sessionId : "+(String)session.getAttribute("userId"));
		/*String likeck = iservice.getLike_check(userId);
		System.out.println("likeck : "+likeck);
		if(likeck.equals(userId)) {
			model.addAttribute("mno",likeck);
		}*/
		
		return "user/home";
	}
	
	@GetMapping(value="loginPage")
	public void loginPage() {}
	
	@GetMapping(value="joinPage")
	public void joinPage() {}
	
	@GetMapping(value="address")
	public void address() {}
	
	@GetMapping(value="header")
	public String header() {
		System.out.println("header");
		return "include/header";
	}
	
	@PostMapping(value="userlogin")
	public String userjoin(String userId,String userPw, Model model, 
			UserVO vo, HttpSession session) {
		UserVO db = iservice.getPassSearch(userId);
		if(db != null) {
			if(userPw.equals(db.getUserPw())) {
				session.setAttribute("userId", userId);
				UserVO userinfo = iservice.getInfo(userId);
				session.setAttribute("userPhone", userinfo.getUserPhone());
				session.setAttribute("userNick", userinfo.getUserNick());
				model.addAttribute("message","로그인 성공!!");
				return "user/home";
			}else {
				model.addAttribute("message","비밀번호를 확인해주세요.");
				return "user/loginPage";
			}
		}else {
			model.addAttribute("message","아이디를 확인해주세요.");
			return "user/loginPage";
		}
	}// userjoin end
	
	@GetMapping(value="loginOut")
	public String loginOut(HttpSession session) {
			session.invalidate();	//세션 초기화
		return "user/home";
	}
	@GetMapping(value="updatePage")
	public void updatePage(Model model,UserVO vo,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		System.out.println("userId: "+userId);
		UserVO tmp = iservice.getInfo(userId);
		System.out.println(tmp);
		model.addAttribute("vo",iservice.getInfo(userId));
		if(iservice.getInfo(userId) != null)
			System.out.println("vo : "+iservice.getInfo(userId));
		else
			System.out.println("vo값 널이다.");
	}
	
	@PostMapping(value="userUpdate")
	public String userUpdate(String userId,Model model,UserVO vo,HttpSession session) {
		userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		iservice.getUserUpdate(vo);
		System.out.println("회원정보수정");
		
		return "user/loginPage";	
	}

	@GetMapping(value="passSearchPage")
	public void passSearchPage() {}
	
	@PostMapping(value="userjoin")
	public String userJoin(Model model, UserVO vo) {
		iservice.insert(vo);
		model.addAttribute("join","회원가입 성공");
		return "user/loginPage";	
	}//boardList end
	
	@PostMapping(value="passSearch")
	public String passSearch(String userId,String userName,
			String userPhone, UserVO vo, Model model) {
		
		UserVO dbpw =  iservice.getPassSearch(userId);
		System.out.println("dbpw= "+dbpw);
		System.out.println("userId= "+userId);
		System.out.println("dbID= "+dbpw.getUserId());
		System.out.println("userName= "+userName);
		System.out.println("dbNAME= "+dbpw.getUserName());
		System.out.println("phone= "+userPhone);
		System.out.println("dbPHONE= "+dbpw.getUserPhone());
		if(dbpw.getUserId() != null) {
			if(userName.equals(dbpw.getUserName())) {
				if(userPhone.equals(dbpw.getUserPhone())) {
					model.addAttribute("pass", dbpw.getUserPw());
				}else {
					model.addAttribute("message","핸드폰 번호가 다릅니다.");
				}
			}else {
				model.addAttribute("message","이름이 다릅니다.");
			}
		}else {
			model.addAttribute("message","아이디가 다릅니다.");
		}
		return "user/passSearchPage";
	}//passSearch end
	
	
	
	
}
