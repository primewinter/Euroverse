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

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
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

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="getUserList")
	public String getUserList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println(this.getClass()+"getUserList");
		
		User user = new User();
		
		//현재 페이지를 항상 1로 유지
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
	
}//end of class
