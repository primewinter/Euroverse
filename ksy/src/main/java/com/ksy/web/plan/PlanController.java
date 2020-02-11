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
	
	@RequestMapping( value = "getPlanList", method = RequestMethod.GET )
	public String getPlanList (	/*@RequestParam("userId") String userId, */ Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");
		//test�� if�� : ȸ�����̵� ����
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
		//model.addAttribute("listCity", listCity);	//Plan �ʵ忡 CityList ��� �𵨿� �ɾ���... :: ���� ����?
		
		List<Day> dayList = Util.cityListToDayList(listCity, plan.getStartDate() );
		plan.setDayList(dayList);
		
		
		
		/* FullCalendar addEvent ���� JSON �����.. */
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
			
			//cityEvent.put("imageurl", "https://www.crwflags.com/fotw/images/g/gb!sq.gif");
			 
			//cityEvent.put("allDay", false);
			cityArray.add(cityEvent);
		}
		//jsonObj.put("cityEventList", cityArray);
		
		
		
		
		/* GoogleMap API�� ���� JSON �����.. */
		JSONArray markerArray = new JSONArray();
		for (City cityItem : listCity) {
			JSONObject cityMarker = new JSONObject();
			
			JSONObject position = new JSONObject();
			position.put("lat", cityItem.getCityLat());
			position.put("lng", cityItem.getCityLng());
			
			//cityMarker.put("map", "map");
			cityMarker.put("position", position);
			//cityMarker.put("icon", "");
			//cityMarker.put("zIndex", 10000);
			cityMarker.put("title", cityItem.getCityName());
			
			markerArray.add(cityMarker);
		}
		
		
		
		
		
		
		plan.setPlanDday( Util.getDday(plan.getStartDate()));		//���� D-Day
		if( plan.getPlanTotalDays() != 0) {
			plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//������������
		}
		
		model.addAttribute("plan", plan);
		model.addAttribute("cityEventList", cityArray);
		model.addAttribute("cityMarkerList", markerArray);
		
		System.out.println("\n\n\n\n\n\n\n PLAN ::: "+ plan);
		
		return "forward:/view/plan/getPlan.jsp";
	}
	
	
	@RequestMapping( value = "addPlan", method = RequestMethod.POST )
	public String addPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");		//��..
		
		if(user != null) { 
			plan.setPlanMaster(user); 
		}else {
			return "redirect:/index.jsp";
		}
		
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null üũ�� ���� �� ����! 
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
//		//Ȥ��..... => planService.getPlanList(user.getUserId());
//		model.addAttribute("list", listPlan);
		//return "forward:/view/plan/getPlanList.jsp";
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	//���� �̸� �ߺ����ſ� �Լ�
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//uuid ���� (Universal Unique IDentifier, ���� ���� �ĺ���)
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//�ӽ� ���丮�� ����� ���ε�� ������ ������ ���丮�� ����
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	@RequestMapping( value = "updatePlan", method = RequestMethod.POST )
	public String updatePlan (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		MultipartFile mpFile = (MultipartFile)plan.getPlanImgFile();
		if( mpFile.isEmpty() == false) {	//null üũ�� ���� �� ����! 
			
			String fileName = mpFile.getOriginalFilename();
			fileName = uploadFile(fileName, mpFile.getBytes());
			
			plan.setPlanImg(fileName);
		}else {
			//plan.setPlanImg("defaultPlanImage.jpg");
		}		
		
		planService.updatePlan(plan);
		
		//plan = planService.getPlan(plan.getPlanId());	<- �� ������ ���� �ʿ��Ѱ�..?
		//model.addAttribute("plan", plan);	
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "updatePlanStatus", method = RequestMethod.POST )
	public String updatePlanStatus (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		planService.updatePlanStatus(plan);
		
		System.out.println("\n\n\n\n\n updatePlanStatus ::: "+ plan);
	
		//plan = planService.getPlan(plan.getPlanId());	//<- �� ������ ���� �ʿ��Ѱ�..? <- �ʿ��ϴ�!!! <-�ƴѰŰ���.. �ʿ����!!!!!!
		//model.addAttribute("plan", plan);		
		
		return "redirect:/plan/getPlan?planId="+plan.getPlanId();
	}
	
	@RequestMapping( value = "deletePlan", method = RequestMethod.POST )
	public String deletePlan (	@RequestParam("planId") String planId, Model model, HttpSession session	) throws Exception {
	
		planService.deletePlan(planId);
		
		//������ �׺���̼� ����..?
		User user = (User)session.getAttribute("user");
		//test�� if�� : ȸ�����̵� ����
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		
		return "redirect:/plan/getPlanList?userId="+user.getUserId();
	}
	
	
	
	//deletePlanParty ����Ʈ�� �ִ��� �Űܿ�!!!!!!
	@RequestMapping( value = "deletePlanParty", method = RequestMethod.POST )
	public String deletePlanParty (	@ModelAttribute("party") Party party, Model model, HttpSession session	) throws Exception {
	
		System.out.println("\n\n\n\n deletePlanParty ::: "+ party);
		
		planService.deletePlanParty(party);
		
		User user = (User)session.getAttribute("user");
		//test�� if�� : ȸ�����̵� ����
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		
		if( party.getPartyRole().equals("S")) {		//����Ż��
			return "redirect:/plan/getPlanList?userId="+user.getUserId();		//���� Ż���ϴ� ���
		}else { // if( party.getPartyRole().equals("F")) {	//�������� ����
			return "redirect:/plan/getPlan?planId="+party.getRefId();		//�����Ͱ� �����Ű�� ���
		}
	}
	
	//���Ľ�Ʈ�� �ִ��� ������
	@RequestMapping( value = "updateUserSlot", method = RequestMethod.GET )
	public String updateUserSlot( @RequestParam("userId") String userId, HttpSession session ) throws Exception {
		
		
		System.out.println("\n\n\n\n\n\n\n updateUserSlot "+userId);
		
		planService.updateUserSlot(userId);
		
		//������ �׺���̼� ����..?
		/*
		 * User user = (User)session.getAttribute("user"); //test�� if�� : ȸ�����̵� ����
		 * if(user == null) { user = new User(); user.setUserId("admin"); }
		 */
		
		//USER�� ������(����, ����Ʈ)�� �����Ǳ� ������ ������Ʈ �� �ٽ� ���ǿ� �ڴ°�ó�� ó�����־�� ��!!!!!!!!!!!!!!!!!!
		
		return "redirect:/plan/getPlanList?userId="+userId;
	}
	
}
