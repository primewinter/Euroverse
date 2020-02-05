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
		System.out.println("�ǳ�?");
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
		cityList.add("����1");
		cityList.add("����2");
		cityList.add("����3");
		cityList.add("����4");
		cityList.add("����5");
		cityList.add("����6");
		cityList.add("����7");
		cityList.add("����8");
		cityList.add("����9");
		cityList.add("����10");
		cityList.add("����11");
		cityList.add("����12");
		cityList.add("����13");
		cityList.add("����14");
		cityList.add("����15");
		cityList.add("����16");
		cityList.add("����17");
		
		List tripStyle = new ArrayList();
		tripStyle.add("�Թ�");
		tripStyle.add("�賶����");
		tripStyle.add("�ǿ�");
		tripStyle.add("��õ");
		tripStyle.add("����");
		
		
		model.addAttribute("cityList",cityList);
		model.addAttribute("tripStyle",tripStyle);
		
	
		return "forward:/view/user/addUser.jsp";
	}
	
	
}
