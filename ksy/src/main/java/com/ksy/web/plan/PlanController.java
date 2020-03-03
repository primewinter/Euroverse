package com.ksy.web.plan;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.common.util.Util;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Day;
import com.ksy.service.domain.Memo;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.Tag;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/plan/*")
public class PlanController {

	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	
//	@Resource(name="uploadPath")
//	String uploadPath;
	String uploadPath = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\planImg";
	
	public PlanController() {
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping( value = "getPlanList", method = RequestMethod.GET )
	public String getPlanList (	/*@RequestParam("userId") String userId, */ Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");

		if(user == null) {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		List<Plan> listPlan = planService.getPlanList(user.getUserId());
		model.addAttribute("list", listPlan);
		
		return "forward:/view/plan/getPlanList.jsp";
	}
	
	/* PlanSubController로 이동 */
	@RequestMapping( value = "getPlan", method = RequestMethod.GET )
	public String getPlan (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		Plan plan = planService.getPlan(planId);
		
		List<User> planPartyList = planService.getPlanPartyList(planId);	//planPartyList
		plan.setPlanPartyList(planPartyList);
		
		List<Todo> todoList = planService.getTodoList(planId); 				//todoList
		List<Daily> dailyList = planSubService.getDailyList(plan);		//dailyList
		List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
		List<Memo> memoList = planSubService.getMemoList(planId);			//memoList
		plan.setTodoList(todoList);
		plan.setDailyList(dailyList);
		plan.setStuffList(stuffList);
		plan.setMemoList(memoList);
		
		List<Daily> budgetOverviewList = planSubService.getBudgetOverview(plan);
		plan.setBudgetOverviewList(budgetOverviewList);
		
		List<City> listCity = planSubService.getCityRouteList(planId);
		plan.setCityList(listCity);
		
		List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
		plan.setDayList(dayList);
		
		
		/* FullCalendar addEvent 위한 JSON 만들기.. */
		JSONArray cityArray = new JSONArray();
		
		for (City cityItem : listCity) {
			JSONObject cityEvent = new JSONObject();
//			ObjectMapper objMapper = new ObjectMapper();
//			String cityJson = objMapper.writeValueAsString(cityItem);
			
			cityEvent.put("title", cityItem.getCityName());
			cityEvent.put("start", cityItem.getStartDateStr());
			cityEvent.put("end", cityItem.getEndDateStr());
			cityEvent.put("textColor", "white");
			if( cityItem.getCountry() != null ) {
				if( cityItem.getCountry().equals("영국") ) {
					cityEvent.put("color", "#F9A081");
				}else if(cityItem.getCountry().equals("스위스") ) {
					cityEvent.put("color", "#98E657");
				}else if(cityItem.getCountry().equals("프랑스") ) {
					cityEvent.put("color", "#8886F4");
				}else if(cityItem.getCountry().equals("이탈리아") ) {
					cityEvent.put("color", "#76A0F3");
				}
			}else {
				cityEvent.put("color", "#51bec9");
			}
			
			cityArray.add(cityEvent);
		}
		
		/* GoogleMap API를 위한 JSON 만들기.. */
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
		
		plan.setPlanDday( Util.getDday(plan.getStartDate()));		//여행 D-Day
		if( plan.getPlanTotalDays() != 0) {
			plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//여행종료일자
		}
		
		model.addAttribute("plan", plan);
		model.addAttribute("cityEventList", cityArray);
		model.addAttribute("cityMarkerList", markerArray);
		
		return "forward:/view/plan/getPlan.jsp";
	}
	
	/* PlanSubController로 이동 */
