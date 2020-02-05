package com.ksy.web.plan;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksy.common.util.Util;
import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Day;
import com.ksy.service.domain.Memo;
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
	
	public PlanController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "getPlanList", method = RequestMethod.GET )
	public String getPlanList (	@RequestParam("userId") String userId, Model model, HttpSession session	) throws Exception {
		
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
		
		List<City> listCity = planSubService.getCityRouteList(planId);	
		plan.setCityList(listCity);
		//model.addAttribute("listCity", listCity);	//Plan 필드에 CityList 없어서 모델에 심어줌... :: 추후 변경?
		
		List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		plan.setBudgetOverviewList(budgetOverviewList);
		//model.addAttribute("budgetOverviewList", budgetOverviewList);
		
		List<Day> dayList = Util.cityListToDayList(listCity);
		plan.setDayList(dayList);
		
		plan.setPlanDday( Util.getDday(plan.getStartDate()));		//여행 D-Day
		plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//여행종료일자
		
		model.addAttribute("plan", plan);
		
		
		System.out.println("\n\n\n\n\n\n\n PLAN ::: "+ plan);
		
		return "forward:/view/plan/getPlan.jsp";
	}
	
	
	@RequestMapping( value = "addPlan", method = RequestMethod.POST )
	public String addPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		User user = (User)session.getAttribute("user");		//음..
		//test용 if문 : 회원아이디 셋팅
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		plan.setPlanMaster(user);

		planService.addPlan(plan);	
		
		List<Plan> listPlan = planService.getPlanList(plan.getPlanMaster().getUserId());
		//혹은..... => planService.getPlanList(user.getUserId());
		
		model.addAttribute("list", listPlan);
		
		return "forward:/view/plan/getPlanList.jsp";
	}
	
	
	@RequestMapping( value = "updatePlan", method = RequestMethod.POST )
	public String updatePlan (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		planService.updatePlan(plan);
		
		//plan = planService.getPlan(plan.getPlanId());	<- 이 과정이 굳이 필요한가..?
		//model.addAttribute("plan", plan);	
		
		return "forward:/plan/getPlan.jsp";
	}
	
	@RequestMapping( value = "updatePlanStatus", method = RequestMethod.POST )
	public String updatePlanStatus (	@ModelAttribute("plan") Plan plan, Model model	) throws Exception {
	
		planService.updatePlanStatus(plan);
	
		//plan = planService.getPlan(plan.getPlanId());	<- 이 과정이 굳이 필요한가..?
		//model.addAttribute("plan", plan);		
		
		return "forward:/plan/getPlan.jsp";
	}
	
	@RequestMapping( value = "deletePlan", method = RequestMethod.POST )
	public String deletePlan (	@RequestParam("planId") String planId, Model model	) throws Exception {
	
		planService.deletePlan(planId);
		
		return "forward:/plan/getPlanList.jsp";
	}
	
	
	
}
