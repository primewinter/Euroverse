package com.ksy.service.myPage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.Point;
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
	public List getPointList(String userId) throws Exception {
		System.out.println("myPageService getPointList");
		return myPageDao.getPointList(userId);
	}
	
	public List getChoolCheckList(String userId)throws Exception{
		System.out.println("myPageService getChoolCheckList");
		return myPageDao.getChoolCheckList(userId);
	}
	
	public void updateTotalPoint(Point point)throws Exception {
		System.out.println("myPageService updateTotalPoint");
		myPageDao.updateTotalPoint(point);
		
	}

	

}
