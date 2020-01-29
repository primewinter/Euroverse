package com.ksy.web.plan;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String getPlanList (	@RequestParam("userId") String userId, Model model	) throws Exception {
		
		userId = "admin";
		
		List<Plan> listPlan = planService.getPlanList(userId);
		
		model.addAttribute("list", listPlan);
		
		return "forward:/plan/getPlanList.jsp";
	}
	
	
	@RequestMapping( value = "getPlan", method = RequestMethod.GET )
	public String getPlan (	@RequestParam("planId") String planId, Model model	) throws Exception {
	
		Plan plan = planService.getPlan(planId);
		//plan_id, plan_title, plan_img, plan_type, start_date, plan_status, (cr.sum - (cr.cnt-1)) plan_total_days, pt.plan_party_size 
		
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
		
		
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(calendar.YEAR);
		int month = calendar.get(calendar.MONTH);
		int day = calendar.get(calendar.DAY_OF_MONTH);
		
		
		
		
		
		
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
	
	
	
}
