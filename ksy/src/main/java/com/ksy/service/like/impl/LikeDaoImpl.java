package com.ksy.service.like.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.Like;
import com.ksy.service.like.LikeDao;

//==> ȸ������ DAO CRUD ����
@Repository("likeDaoImpl")
public class LikeDaoImpl implements LikeDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public LikeDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void like_check(Like like) throws Exception {
		sqlSession.update("LikeMapper.like_check", like);
	}
		
	public void like_check_cancel(Like like) throws Exception {
		sqlSession.update("LikeMapper.like_check_cancel", like);
	}

	public int countByLike(Like like) throws Exception {
		return sqlSession.selectOne("LikeMapper.countByLike", like);
	}
	
	public Like getLike(Like like) throws Exception {
		return sqlSession.selectOne("LikeMapper.getLike", like);
	}
	
	public void addLike(Like like) throws Exception {
		sqlSession.insert("LikeMapper.addLike", like);
	}
	
}