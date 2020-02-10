package com.ksy.service.myPage.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.Point;
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
	public List getPointList(String userId) throws Exception {
		System.out.println("MyPageDao getPointList");
		return sqlSession.selectList("UserMapper.getPointList",userId);
	}
	
	public List getChoolCheckList(String userId)throws Exception{
		System.out.println("MyPageDao getChoolCheckList");
		return sqlSession.selectList("UserMapper.getChoolCheckList",userId);
	}
	
	public void updateTotalPoint(Point point)throws Exception {
		System.out.println("MyPageDao updateTotalPoint");
		sqlSession.update("UserMapper.updateTotalPoint",point);
	}

}
