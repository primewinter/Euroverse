package com.ksy.web.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(value="test" , method=RequestMethod.GET)
	public String test() {
		System.out.println("되나?");
		return "redirect:/view/user/page.jsp";
	
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
	
	
	@RequestMapping(value="addUser")
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
	
	
}
