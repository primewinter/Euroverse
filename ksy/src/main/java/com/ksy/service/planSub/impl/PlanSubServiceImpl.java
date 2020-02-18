package com.ksy.service.planSub.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Memo;
import com.ksy.service.domain.Stuff;
import com.ksy.service.planSub.PlanSubDao;
import com.ksy.service.planSub.PlanSubService;

@Service
public class PlanSubServiceImpl implements PlanSubService {

	@Autowired
	@Qualifier("planSubDaoImpl")
	private PlanSubDao planSubDao;
	public void setPlanSubDao(PlanSubDao planSubDao) {
		this.planSubDao = planSubDao;
	}
	
	public PlanSubServiceImpl() {
		super();
	}



	@Override
	public List<Daily> getBudgetOverview(String planId) throws Exception {
		return planSubDao.getBudgetOverview(planId);
	}

	@Override
	public List<Daily> getBudgetList(String planId) throws Exception {
		return planSubDao.getBudgetList(planId);
	}

	@Override
	public List<Daily> getDailyList(String planId) throws Exception {
		return planSubDao.getDailyList(planId);
	}

	@Override
	public Daily getDaily(Daily daily) throws Exception {
		return planSubDao.getDaily(daily);
	}

	@Override
	public void addDaily(Daily daily) throws Exception {
		planSubDao.addDaily(daily);
	}

	@Override
	public void updateDaily(Daily daily) throws Exception {
		planSubDao.updateDaily(daily);
	}
	
	@Override
	public void deleteDaily(String dailyId) throws Exception {
		planSubDao.deleteDaily(dailyId);
	}
	
	

	@Override
	public List<City> getCityRouteList(String planId) throws Exception {
		return planSubDao.getCityRouteList(planId);
	}

	@Override
	public void addCityRoute(City city) throws Exception {
		planSubDao.addCityRoute(city);
	}

	@Override
	public void deleteCityRoute(String cityId) throws Exception {
		planSubDao.deleteCityRoute(cityId);
	}

	@Override
	public City getCityRoute(String cityId) throws Exception {
		return planSubDao.getCityRoute(cityId);
	}

	@Override
	public void updateCityDuration(City city) throws Exception {
		planSubDao.updateCityDuration(city);
	}

	@Override
	public void updateTranType(City city) throws Exception {
		planSubDao.updateTranType(city);
	}

	@Override
	public void updateVisitOrder(City city) throws Exception {
		planSubDao.updateVisitOrder(city);
	}
	
	
	
	
	

	@Override
	public List<Stuff> getStuffList(String planId) throws Exception {
		return planSubDao.getStuffList(planId);
	}

	@Override
	public void checkStuff(Stuff stuff) throws Exception {
		planSubDao.checkStuff(stuff);
	}

	@Override
	public void addStuff(Stuff stuff) throws Exception {
		planSubDao.addStuff(stuff);
	}

	@Override
	public void updateStuffName(Stuff stuff) throws Exception {
		planSubDao.updateStuffName(stuff);
	}

	@Override
	public void deleteStuff(String stuffId) throws Exception {
		planSubDao.deleteStuff(stuffId);
	}

	@Override
	public List<Memo> getMemoList(String planId) throws Exception {
		return planSubDao.getMemoList(planId);
	}

	@Override
	public void addMemo(Memo memo) throws Exception {
		planSubDao.addMemo(memo);
	}

	@Override
	public void updateMemo(Memo memo) throws Exception {
		planSubDao.updateMemo(memo);
	}

	@Override
	public void deleteMemo(String memoId) throws Exception {
		planSubDao.deleteMemo(memoId);
	}

	@Override
	public void updateMemoCoordinates(Memo memo) throws Exception {
		planSubDao.updateMemoCoordinates(memo);
		
	}
	
	
	//city_info 관련 메소드
	@Override
	public List<City> getCityListByScroll(int zoomLevel) throws Exception {
		return planSubDao.getCityListByScroll(zoomLevel);
	}





	
	

}
