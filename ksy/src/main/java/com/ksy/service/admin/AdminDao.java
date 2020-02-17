package com.ksy.service.admin;

import java.util.List;
import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.User;

public interface AdminDao {

	public List<User> getUserList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;

}
