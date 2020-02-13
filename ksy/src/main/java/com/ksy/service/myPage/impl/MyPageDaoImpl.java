package com.ksy.service.myPage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.TripSurvey;
import com.ksy.service.myPage.MyPageDao;
import com.ksy.service.user.UserDao;

@Repository("myPageDaoImpl")
public class MyPageDaoImpl implements MyPageDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MyPageDaoImpl() {
		super();
	}



	@Override
	public void addPoint(Point point) throws Exception {
		System.out.println("MyPageDao addPoint");
		sqlSession.insert("UserMapper.addPoint",point);
		System.out.println("add¿Ï·á");
	}

	@Override
	public List<Point> getPointList(Search search ,String userId) throws Exception {
		System.out.println("MyPageDao getPointList");
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId",userId);
		//map.put("boardName", boardName);
		System.out.println(map);
		
		return sqlSession.selectList("UserMapper.getPointList",map);
	}
	
	public int getPointListTotalCount(Search search ,String userId)throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId",userId);
		
		return sqlSession.selectOne("UserMapper.getPointListTotalCount",map);
	}
	
	
	
	public List getChoolCheckList(String userId)throws Exception{
		System.out.println("MyPageDao getChoolCheckList");
		return sqlSession.selectList("UserMapper.getChoolCheckList",userId);
	}
	
	public void updateTotalPoint(Point point)throws Exception {
		System.out.println("MyPageDao updateTotalPoint");
		sqlSession.update("UserMapper.updateTotalPoint",point);
	}
	
	
	
	
	
	
	
	
	
	
	
	public void addTripSurvey(TripSurvey tripSurvey) throws Exception{
		System.out.println("UserDaoImpl addTripSurvey");
		sqlSession.insert("UserMapper.addTripSurvey",tripSurvey);
	}
	
	
	
	public List<TripSurvey> getTripSurveyList(String userId) throws Exception{
		System.out.println("UserDaoImpl getTripSurveyList");
		return sqlSession.selectList("UserMapper.getTripSurveyList",userId);
	}
	
	
	
	

}
