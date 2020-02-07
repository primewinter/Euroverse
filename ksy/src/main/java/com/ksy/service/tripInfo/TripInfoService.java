package com.ksy.service.tripInfo;

import com.ksy.service.domain.TripInfo;

public interface TripInfoService {
	
	//url¡÷º“ insert
	public void addUrl(TripInfo tripInfo) throws Exception;
	
	public TripInfo getUrl(int id) throws Exception;
	

}