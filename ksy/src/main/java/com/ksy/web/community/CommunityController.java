package com.ksy.web.community;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.User;
import com.ksy.service.like.LikeService;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;
import com.ksy.service.domain.Tag;
import com.ksy.service.domain.TripSurvey;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
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
	
		System.out.println("일간 인기글 초기화 : "+dateFormat.format(calendar.getTime()));
	}
	
	@Scheduled(cron="0 0 10 ? * MON") 
	public void weekBest() throws Exception {

		Calendar calendar = Calendar.getInstance();
	
		communityService.weekBestReset();
		 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		System.out.println("주간 인기글 초기화 : "+dateFormat.format(calendar.getTime()));
	}
	
	@Scheduled(cron="0 0 10 1 * ?") 
	public void monthBest() throws Exception {

		Calendar calendar = Calendar.getInstance();
		 
		communityService.monthBestReset();
	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		System.out.println("월간 인기글 초기화 : "+dateFormat.format(calendar.getTime()));
	}

	@RequestMapping( value="addPost", method=RequestMethod.GET )
	public String addPost( @RequestParam("boardName") String boardName ) throws Exception {
		
		System.out.println("/community/addPost : GET");
		
		if( boardName.equals("D") ) {
			return "forward:/view/community/addFindAccPostView.jsp";
		}
		return "forward:/view/community/addPostView.jsp";
	}
	
	@RequestMapping( value="addPost", method=RequestMethod.POST )
	public String addPost( @ModelAttribute Post post, @RequestParam("tagContent") String[] tagContent, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/addPost : POST");
	
		User user = (User)session.getAttribute("user");
		post.setPostWriterId(user.getUserId());
		post.setNickName(user.getNickname());
		
		communityService.addPost(post);
	
		for(int i=0; i<tagContent.length; i++) {
			communityService.addTag(tagContent[i], post.getPostId());
		}
		
		model.addAttribute("post", post);
		model.addAttribute("tagContent", tagContent);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="updatePost", method=RequestMethod.GET )
	public String updatePost( @RequestParam("postId") String postId, @RequestParam("boardName") String boardName, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/updatePost : GET");
		
		User user=(User)session.getAttribute("user");
		
		Post post = communityService.getPost(postId, user.getUserId(), boardName);
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
	
		post = communityService.getPost(post.getPostId(), user.getUserId(), post.getBoardName());
		List<Tag> tag = communityService.getTagList(post.getPostId());
		
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPost", method=RequestMethod.GET )
	public String getPost( @RequestParam("postId") String postId, @RequestParam("boardName") String boardName, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/getPost : GET");
		
		User user=(User)session.getAttribute("user");

		Post post = communityService.getPost(postId, user.getUserId(), boardName);
		List<Tag> tag = communityService.getTagList(postId);

		User userProfile = userService.getUser(user.getUserId());
		
		model.addAttribute("user", userProfile);
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		List<User> userList = new ArrayList<User>();
		List<String> tripStyle = new ArrayList<String>();
		
		if( boardName.equals("D") ) {
			
			List<Party> party = communityService.getParty(postId);
		
			for(int i=0; i<party.size(); i++) {
				User partyUser = userService.getUser(party.get(i).getPartyUserId());
				List<TripSurvey> tripSurvey = myPageService.getTripSurveyList(party.get(i).getPartyUserId());
				
				for(int j=0; j<tripSurvey.size(); j++) {
					if(tripSurvey.get(j).getSurveyType().equals("T")) {
					String surveyChoice = tripSurvey.get(j).getSurveyChoice();
					tripStyle.add(surveyChoice);
					partyUser.setTripStyle(tripStyle);
					}
				}
				userList.add(partyUser);
			}
			System.out.println("userList : "+userList);
			
			model.addAttribute("userList", userList);
			model.addAttribute("party", party);
			
			return "forward:/view/community/getAccFindPost.jsp";
		}
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPostList" )
	public String getPostList( @RequestParam("boardName") String boardName, @ModelAttribute("search") Search search, Model model, HttpServletRequest request ) throws Exception{
		
		System.out.println("/community/getPostList : GET / POST");
		System.out.println("boardName : "+boardName);
		
		String bestPost = request.getParameter("bestPost");
		System.out.println(bestPost);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		if( boardName.equals("C") ) {
			map = communityService.getBestPostList(search, boardName);
		}else {
			map = communityService.getPostList(search, boardName);
		}
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("boardName", boardName);
		
		if( boardName.equals("C") ) {
			return "forward:/view/community/getBestPostList.jsp";
		}else {
			return "forward:/view/community/getPostList.jsp";
		}
	}
}