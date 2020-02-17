package com.ksy.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.common.Search;
import com.ksy.service.admin.AdminDao;
import com.ksy.service.admin.AdminService;
import com.ksy.service.domain.User;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	@Qualifier("adminDaoImpl")
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	//Constructor
	public AdminServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		
		System.out.println("AdminServiceImpl getUserList");
		
		List<User> list = adminDao.getUserList(search);
		int totalCount = adminDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
