package com.ksy.service.myPage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.common.Search;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.TripSurvey;
import com.ksy.service.myPage.MyPageDao;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserDao;
import com.ksy.service.user.UserService;


@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	@Autowired
	@Qualifier("myPageDaoImpl")
	private MyPageDao myPageDao;
	public void setMyPageDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}
	
	
	public MyPageServiceImpl() {
		super();
	}


	@Override
	public void addPoint(Point point) throws Exception {
		System.out.println("myPageService addPoint");
		myPageDao.addPoint(point);
	}

	@Override
	public Map<String, Object> getPointList(Search search ,String userId) throws Exception {
		System.out.println("myPageService getPointList");
		
		
		List<Point> pointList = myPageDao.getPointList(search,userId);
		int totalCount = myPageDao.getPointListTotalCount(search, userId);
		
		
		
		Map map = new HashMap(); 
		
		map.put("pointList", pointList);
		map.put("totalCount",totalCount);
		
		
		return map; 
	}
	
	public List getChoolCheckList(String userId)throws Exception{
		System.out.println("myPageService getChoolCheckList");
		return myPageDao.getChoolCheckList(userId);
	}
	
	public void updateTotalPoint(Point point)throws Exception {
		System.out.println("myPageService updateTotalPoint");
		myPageDao.updateTotalPoint(point);
		
	}
	
	
	
	
	
	
	
	
	
		///////////////////////survey//////////////////////
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception{
		System.out.println("UserServiceImpl addTripSurvey");
		myPageDao.addTripSurvey(tripSurvey);
	}
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception{
		System.out.println("UserDaoImpl getTripSurveyList");
		return myPageDao.getTripSurveyList(userId);
	}

	

	

}
