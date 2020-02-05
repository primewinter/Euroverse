package com.ksy.web.community;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.User;
import com.ksy.service.like.LikeService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
	
	public CommunityController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping( value="addPost", method=RequestMethod.GET )
	public String addPost( @RequestParam("boardName") String boardName, Model model ) throws Exception {
		
		System.out.println("/community/addPost : GET");
		System.out.println("보드네임 : "+boardName);
		model.addAttribute("boardName", boardName);
		
		return "forward:/view/community/addPostView.jsp";
	}
	
	@RequestMapping( value="addPost", method=RequestMethod.POST )
	public String addPost( @ModelAttribute Post post, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/addPost : POST");

		User user = (User)session.getAttribute("user");
		post.setPostWriterId(user);
		
		communityService.addPost(post);
		
		model.addAttribute("post", post);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPost", method=RequestMethod.GET )
	public String getUser( @RequestParam("postId") String postId , Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/getPost : GET");
		//Business Logic
		Post post = communityService.getPost(postId);
		// Model 과 View 연결
		model.addAttribute("post", post);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPostList" )
	public String getPostList( @RequestParam("boardName") String boardName, @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/community/getPostList : GET / POST");

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=communityService.getPostList(search, boardName);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("boardName", boardName);
		
		return "forward:/view/community/getPostList.jsp";
	}
	
}