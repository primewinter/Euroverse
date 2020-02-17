package com.ksy.web.planSub;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Memo;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;

@RestController
@RequestMapping("/planSub/*")
public class PlanSubRestController {

//	@Autowired
//	@Qualifier("planServiceImpl")
//	private PlanService planService;
	
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;
	
	public PlanSubRestController() {
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping( value = "json/getDailyList/{planId}", method = RequestMethod.GET )
	public List<Daily> getDailyList( @PathVariable String planId ) throws Exception {
		
		List<Daily> dailyList = planSubService.getDailyList(planId);
		
		return dailyList;
	}
	
	
	@RequestMapping( value = "json/getDaily", method = RequestMethod.POST )
	public Daily getDaily( @RequestBody Daily daily ) throws Exception {
		
		Daily returnDaily = new Daily();
		returnDaily = planSubService.getDaily(daily);
		
		return returnDaily;
	}
	
	@RequestMapping( value = "json/addDaily", method = RequestMethod.POST )
	public List<Daily> addDaily( @RequestBody Daily daily ) throws Exception {
		
		System.out.println("\n\n\n\n /planSub/json/addDaily ����");
		System.out.println(" daily = "+daily +"\n\n\n");
		
		planSubService.addDaily(daily);
		
		List<Daily> dailyList = planSubService.getDailyList(daily.getPlanId());
		return dailyList;
	}
	
	/*
	 * @RequestMapping( value = "json/updateDaily/{dailyId}", method =
	 * RequestMethod.GET ) public Daily updateDaily( @PathVariable String dailyId )
	 * throws Exception {
	 * 
	 * 
	 * //Daily daily = planSubService.getDaily(dailyId);
	 * 
	 * return daily; }
	 */
	@RequestMapping( value = "json/updateDaily", method = RequestMethod.POST )
	public List<Daily> updateDaily( @RequestBody Daily daily ) throws Exception {
		
		planSubService.updateDaily(daily);
		
		List<Daily> dailyList = planSubService.getDailyList(daily.getPlanId());		//planId ��� �������?
		return dailyList;
	}
	
	@RequestMapping( value = "json/deleteDaily/{dailyId}", method = RequestMethod.GET )
	public void deleteDaily( @PathVariable String dailyId ) throws Exception {
		
		planSubService.deleteDaily(dailyId);
	}
	
	
	
	
	@RequestMapping( value = "json/getCityRouteList/{planId}", method = RequestMethod.GET )
	public List<City> getCityRouteList( @PathVariable String planId ) throws Exception {
		
		List<City> cityList = planSubService.getCityRouteList(planId);
		
		return cityList;
	}
	
	
	//��ũ�� ������ city_info ����Ʈ ��������
	@RequestMapping( value = "json/getCityListByScroll/{zoomLevel}", method = RequestMethod.GET )
	public List<City> getCityListByScroll( @PathVariable int zoomLevel ) throws Exception {
		
		
		List<City> cityInfoList = planSubService.getCityListByScroll(zoomLevel);
		//List<City> cityList = planSubService.getCityRouteList(zoomLevel);
		
		return cityInfoList;
	}
	
	
	
	
	@RequestMapping( value = "json/addCityRoute", method = RequestMethod.POST )
	public City addCityRoute( @RequestBody City city ) throws Exception {
		
		planSubService.addCityRoute(city);
		
		List<City> cityList = planSubService.getCityRouteList(city.getPlanId());
		
		City newCity = cityList.get(cityList.size()-1);
		
		return newCity;
	}
	
	@RequestMapping( value = "json/getCityRoute/{cityId}", method = RequestMethod.GET )
	public City getCityRoute( @PathVariable String cityId ) throws Exception {
		
		City city = planSubService.getCityRoute(cityId);
		
		return city;
	}
	
	// cityRoute �����ϴ� ����.... ������ ���ð� �ƴ� �̻� �ش� ���� ������ ���õ� ������ �ٲ�....�Ф� ����
	// deleteCityRoute -> updateCityVisitOrder -> 
	@RequestMapping( value = "json/deleteCityRoute/{cityId}/{planId}", method = RequestMethod.GET )
	public List<City> deleteCityRoute( @PathVariable String cityId, @PathVariable String planId ) throws Exception {
		
		planSubService.deleteCityRoute(cityId);
		
		//updateCityVisitOrder(City city) <= ������ ���� ���� ���õ� ���� �ٲ�����..
		
		List<City> cityList = planSubService.getCityRouteList(planId);
		
		return cityList;
	}
	
	@RequestMapping( value = "json/updateCityDuration", method = RequestMethod.POST )
	public List<City> updateCityDuration( @RequestBody City city ) throws Exception {
		
		planSubService.updateCityDuration(city);
		
		List<City> cityList = planSubService.getCityRouteList(city.getPlanId());
		
		return cityList;
	}
	@RequestMapping( value = "json/updateTranType", method = RequestMethod.POST )
	public List<City> updateTranType( @RequestBody City city ) throws Exception {
		
		planSubService.updateTranType(city);
		
		List<City> cityList = planSubService.getCityRouteList(city.getPlanId());
		
		return cityList;
	}
	
	@RequestMapping( value = "json/updateVisitOrder", method = RequestMethod.POST )
	public List<City> updateVisitOrder( @RequestBody City city ) throws Exception {
		
		planSubService.updateVisitOrder(city);
		
		//City returnCity = planSubService.getCityRoute(city.getCityId());
		List<City> cityList = planSubService.getCityRouteList(city.getPlanId());
		return cityList;
	}
	
	
	
	
	
	@RequestMapping( value = "json/getStuffList/{planId}", method = RequestMethod.GET )
	public List<Stuff> getStuffList( @PathVariable String planId ) throws Exception {
		
		List<Stuff> stuffList = planSubService.getStuffList(planId);
		return stuffList;
	}
	
	/* checkStuff & updateStuffName �޼ҵ� ���� SQL�� ���̳������� ������� �����Ű���! */
	@RequestMapping( value = "json/checkStuff/{stuffCheck}/{stuffId}", method = RequestMethod.GET )
	public void checkStuff( @PathVariable String stuffId, @PathVariable String stuffCheck ) throws Exception {
		
		Stuff stuff = new Stuff();
		stuff.setStuffId(stuffId);
		stuff.setStuffCheck(stuffCheck);
		
		planSubService.checkStuff(stuff);
	}
	
	@RequestMapping( value = "json/updateStuffName/{stuffName}/{stuffId}", method = RequestMethod.GET )
	public void updateStuffName( @PathVariable String stuffName, @PathVariable String stuffId ) throws Exception {
		
		Stuff stuff = new Stuff();
		stuff.setStuffName(stuffName);
		stuff.setStuffId(stuffId);
		
		planSubService.updateStuffName(stuff);
	}
	
	//GET���� �ߴ��� stuffName �ѱ� �Է��ϸ� ���� ���ͼ� POST�� ����!!!
	@RequestMapping( value = "json/addStuff", method = RequestMethod.POST )
	public List<Stuff> addStuff( @RequestBody Stuff stuff ) throws Exception {
		
		planSubService.addStuff(stuff);
		
		List<Stuff> stuffList = planSubService.getStuffList(stuff.getPlanId());
		return stuffList;
	}
	
	@RequestMapping( value = "json/deleteStuff/{stuffId}", method = RequestMethod.GET )
	public void deleteStuff( @PathVariable String stuffId ) throws Exception {
		
		planSubService.deleteStuff(stuffId);
	}
	
	
	
	@RequestMapping( value = "json/getMemoList/{planId}", method = RequestMethod.GET )
	public List<Memo> getMemoList( @PathVariable String planId ) throws Exception {
		
		List<Memo> memoList = planSubService.getMemoList(planId);
		return memoList;
	}
	
	@RequestMapping( value = "json/addMemo", method = RequestMethod.POST )
	public List<Memo> addMemo( @RequestBody Memo memo, HttpSession session ) throws Exception {
		
		User user = (User)session.getAttribute("user");
		//test�� if�� : ȸ�����̵� ����
		if(user == null) {
			user = new User();
			user.setUserId("admin");
		}
		memo.setMemoRegUser(user.getUserId());
		
		
		planSubService.addMemo(memo);
		
		List<Memo> memoList = planSubService.getMemoList(memo.getPlanId());
		return memoList;
	}
	
	@RequestMapping( value = "json/updateMemo", method = RequestMethod.POST )
	public List<Memo> updateMemo( @RequestBody Memo memo ) throws Exception {
		planSubService.updateMemo(memo);
		
		List<Memo> memoList = planSubService.getMemoList(memo.getPlanId());
		return memoList;
	}
	
	@RequestMapping( value = "json/deleteMemo/{memoId}/{planId}", method = RequestMethod.GET )
	public List<Memo> deleteMemo( @PathVariable String memoId, @PathVariable String planId ) throws Exception {
		planSubService.deleteMemo(memoId);
		
		List<Memo> memoList = planSubService.getMemoList(planId);
		return memoList;
	}
	
	
	
	
	@RequestMapping( value = "json/getBudgetOverviewList/{planId}", method = RequestMethod.GET )
	public List<Daily> getBudgetOverviewList( @PathVariable String planId ) throws Exception {
		
		List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		return budgetOverviewList;
	}
	
	
}
