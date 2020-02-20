package com.ksy.web.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.validator.ValidateWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.User;
import com.ksy.service.user.UserService;

import net.bytebuddy.asm.Advice.This;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminservice;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	public AdminController() {

		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;
	
	@RequestMapping(value="getUserList")
	public String getUserList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println(this.getClass()+"getUserList");
		
		User user = new User();
		
		//현재 페이지가 null일 경우 디폴트 1로 유지
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map에  getUserList 담기
		Map<String, Object> map = adminservice.getUserList(search);
		
		//페이지를 눌렀을때 결과페이지의 페이지값을 찾아오는 작업 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("map.get ==>"+map.get("list"));
		
		//view(jsp)로 데이터전송
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/admin/getUserList.jsp";
		
	}// end of getUserList
	
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
		
		System.out.println(this.getClass()+"getUser");
		
		User user = new User();
		user = userService.getUser(userId);
		
		//view(jsp)로 데이터전송
		model.addAttribute("user", user);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/user/getUser.jsp";
		
	}// end of getUser
	
	
	@RequestMapping(value="getAdminQnAList", method=RequestMethod.GET)
	public String getAdminQnAList(@RequestParam("search") Search search, Model model) throws Exception {
		
		System.out.println(this.getClass()+"getAdminQnaList");
		
		Post post = new Post();
		
		//현재 페이지가 null일 경우 디폴트 1로 유지
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map에  getUserList 담기
		Map<String, Object> map = adminservice.getAdminQnAList(search);
		
		//페이지를 눌렀을때 결과페이지의 페이지값을 찾아오는 작업 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("map.get ==>"+map.get("list"));
		
		//view(jsp)로 데이터전송
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		System.out.println("model ==>"+model);
		
		return "forward:/view/admin/getAdminQnAList.jsp";
		
	}// end of getUser
	
}//end of class
