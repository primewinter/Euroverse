package com.ksy.service.admin;

import java.util.Map;

import com.ksy.common.Search;

public interface AdminService {

	public Map<String,Object> getUserList(Search search) throws Exception;
	
}
