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

import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
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
			user.setUserId("admin");
		}
		
		List<Plan> listPlan = planService.getPlanList(user.getUserId());
		
		model.addAttribute("list", listPlan);
		
		return "forward:/plan/getPlanList.jsp";
	}
	
	
	@RequestMapping( value = "getPlan", method = RequestMethod.GET )
	public String getPlan (	@RequestParam("planId") String planId, Model model	) throws Exception {
	
		Plan plan = planService.getPlan(planId);
		
		List<User> planPartyList = planService.getPlanPartyList(planId);	//planPartyList
		plan.setPlanPartyList(planPartyList);
		
		List<Todo> todoList = planService.getTodoList(planId); 				//todoList
		plan.setTodoList(todoList);
		
		List<Daily> dailyList = planSubService.getDailyList(planId);		//dailyList
		List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
		List<Memo> memoList = planSubService.getMemoList(planId);			//memoList
		plan.setDailyList(dailyList);
		plan.setStuffList(stuffList);
		plan.setMemoList(memoList);
		
		
		
		plan.setPlanDday(0);		//여행 D-Day
		plan.setEndDate("2020-11-11");	//여행종료일자
		
		List<City> listCity = planSubService.getCityRouteList(planId);		
		model.addAttribute("listCity", listCity);	//Plan 필드에 CityList 없어서 모델에 심어줌... :: 추후 변경?
		
		//버짓 요약을 위한 리스트 : model에 심어서 보내주기
		List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		model.addAttribute("budgetOverviewList", budgetOverviewList);
		
		model.addAttribute("plan", plan);
		
		return "forward:/plan/getPlan.jsp";
	}
	
	
	@RequestMapping( value = "addPlan", method = RequestMethod.POST )
	public String addPlan (	@ModelAttribute("plan") Plan plan, Model model, HttpSession session	) throws Exception {
		
		planService.addPlan(plan);	
		
		User user = (User)session.getAttribute("user");		//음..
		
		List<Plan> listPlan = planService.getPlanList(plan.getPlanMaster().getUserId());
		//혹은..... => planService.getPlanList(user.getUserId());
		
		model.addAttribute("list", listPlan);
		
		return "forward:/plan/getPlanList.jsp";
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
