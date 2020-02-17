package com.ksy.service.admin;

import java.util.Map;

import com.ksy.common.Search;

public interface AdminService {

	public Map<String,Object> getUserList(Search search) throws Exception;
	
	public void updatePostReport(String postId) throws Exception;
	
	public void updateCommReport(String commId) throws Exception;
		
	public Map<String, Object> getQnaCommList(String postId) throws Exception;
	
}
