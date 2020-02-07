package com.ksy.service.tripInfo;

import com.ksy.service.domain.TripInfo;



public interface TripInfoDao {
	
	// INSERT
	public void insertUrl(TripInfo url) throws Exception ;
		
	public TripInfo getUrl(int id) throws Exception;

}