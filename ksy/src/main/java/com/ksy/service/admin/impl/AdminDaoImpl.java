package com.ksy.service.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.admin.AdminDao;
import com.ksy.service.domain.User;

@Repository("adminDaoImpl")
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public AdminDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		
		System.out.println("AdminDaoImpl getUserList");
		return sqlSession.selectList("AdminMapper.getUserList", search);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		
		System.out.println("AdminDaoImpl getTotalCount");
		return sqlSession.selectOne("AdminMapper.getTotalCount", search);
	}
	
}