//	@RequestMapping( value = "editRoute", method = RequestMethod.GET )
//	public String editRoute (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
//		
//		Plan plan = planService.getPlan(planId);
//		
//		List<City> listCity = planSubService.getCityRouteList(planId);
//		plan.setCityList(listCity);
//		
//		List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
//		plan.setDayList(dayList);
//		
//		/* GoogleMap API를 위한 JSON 만들기.. */
//		JSONArray markerArray = new JSONArray();
//		for (City cityItem : listCity) {
//			JSONObject cityMarker = new JSONObject();
//			
//			JSONObject position = new JSONObject();
//			position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
//			position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
//			
//			cityMarker.put("position", position);
//			cityMarker.put("title", cityItem.getCityName());
//			cityMarker.put("cityImg", cityItem.getCityImg());
//			cityMarker.put("cityInfo", cityItem.getCityInfo());
//			
//			markerArray.add(cityMarker);
//		}
//		
//		model.addAttribute("plan", plan);
//		model.addAttribute("cityMarkerList", markerArray);
//		
//		return "forward:/view/plan/editRoute.jsp";
//	}
	
	
	
	@RequestMapping( value = "addPlan", method = RequestMethod.POST )
	public String addPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");		//음..
		
		if(user != null) { 
			plan.setPlanMaster(user); 
		}else {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			//String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\planImg";
			
			/*
			 * Calendar cal = Calendar.getInstance() ; 
			 * SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS"); 
			 * String time = dateFormat.format(cal.getTime()); String fileName =
			 * mpFile.getOriginalFilename() + "_"+time;
			 */
			
			String fileName = mpFile.getOriginalFilename();
			fileName = uploadFile(fileName, mpFile.getBytes());
			//mpFile.transferTo( new File(path, fileName) );
			
			plan.setPlanImg(fileName);
			
		}else {
			plan.setPlanImg("defaultPlanImage.jpg");
		}

		planService.addPlan(plan);	
	
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	@RequestMapping( value = "downloadPlan", method = RequestMethod.POST )
	public String downloadPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");		
		if(user != null) { 
			plan.setPlanMaster(user); 
		}else {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			
			String fileName = mpFile.getOriginalFilename();
			fileName = uploadFile(fileName, mpFile.getBytes());
			plan.setPlanImg(fileName);
		}else {
			plan.setPlanImg("defaultPlanImage.jpg");
		}

		planService.copyPlan(plan);	
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	
	//파일 이름 중복제거용 함수
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uuid = UUID.randomUUID();	//uuid 생성 (Universal Unique IDentifier, 범용 고유 식별자)
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target);	//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		
		return savedName;
	}
	
	
	@RequestMapping( value = "updatePlan", method = RequestMethod.POST )
	public String updatePlan (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			
			String fileName = mpFile.getOriginalFilename();
			fileName = uploadFile(fileName, mpFile.getBytes());
			
			plan.setPlanImg(fileName);
		}else { //plan.setPlanImg("defaultPlanImage.jpg");
		}		
		
		planService.updatePlan(plan);
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "updatePlanStatus", method = RequestMethod.POST )
	public String updatePlanStatus (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		planService.updatePlanStatus(plan);
	
		//plan = planService.getPlan(plan.getPlanId());	//<- 이 과정이 굳이 필요한가..? <- 필요하다!!! <-아닌거같음.. 필요없음!!!!!!
		//model.addAttribute("plan", plan);		
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "deletePlan", method = RequestMethod.POST )
	public String deletePlan (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
	
		planService.deletePlan(planId);
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	
	
	//deletePlanParty 레스트에 있던거 옮겨옴!!!!!!
	@RequestMapping( value = "deletePlanParty", method = RequestMethod.POST )
	public String deletePlanParty (	@ModelAttribute("party") Party party, Model model, HttpSession session	) throws Exception {
	
		planService.deletePlanParty(party);
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:/view/plan/planNotice.jsp";
		}
		
		if( party.getPartyRole().equals("S")) {		//셀프탈퇴
			return "redirect:/plan/getPlanList?userId="+user.getUserId();		//내가 탈퇴하는 경우
		}else { // if( party.getPartyRole().equals("F")) {	//마스터의 강퇴
			return "redirect:/plan/getPlan?planId="+party.getRefId();		//마스터가 강퇴시키는 경우
		}
	}
	
	//레스트에 있던거 가져옴
	@RequestMapping( value = "updateUserSlot", method = RequestMethod.GET )
	public String updateUserSlot( @RequestParam("userId") String userId, HttpSession session ) throws Exception {
		
		Point usedPoint = new Point();
		usedPoint.setUserId(userId);
		usedPoint.setUsedType("S");
		usedPoint.setUsedPoint(500);
		
		myPageService.addPoint(usedPoint);
		myPageService.updateUserSlot(userId);
		
		User newUser = userService.getUser(userId);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();	//유저정보 업데이트 되었기 때문에 세션에 다시 박아주기!
		if( sessionId.equals( userId ) ){
			session.setAttribute("user", newUser);
		}
		
		return "redirect:/plan/getPlanList?userId="+userId;
	}
	
	
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	
	/////// 테스트용 포스트리스트 함수
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
			List<Post> list = (List<Post>)map.get("list");
			for(Post post : list ) {
				post.setUser(userService.getUser(post.getPostWriterId()));
			}
		}else if ( boardName.equals("F")) {
			map = communityService.getPostList(search, boardName);
			List<Post> list = (List<Post>)map.get("list");
			for(Post post : list ) {
				System.out.println("첫번째 포스트 : "+post);
				post.setUser(userService.getUser(post.getPostWriterId()));
				Post contentPost = communityService.getMainPost(post.getPostId(), post.getPostWriterId(), boardName);
				List<Tag> tag = communityService.getTagList(post.getPostId());
				post.setTagList(tag);
				String content = contentPost.getPostContent();
				
				if (content.contains("<img")) {
	                int startInt = content.indexOf("img");
	                int endInt = content.indexOf(">", startInt);
	                String result = content.substring(startInt - 1, endInt + 1);
	                post.setImgSrc(result);
	            } else {
	                post.setImgSrc("<img src='/resources/images/commImg/default_trip_img.jpeg'>");
	            }
			
			}
		} else {
			map = communityService.getPostList(search, boardName);
			List<Post> list = (List<Post>)map.get("list");
			for(Post post : list ) {
				post.setUser(userService.getUser(post.getPostWriterId()));
			}
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
		}else if( boardName.equals("E") ) {
			
			List<Post> postList = (List<Post>)map.get("list");
			for(Post post : postList ) {
				post.setUser(userService.getUser(post.getPostWriterId()));
			}
			List<Plan> planList = new ArrayList<Plan>();
			
			for(int i=0; i<postList.size(); i++) {
			Plan plan = planService.getPlan(postList.get(i).getPlanId());
			
			List<City> listCity = planSubService.getCityRouteList(plan.getPlanId());
			plan.setCityList(listCity);
			
			String planImgString = "https://maps.googleapis.com/maps/api/staticmap?size=400x290&mobile=true&visible=39,17";
			
			//planImgString = planImgString + "&path=color:0x|weight:1|50.112,8.684|48.861,2.342|45.112,3.684"
			//		+ "&markers=size:tiny%7Ccolor:red|50.112,8.684&markers=size:tiny%7Ccolor:red|48.861,2.342&markers=size:tiny%7Ccolor:red|45.112,3.684"
			
			planImgString = planImgString + "&path=color:0x|weight:1";
			
			for(City cityItem : listCity) {
				planImgString = planImgString + "|" + cityItem.getCityLat() +","+ cityItem.getCityLng();
			} //50.112,8.684|48.861,2.342|45.112,3.684
			
			for(City cityItem : listCity) {
				planImgString = planImgString + "&markers=size:tiny%7Ccolor:red|" + cityItem.getCityLat() +","+ cityItem.getCityLng();
			}
			//planImgString = planImgString + "&markers=size:tiny%7Ccolor:red|50.112,8.684&markers=size:tiny%7Ccolor:red|48.861,2.342&markers=size:tiny%7Ccolor:red|45.112,3.684"
			planImgString = planImgString + "&key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0xebe3cd&style=element:labels.text.fill%7Ccolor:0x773d3c&style=element:labels.text.stroke%7Ccolor:0xf5f1e6&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative%7Celement:geometry.stroke%7Ccolor:0xc9b2a6&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.land_parcel%7Celement:geometry.stroke%7Ccolor:0xf0e5d1&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0xae9e90&style=feature:administrative.neighborhood%7Ccolor:0xfdf1dc%7Cvisibility:off&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0xfff8e6&style=feature:poi%7Cvisibility:off&style=feature:poi%7Celement:geometry%7Ccolor:0xdfd2ae&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x93817c&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xa5b076&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x447530&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:geometry%7Ccolor:0xf5f1e6&style=feature:road%7Celement:labels%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road.arterial%7Celement:geometry%7Ccolor:0xfdfcf8&style=feature:road.highway%7Celement:geometry%7Ccolor:0xf8c967&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0xe9bc62&style=feature:road.highway.controlled_access%7Celement:geometry%7Ccolor:0xe98d58&style=feature:road.highway.controlled_access%7Celement:geometry.stroke%7Ccolor:0xdb8555&style=feature:road.local%7Celement:labels.text.fill%7Ccolor:0x806b63&style=feature:transit%7Cvisibility:off&style=feature:transit.line%7Celement:geometry%7Ccolor:0xdfd2ae&style=feature:transit.line%7Celement:labels.text.fill%7Ccolor:0x8f7d77&style=feature:transit.line%7Celement:labels.text.stroke%7Ccolor:0xebe3cd&style=feature:transit.station%7Celement:geometry%7Ccolor:0xdfd2ae&style=feature:water%7Celement:geometry.fill%7Ccolor:0xd1ece5&style=feature:water%7Celement:labels.text%7Cvisibility:off&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x92998d";
			plan.setPlanImg(planImgString);
			
			
			planList.add(plan);
			
			model.addAttribute("boardName", boardName);
			model.addAttribute("plan", planList);
			}
			return "forward:/view/plan/getPlanPostList.jsp";
		}else if( boardName.equals("F") ) {
			return "forward:/view/community/getReviewPostList.jsp";
		}else if( boardName.equals("D") ) {
			return "forward:/view/accompany/accMain.jsp";
		} else {
			return "forward:/view/community/getPostList.jsp";
		}
	}
	
}
