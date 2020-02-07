package com.ksy.service.tripInfo;

import java.util.List;

import com.model2.mvc.service.domain.Click;


public interface ClickDao {
	
	// INSERT
	public void insertUrl(Click url) throws Exception ;
		
	public Click getUrl(int id) throws Exception;

}