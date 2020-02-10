package com.ksy.web.user;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="login")
	public String login() {
		System.out.println(this.getClass()+"Login");
		return "redirect:/view/user/page.jsp";
	}
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println(this.getClass()+"logout");
		
		session.invalidate();
		
		return "redirect:/view/user/page.jsp";
	}
	
	
	
	
	@RequestMapping(value="addUser" , method = RequestMethod.GET)
	public String addUser(Model model)throws Exception{
		System.out.println(this.getClass()+"addUser");
		List cityList = new ArrayList();
		cityList.add("도시1");
		cityList.add("도시2");
		cityList.add("도시3");
		cityList.add("도시4");
		cityList.add("도시5");
		cityList.add("도시6");
		cityList.add("도시7");
		cityList.add("도시8");
		cityList.add("도시9");
		cityList.add("도시10");
		cityList.add("도시11");
		cityList.add("도시12");
		cityList.add("도시13");
		cityList.add("도시14");
		cityList.add("도시15");
		cityList.add("도시16");
		cityList.add("도시17");
		
		List tripStyle = new ArrayList();
		tripStyle.add("먹방");
		tripStyle.add("배낭여행");
		tripStyle.add("실연");
		tripStyle.add("온천");
		tripStyle.add("힐링");
		
		
		model.addAttribute("cityList",cityList);
		model.addAttribute("tripStyle",tripStyle);
		
	
		return "forward:/view/user/addUser.jsp";
	}
	
	@RequestMapping(value = "addUser" , method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")User user ,Model model) throws Exception {
		System.out.println("addUser POST Start");
		System.out.println(user);
		System.out.println(user.getDreamCity());
		System.out.println(user.getTripStyle());
		//드림시티랑 트립스타일도 따로 테이블? 로 관리하기 유저아이디랑 조인
		System.out.println("여기보세요!!!"+user.getImage().isEmpty());
		
		if(user.getImage().isEmpty()==false) {
		MultipartFile mhsr = (MultipartFile)user.getImage();
		String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\userImages";
		String originalName = "";
		originalName = new String(mhsr.getOriginalFilename().getBytes("8859_1"),"UTF-8");
		System.out.println(originalName);
		//		
		user.setUserImg("\\resources\\images\\userImages\\"+originalName);
		System.out.println("유저이미지"+user.getUserImg());
		File serverFile = new File(path+File.separator + originalName);
		mhsr.transferTo(serverFile);
		}else {
			user.setUserImg("\\resources\\images\\userImages\\defaultUserImage.jpg");
		}
		userService.addUser(user);
		
		System.out.println("하하하! 무사히 회원가입 성공~");
		
		
		return "redirect:/view/user/page.jsp";
	}
	
	@RequestMapping(value = "getUser" , method=RequestMethod.GET)
	public String getUser() {
		System.out.println(this.getClass()+"getUser Start");
		
		return "redirect:/view/user/getUser.jsp";
	}
	
	
}
