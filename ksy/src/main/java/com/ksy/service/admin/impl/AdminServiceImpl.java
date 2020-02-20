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
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageDao;
import com.ksy.service.user.UserDao;

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
	
	public void updatePostReport(String postId) throws Exception{
		
		System.out.println("AdminServiceImpl updatePostReport");
		
		adminDao.updatePostReport(postId);
		
	}
	
	public void updateCommReport(String commId) throws Exception {
		
		System.out.println("AdminServiceImpl updateCommReport");
		
		adminDao.updateCommReport(commId);
		
	}
	
	public Comment getQnaComment(String postId) throws Exception {
		
		System.out.println("AdminServiceImpl getQnaCommList");
		
		Comment comment = new Comment();
		comment = adminDao.getQnaComment(postId);
		
		return comment;
	}
	
	public void addQnaComment(Comment comment) throws Exception {
		
		System.out.println("AdminServiceImpl addQnaComment");
		
		adminDao.addQnaComment(comment);
		
	}
	
	//관리자qna 리스트 조회
	public Map<String, Object> getAdminQnAList(Search search) throws Exception{
		
		System.out.println("AdminServiceImpl getAdminQnAList");

		List<Post> list = adminDao.getAdminQnAList(search);
		int totalCount = adminDao.getAdminQnaListTotalCount(search);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	
	

}
