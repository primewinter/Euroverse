package com.ksy.service.tripInfo;

import com.model2.mvc.service.domain.Click;



public interface ClickService {
	
	//url�ּ� insert
	public void addUrl(Click click) throws Exception;
	
	public Click getUrl(int id) throws Exception;
	

}