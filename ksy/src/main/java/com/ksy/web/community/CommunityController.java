package com.ksy.web.community;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
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
import com.ksy.service.domain.Tag;

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
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;

	@Scheduled(cron="0 0 10 * * ?") 
	public void dayBest() throws Exception {

		Calendar calendar = Calendar.getInstance();
	
		communityService.dayBestReset();
		 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		System.out.println("�ϰ� �α�� �ʱ�ȭ : "+dateFormat.format(calendar.getTime()));
	}
	
	@Scheduled(cron="0 0 10 ? * MON") 
	public void weekBest() throws Exception {

		Calendar calendar = Calendar.getInstance();
	
		communityService.weekBestReset();
		 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		System.out.println("�ְ� �α�� �ʱ�ȭ : "+dateFormat.format(calendar.getTime()));
	}
	
	@Scheduled(cron="0 0 10 1 * ?") 
	public void monthBest() throws Exception {

		Calendar calendar = Calendar.getInstance();
		 
		communityService.monthBestReset();
	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		System.out.println("���� �α�� �ʱ�ȭ : "+dateFormat.format(calendar.getTime()));
	}

	@RequestMapping( value="addPost", method=RequestMethod.GET )
	public String addPost( @RequestParam("boardName") String boardName ) throws Exception {
		
		System.out.println("/community/addPost : GET");
		
		if( boardName.equals("D") ) {
			return "forward:/community/addFindAccPostView.jsp";
		}
		return "forward:/view/community/addPostView.jsp";
	}
	
	@RequestMapping( value="addPost", method=RequestMethod.POST )
	public String addPost( @ModelAttribute Post post, @RequestParam("tagContent") String[] tagContent, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/addPost : POST");
	
		User user = (User)session.getAttribute("user");
		post.setPostWriterId(user.getUserId());

		communityService.addPost(post);
	
		for(int i=0; i<tagContent.length; i++) {
			communityService.addTag(tagContent[i], post.getPostId());
		}
		
		model.addAttribute("post", post);
		model.addAttribute("tagContent", tagContent);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="updatePost", method=RequestMethod.GET )
	public String updatePost( @RequestParam("postId") String postId, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/updatePost : GET");
		
		User user=(User)session.getAttribute("user");
		
		Post post = communityService.getPost(postId, user.getUserId());
		List<Tag> tag = communityService.getTagList(postId);
		
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		communityService.deleteTag(postId);
	
		return "forward:/view/community/updatePostView.jsp";
	}
	
	@RequestMapping( value="updatePost", method=RequestMethod.POST )
	public String updatePost( @ModelAttribute Post post, @RequestParam("tagContent") String[] tagContent, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/updatePost : POST");
		User user=(User)session.getAttribute("user");
		
		communityService.updatePost(post);
		
		System.out.println("/community/updateTag : POST");
		for(int i = 0; i < tagContent.length; i++) {
			communityService.addTag(tagContent[i], post.getPostId());
		}
	
		post = communityService.getPost(post.getPostId(), user.getUserId());
		List<Tag> tag = communityService.getTagList(post.getPostId());
		
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPost", method=RequestMethod.GET )
	public String getPost( @RequestParam("postId") String postId , Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/getPost : GET");
		User user=(User)session.getAttribute("user");
		
		//Business Logic
		Post post = communityService.getPost(postId, user.getUserId());
		List<Tag> tag = communityService.getTagList(postId);
		
		// Model �� View ����
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPostList" )
	public String getPostList( @RequestParam("boardName") String boardName, @ModelAttribute("search") Search search, Model model, HttpSession session ) throws Exception{
		
		System.out.println("/community/getPostList : GET / POST");
		////////���յǸ� �������� �κ�////////
		User user = new User();
		user.setUserName("����");
		user.setUserId("admin");
		session.setAttribute("user", user);
		///////////////////////////////
		System.out.println("boardName : "+boardName);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=communityService.getPostList(search, boardName);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("boardName", boardName);
		
		return "forward:/view/community/getPostList.jsp";
	}
}