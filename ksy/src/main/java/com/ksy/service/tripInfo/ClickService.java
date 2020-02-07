package com.ksy.service.tripInfo;

import com.ksy.service.domain.Click;

public interface ClickService {
	
	//url¡÷º“ insert
	public void addUrl(Click click) throws Exception;
	
	public Click getUrl(int id) throws Exception;
	

}