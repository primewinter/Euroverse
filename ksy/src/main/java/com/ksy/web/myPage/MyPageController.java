package com.ksy.web.myPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	
	public MyPageController() {
		System.out.println(this.getClass());
	}



}
