package com.ksy.service.myPage;

import java.util.List;
import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.TripSurvey;

public interface MyPageService {
	
	public void addPoint(Point point) throws Exception;
	public Map<String , Object> getPointList(Search search ,String userId) throws Exception;
	public List getChoolCheckList(String userId)throws Exception;
	
	public void updateTotalPoint(Point point)throws Exception;

	
	
	
	
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception;
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception;
}
