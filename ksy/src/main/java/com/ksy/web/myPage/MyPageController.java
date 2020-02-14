package com.ksy.web.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.plan.PlanService;
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
	
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;

	 @Value("#{commonProperties['postPageUnit']}") int pageUnit;
	
	 @Value("#{commonProperties['postPageSize']}") int pageSize;
	

	public MyPageController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="pointList" )
	public String pointList(HttpSession session , @ModelAttribute("search") Search search, Model model)throws Exception {
		System.out.println("myPageController pointList");
		User user = (User)session.getAttribute("user");
		System.out.println(search);
		System.out.println("����ϴ�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = new HashMap<String, Object>();
		
			map = myPageService.getPointList(search, user.getUserId());

			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("@@@@@@@@@@@@"+map.get("pointList"));
		// Model �� View ����
		model.addAttribute("pointList", map.get("pointList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/view/myPage/pointList.jsp";
	}
	
	@RequestMapping(value="myPostCommentList")
	public String myPostCommentList(HttpSession session , Model model)throws Exception{
		User user = (User)session.getAttribute("user");
		Search search = new Search();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		Map<String,Object> postMap = myPageService.getMyPostList(search, user.getUserId());
		
		Map<String , Object> commentMap = myPageService.getMyCommentList(search, user.getUserId());
		
		System.out.println(postMap);
		System.out.println(postMap.get("list"));
		System.out.println(commentMap.get("list"));
		
		
		model.addAttribute("postList",postMap.get("list"));
		model.addAttribute("commentList",commentMap.get("list"));
		
		return "forward:/view/myPage/myPostCommentList.jsp";
	}

}
