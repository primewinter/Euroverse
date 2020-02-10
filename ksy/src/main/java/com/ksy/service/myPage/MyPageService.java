package com.ksy.service.myPage;

import java.util.List;

import com.ksy.service.domain.Point;

public interface MyPageService {
	
	public void addPoint(Point point) throws Exception;
	public List getPointList(String userId) throws Exception;
	public List getChoolCheckList(String userId)throws Exception;
	
	public void updateTotalPoint(Point point)throws Exception;

}
