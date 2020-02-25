package com.ksy.web.community;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.ksy.common.util.Util;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Day;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.User;
import com.ksy.service.like.LikeService;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;
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
	
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
	
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
	public String addPost( @RequestParam("boardName") String boardName, @RequestParam(required=false) String planId, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/addPost : GET");
		
		User user = (User)session.getAttribute("user");
		if( user == null) {
			return "redirect:/main.jsp";
		}
		
		if( boardName.equals("D") ) {
			return "forward:/view/community/addFindAccPostView.jsp";
		}else if( boardName.equals("E") ) {	//�÷��� �Խ��Ұ���
			
			List<Plan> listPlan = planService.getPlanList(user.getUserId());
			
			model.addAttribute("planList", listPlan);
			model.addAttribute("planId", planId);
			
			return "forward:/view/community/addPlanPostView.jsp";
		}
		return "forward:/view/community/addPostView.jsp";
	}
	
	@RequestMapping( value="addPost", method=RequestMethod.POST )
	public String addPost( @ModelAttribute Post post, @RequestParam("tagContent") String[] tagContent, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/addPost : POST");
	
		User user = (User)session.getAttribute("user");
		post.setPostWriterId(user.getUserId());
		post.setNickName(user.getNickname());
		
		if(post.getPostGrade() == null) {
			post.setPostGrade("B");
		}
		
		//�÷��� ���̵� ������ ī���ؼ� ���� ���� (�÷��� �Խ�)
		if( post.getPlanId() != null || post.getPlanId()=="" ) {
			
			String originPlanId = post.getPlanId();
			
			Plan copyPlan = new Plan();
			copyPlan.setPlanId(originPlanId);
			//copyPlan.setPlanMaster(user);
			
			String copiedPlanId = planService.copyPlan(copyPlan);	//plan�� planId�� ��ܼ� ��!
			
			post.setPlanId(copiedPlanId);
		}
		communityService.addPost(post);

		List<Tag> tags = new ArrayList<Tag>();
	
		for(int i=0; i<tagContent.length; i++) {
			Tag tag = new Tag();
			communityService.addTag(tagContent[i], post.getPostId());
			tag.setTagContent(tagContent[i]);
			tags.add(tag);
		}

		model.addAttribute("post", post);
		model.addAttribute("tag", tags);
		
		List<User> userList = new ArrayList<User>();
		
		if( post.getBoardName().equals("D") ) {
			
			if(user.getRole().equals("G")) {
				return "forward:/view/community/check.jsp";
			}
			
			List<Party> party = communityService.getParty(post.getPostId());
		
			for(int i=0; i<party.size(); i++) {
				
				User partyUser = userService.getUser(party.get(i).getPartyUserId());
				List<TripSurvey> tripSurvey = myPageService.getTripSurveyList(party.get(i).getPartyUserId());
				
				List<String> tripStyle = new ArrayList<String>();
				
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
		
		if( post.getPlanId() != null || post.getPlanId()=="" ) {
			
			Plan copiedPlan = planService.getPlan(post.getPlanId());
			
			List<Daily> dailyList = planSubService.getDailyList(copiedPlan);		//dailyList
			List<Stuff> stuffList = planSubService.getStuffList(copiedPlan.getPlanId());		//stuffList
			List<Daily> budgetOverviewList = planSubService.getBudgetOverview(copiedPlan);
			List<City> listCity = planSubService.getCityRouteList(copiedPlan.getPlanId());
			List<Day> dayList = Util.cityListToDayList(listCity, copiedPlan.getStartDate() );
			
			copiedPlan.setDailyList(dailyList);
			copiedPlan.setStuffList(stuffList);
			copiedPlan.setBudgetOverviewList(budgetOverviewList);
			copiedPlan.setCityList(listCity);
			copiedPlan.setDayList(dayList);
			
			model.addAttribute("plan", copiedPlan );
			
			
			/* FullCalendar addEvent ���� JSON �����.. */
			JSONArray cityArray = new JSONArray();
			
			for (City cityItem : listCity) {
				JSONObject cityEvent = new JSONObject();

				cityEvent.put("title", cityItem.getCityName());
				cityEvent.put("start", cityItem.getStartDateStr());
				cityEvent.put("end", cityItem.getEndDateStr());
				cityEvent.put("textColor", "white");
				if( cityItem.getCountry() != null ) {
					if( cityItem.getCountry().equals("����") ) {
						cityEvent.put("color", "#F9A081");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#98E657");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#8886F4");
					}else if(cityItem.getCountry().equals("��Ż����") ) {
						cityEvent.put("color", "#76A0F3");
					}
				}else {
					cityEvent.put("color", "#51bec9");
				}

				cityArray.add(cityEvent);
			}
			
			/* GoogleMap API�� ���� JSON �����.. */
			JSONArray markerArray = new JSONArray();
			for (City cityItem : listCity) {
				JSONObject cityMarker = new JSONObject();
				
				JSONObject position = new JSONObject();
				position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
				position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
				
				cityMarker.put("position", position);
				cityMarker.put("title", cityItem.getCityName());
				
				markerArray.add(cityMarker);
			}
			
			model.addAttribute("cityEventList", cityArray);
			model.addAttribute("cityMarkerList", markerArray);
			
			
			return "forward:/view/community/getPlanPost.jsp";
		}
		
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
		
		List<User> userList = new ArrayList<User>();
		
		if( post.getBoardName().equals("D") ) {
			
			if(user.getRole().equals("G")) {
				return "forward:/view/community/check.jsp";
			}
			
			List<Party> party = communityService.getParty(post.getPostId());
		
			for(int i=0; i<party.size(); i++) {
				
				User partyUser = userService.getUser(party.get(i).getPartyUserId());
				List<TripSurvey> tripSurvey = myPageService.getTripSurveyList(party.get(i).getPartyUserId());
				
				List<String> tripStyle = new ArrayList<String>();
				
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
		
		if( post.getPlanId() != null || post.getPlanId()=="" ) {
			
			Plan copiedPlan = planService.getPlan(post.getPlanId());
			
			List<Daily> dailyList = planSubService.getDailyList(copiedPlan);		//dailyList
			List<Stuff> stuffList = planSubService.getStuffList(copiedPlan.getPlanId());		//stuffList
			List<Daily> budgetOverviewList = planSubService.getBudgetOverview(copiedPlan);
			List<City> listCity = planSubService.getCityRouteList(copiedPlan.getPlanId());
			List<Day> dayList = Util.cityListToDayList(listCity, copiedPlan.getStartDate() );
			
			copiedPlan.setDailyList(dailyList);
			copiedPlan.setStuffList(stuffList);
			copiedPlan.setBudgetOverviewList(budgetOverviewList);
			copiedPlan.setCityList(listCity);
			copiedPlan.setDayList(dayList);
			
			model.addAttribute("plan", copiedPlan );
			
			
			/* FullCalendar addEvent ���� JSON �����.. */
			JSONArray cityArray = new JSONArray();
			
			for (City cityItem : listCity) {
				JSONObject cityEvent = new JSONObject();

				cityEvent.put("title", cityItem.getCityName());
				cityEvent.put("start", cityItem.getStartDateStr());
				cityEvent.put("end", cityItem.getEndDateStr());
				cityEvent.put("textColor", "white");
				if( cityItem.getCountry() != null ) {
					if( cityItem.getCountry().equals("����") ) {
						cityEvent.put("color", "#F9A081");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#98E657");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#8886F4");
					}else if(cityItem.getCountry().equals("��Ż����") ) {
						cityEvent.put("color", "#76A0F3");
					}
				}else {
					cityEvent.put("color", "#51bec9");
				}

				cityArray.add(cityEvent);
			}
			
			/* GoogleMap API�� ���� JSON �����.. */
			JSONArray markerArray = new JSONArray();
			for (City cityItem : listCity) {
				JSONObject cityMarker = new JSONObject();
				
				JSONObject position = new JSONObject();
				position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
				position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
				
				cityMarker.put("position", position);
				cityMarker.put("title", cityItem.getCityName());
				
				markerArray.add(cityMarker);
			}
			
			model.addAttribute("cityEventList", cityArray);
			model.addAttribute("cityMarkerList", markerArray);
			
			
			return "forward:/view/community/getPlanPost.jsp";
		}
		
		return "forward:/view/community/getPost.jsp";
	}
	
	@RequestMapping( value="getPost", method=RequestMethod.GET )
	public String getPost( @RequestParam("postId") String postId, @RequestParam("boardName") String boardName, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/community/getPost : GET");
		
		User user=(User)session.getAttribute("user");
		
		if(user == null) {
			return "forward:/view/community/check.jsp";
		}
		Post post = communityService.getPost(postId, user.getUserId(), boardName);
		
		if( post == null ) {

			model.addAttribute("post", post);
			return "forward:/view/community/check.jsp";
		}
		List<Tag> tag = communityService.getTagList(postId);

		User userProfile = userService.getUser(user.getUserId());
		
		model.addAttribute("user", userProfile);
		model.addAttribute("post", post);
		model.addAttribute("tag", tag);
		
		List<User> userList = new ArrayList<User>();
		
		if( boardName.equals("D") ) {
			
			if(user.getRole().equals("G")) {
				return "forward:/view/community/check.jsp";
			}
			
			List<Party> party = communityService.getParty(postId);
		
			for(int i=0; i<party.size(); i++) {
				
				User partyUser = userService.getUser(party.get(i).getPartyUserId());
				List<TripSurvey> tripSurvey = myPageService.getTripSurveyList(party.get(i).getPartyUserId());
				
				List<String> tripStyle = new ArrayList<String>();
				
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
		}else if( boardName.equals("E") ) {
			//�÷��� �Խù� ��������
			String planId = post.getPlanId();
			
			Plan plan = planService.getPlan( planId );
			List<Daily> dailyList = planSubService.getDailyList(plan);		//dailyList
			List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
			List<Daily> budgetOverviewList = planSubService.getBudgetOverview(plan);
			List<City> listCity = planSubService.getCityRouteList(planId);
			List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
			plan.setDayList(dayList);
			plan.setCityList(listCity);
			plan.setBudgetOverviewList(budgetOverviewList);
			plan.setDailyList(dailyList);
			plan.setStuffList(stuffList);
			
			/* FullCalendar addEvent ���� JSON �����.. */
			JSONArray cityArray = new JSONArray();
			
			for (City cityItem : listCity) {
				JSONObject cityEvent = new JSONObject();

				cityEvent.put("title", cityItem.getCityName());
				cityEvent.put("start", cityItem.getStartDateStr());
				cityEvent.put("end", cityItem.getEndDateStr());
				cityEvent.put("textColor", "white");
				if( cityItem.getCountry() != null ) {
					if( cityItem.getCountry().equals("����") ) {
						cityEvent.put("color", "#F9A081");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#98E657");
					}else if(cityItem.getCountry().equals("������") ) {
						cityEvent.put("color", "#8886F4");
					}else if(cityItem.getCountry().equals("��Ż����") ) {
						cityEvent.put("color", "#76A0F3");
					}
				}else {
					cityEvent.put("color", "#51bec9");
				}

				cityArray.add(cityEvent);
			}
			
			/* GoogleMap API�� ���� JSON �����.. */
			JSONArray markerArray = new JSONArray();
			for (City cityItem : listCity) {
				JSONObject cityMarker = new JSONObject();
				
				JSONObject position = new JSONObject();
				position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
				position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
				
				cityMarker.put("position", position);
				cityMarker.put("title", cityItem.getCityName());
				
				markerArray.add(cityMarker);
			}
			
			plan.setPlanDday( Util.getDday(plan.getStartDate()));		//���� D-Day
			if( plan.getPlanTotalDays() != 0) {
				plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//������������
			}
			
			model.addAttribute("boardName", boardName);
			model.addAttribute("plan", plan);
			model.addAttribute("cityEventList", cityArray);
			model.addAttribute("cityMarkerList", markerArray);
			
			return "forward:/view/community/getPlanPost.jsp";
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
			if( search.getSorting() == null ) {
				search.setSorting("0");
			}
			map = communityService.getBestPostList(search, boardName);
		}else {
			map = communityService.getPostList(search, boardName);
		}
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("boardName", boardName);
		
		if( boardName.equals("C") ) {
			return "forward:/view/community/getBestPostList.jsp";
		}else if( boardName.equals("E") ) {
			
			List<Post> postList = (List<Post>)map.get("list");
			List<Plan> planList = new ArrayList<Plan>();
			
			for(int i=0; i<postList.size(); i++) {
			Plan plan = planService.getPlan(postList.get(i).getPlanId());
			planList.add(plan);
			
			model.addAttribute("boardName", boardName);
			model.addAttribute("plan", planList);
			}
			return "forward:/view/community/getPlanPostList.jsp";
		}else {
			return "forward:/view/community/getPostList.jsp";
		}
	}
	
	@RequestMapping( value="deletePost", method=RequestMethod.GET)
	public String deletePost( @RequestParam("postId") String postId, @RequestParam("boardName") String boardName) throws Exception {
		
		System.out.println("/community/deletePost : GET");
		
		communityService.deletePost(postId);
		
		return "redirect:/community/getPostList?boardName="+boardName;
	}
}