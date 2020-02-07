package com.ksy.service.tripInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.Click;
import com.ksy.service.tripInfo.ClickDao;
import com.ksy.service.tripInfo.ClickService;



@Service("clickServiceImpl")
public class ClickServiceImpl implements ClickService{
	
	///Field
	@Autowired
	@Qualifier("clickDaoImpl")
	private ClickDao clickDao;
	public void setClickDao(ClickDao clickDao) {
		this.clickDao = clickDao;
	}
	
	///Constructor
	public ClickServiceImpl() {
		System.out.println(this.getClass());
	}

	//@Override
	public void addUrl(Click click) throws Exception {
		clickDao.insertUrl(click);
	}
	//@Override
	public Click getUrl(int id) throws Exception {
		return clickDao.getUrl(id);
	}
	
}