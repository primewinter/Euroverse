package com.ksy.web.plan;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ksy.common.util.Util;
import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Day;
import com.ksy.service.domain.Memo;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;

@Controller
@RequestMapping("/plan/*")
public class PlanController {

	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
//	@Resource(name="uploadPath")
//	String uploadPath;
	String uploadPath = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\planImg";
	
	public PlanController() {
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping( value = "editRoute", method = RequestMethod.GET )
	public String editRoute (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
		
		//User user = (User)session.getAttribute("user");
		
		Plan plan = planService.getPlan(planId);
		
		List<City> listCity = planSubService.getCityRouteList(planId);
		plan.setCityList(listCity);
		
		
		List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
		plan.setDayList(dayList);
		
		/* GoogleMap API를 위한 JSON 만들기.. */
		JSONArray markerArray = new JSONArray();
		for (City cityItem : listCity) {
			JSONObject cityMarker = new JSONObject();
			
			JSONObject position = new JSONObject();
			position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
			position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
			
			cityMarker.put("position", position);
			//cityMarker.put("icon", "");
			//cityMarker.put("zIndex", 10000);
			cityMarker.put("title", cityItem.getCityName());
			
			markerArray.add(cityMarker);
		}
		
		model.addAttribute("plan", plan);
		model.addAttribute("cityMarkerList", markerArray);
		//model.addAttribute("listCity", listCity);
		
		return "forward:/view/plan/editRoute.jsp";
	}
	
	
	
	
	@RequestMapping( value = "getPlanList", method = RequestMethod.GET )
	public String getPlanList (	/*@RequestParam("userId") String userId, */ Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");
		//test용 if문 : 회원아이디 셋팅
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		
		List<Plan> listPlan = planService.getPlanList(user.getUserId());
		System.out.println(" getPlanList - listPlan = "+listPlan);
		model.addAttribute("list", listPlan);
		
		return "forward:/view/plan/getPlanList.jsp";
	}
	
	
	@RequestMapping( value = "getPlan", method = RequestMethod.GET )
	public String getPlan (	@RequestParam("planId") String planId, Model model	) throws Exception {
	
		System.out.println("\n\n\n\n\n\n PLanID : "+planId);
		
		Plan plan = planService.getPlan(planId);
		//plan_id, plan_title, plan_img, plan_type, start_date, plan_status, (cr.sum - (cr.cnt-1)) plan_total_days, pt.plan_party_size 
		
		System.out.println("\n\n\n\n Plan ===== "+plan);
		
		
		List<User> planPartyList = planService.getPlanPartyList(planId);	//planPartyList
		plan.setPlanPartyList(planPartyList);
		
		List<Todo> todoList = planService.getTodoList(planId); 				//todoList
		List<Daily> dailyList = planSubService.getDailyList(planId);		//dailyList
		List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
		List<Memo> memoList = planSubService.getMemoList(planId);			//memoList
		plan.setTodoList(todoList);
		plan.setDailyList(dailyList);
		plan.setStuffList(stuffList);
		plan.setMemoList(memoList);
		
		
		List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		plan.setBudgetOverviewList(budgetOverviewList);
		//model.addAttribute("budgetOverviewList", budgetOverviewList);
		
		List<City> listCity = planSubService.getCityRouteList(planId);
		plan.setCityList(listCity);
		//model.addAttribute("listCity", listCity);	//Plan 필드에 CityList 없어서 모델에 심어줌... :: 추후 변경?
		
		List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
		plan.setDayList(dayList);
		
		
		
		/* FullCalendar addEvent 위한 JSON 만들기.. */
		//JSONObject jsonObj = new JSONObject();
		JSONArray cityArray = new JSONArray();
		
		for (City cityItem : listCity) {
			JSONObject cityEvent = new JSONObject();
//			ObjectMapper objMapper = new ObjectMapper();
//			String cityJson = objMapper.writeValueAsString(cityItem);
			
			cityEvent.put("title", cityItem.getCityName());
			cityEvent.put("start", cityItem.getStartDateStr());
			cityEvent.put("end", cityItem.getEndDateStr());
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
			//cityEvent.put("imageurl", "https://www.crwflags.com/fotw/images/g/gb!sq.gif");
			
			cityArray.add(cityEvent);
		}
		//jsonObj.put("cityEventList", cityArray);
		
		
		
		/* GoogleMap API를 위한 JSON 만들기.. */
		JSONArray markerArray = new JSONArray();
		for (City cityItem : listCity) {
			JSONObject cityMarker = new JSONObject();
			
			JSONObject position = new JSONObject();
			position.put("lat", Double.parseDouble( cityItem.getCityLat() ));
			position.put("lng", Double.parseDouble( cityItem.getCityLng() ));
			
			cityMarker.put("position", position);
			//cityMarker.put("icon", "");
			//cityMarker.put("zIndex", 10000);
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
		
		System.out.println("\n\n\n\n\n\n\n PLAN ::: "+ plan);
		
		return "forward:/view/plan/getPlan.jsp";
	}
	
	
	@RequestMapping( value = "addPlan", method = RequestMethod.POST )
	public String addPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");		//음..
		
		if(user != null) { 
			plan.setPlanMaster(user); 
		}else {
			return "redirect:/index.jsp";
		}
		
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			//String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\planImg";
			
			/*
			 * Calendar cal = Calendar.getInstance() ; SimpleDateFormat dateFormat = new
			 * SimpleDateFormat("yyyyMMdd_HHmmSS"); String time =
			 * dateFormat.format(cal.getTime()); String fileName =
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
		
//		List<Plan> listPlan = planService.getPlanList(plan.getPlanMaster().getUserId());
//		//혹은..... => planService.getPlanList(user.getUserId());
//		model.addAttribute("list", listPlan);
		//return "forward:/view/plan/getPlanList.jsp";
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	//파일 이름 중복제거용 함수
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//uuid 생성 (Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	@RequestMapping( value = "updatePlan", method = RequestMethod.POST )
	public String updatePlan (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			
			String fileName = mpFile.getOriginalFilename();
			fileName = uploadFile(fileName, mpFile.getBytes());
			
			plan.setPlanImg(fileName);
		}else {
			//plan.setPlanImg("defaultPlanImage.jpg");
		}		
		
		planService.updatePlan(plan);
		
		//plan = planService.getPlan(plan.getPlanId());	<- 이 과정이 굳이 필요한가..?
		//model.addAttribute("plan", plan);	
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "updatePlanStatus", method = RequestMethod.POST )
	public String updatePlanStatus (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		planService.updatePlanStatus(plan);
		
		System.out.println("\n\n\n\n\n updatePlanStatus ::: "+ plan);
	
		//plan = planService.getPlan(plan.getPlanId());	//<- 이 과정이 굳이 필요한가..? <- 필요하다!!! <-아닌거같음.. 필요없음!!!!!!
		//model.addAttribute("plan", plan);		
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "deletePlan", method = RequestMethod.POST )
	public String deletePlan (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
	
		planService.deletePlan(planId);
		
		//페이지 네비게이션 어케..?
		User user = (User)session.getAttribute("user");
		//test용 if문 : 회원아이디 셋팅
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	
	
	//deletePlanParty 레스트에 있던거 옮겨옴!!!!!!
	@RequestMapping( value = "deletePlanParty", method = RequestMethod.POST )
	public String deletePlanParty (	@ModelAttribute("party") Party party, Model model, HttpSession session	) throws Exception {
	
		System.out.println("\n\n\n\n deletePlanParty ::: "+ party);
		
		planService.deletePlanParty(party);
		
		User user = (User)session.getAttribute("user");
		//test용 if문 : 회원아이디 셋팅
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		
		if( party.getPartyRole().equals("S")) {		//셀프탈퇴
			return "redirect:/plan/getPlanList?userId="+user.getUserId();		//내가 탈퇴하는 경우
		}else { // if( party.getPartyRole().equals("F")) {	//마스터의 강퇴
			return "redirect:/plan/getPlan?planId="+party.getRefId();		//마스터가 강퇴시키는 경우
		}
	}
	
	//레ㅔ스트에 있던거 가져옴
	@RequestMapping( value = "updateUserSlot", method = RequestMethod.GET )
	public String updateUserSlot( @RequestParam("userId") String userId, HttpSession session ) throws Exception {
		
		
		System.out.println("\n\n\n\n\n\n\n updateUserSlot "+userId);
		
		planService.updateUserSlot(userId);
		
		//페이지 네비게이션 어케..?
		/*
		 * User user = (User)session.getAttribute("user"); //test용 if문 : 회원아이디 셋팅
		 * if(user == null) { user = new User(); user.setUserId("admin"); }
		 */
		
		//USER의 정보들(슬롯, 포인트)이 수정되기 때문에 업데이트 후 다시 세션에 박는것처럼 처리해주어야 함!!!!!!!!!!!!!!!!!!
		
		return "redirect:/plan/getPlanList?userId="+userId;
	}
	
}
