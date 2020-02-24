package com.ksy.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.admin.AdminDao;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
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
	@Override
	public void updatePostReport(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl updatePostReport");
		sqlSession.update("AdminMapper.adminPostBlocked", postId);
		
	}
	@Override
	public void updateCommReport(String commId) throws Exception {
		
		System.out.println("AdminDaoImpl updateCommReport");
		sqlSession.update("AdminMapper.adminCmtBlocked", commId);
	}
	@Override
	public List<Comment> getQnaComment(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl getQnaCommList");
		
		return sqlSession.selectList("AdminMapper.getQnaComment", postId);
		
	}
	@Override
	public void addQnaComment(Comment comment) throws Exception{
		
		System.out.println("AdminDaoImpl addQnaComment");
		
		sqlSession.insert("AdminMapper.addQnaComment");
	}
	@Override
	public List<Post> getAdminQnAList(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getAdminQnAList");
		
		return sqlSession.selectList("AdminMapper.getAdminQnAList", search);
	}
	@Override
	public int getAdminQnaListTotalCount(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getAdminQnaListTotalCount");
		
		return sqlSession.selectOne("AdminMapper.getAdminQnaListTotalCount", search);
	}
	@Override
	public void updateQnaGrade(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl updateQnaGrade");
		
		sqlSession.update("AdminMapper.updateQnaGrade",postId);
	}
	@Override
	public void deleteQnaComm(String cmtId) throws Exception{
		
		System.out.println("AdminDaoImpl deleteQnaComm");
		
		sqlSession.update("AdminMapper.deleteQnaComm");
	}
}
