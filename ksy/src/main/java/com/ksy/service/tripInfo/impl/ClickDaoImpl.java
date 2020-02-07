package com.ksy.service.tripInfo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.Click;
import com.ksy.service.tripInfo.ClickDao;

@Repository("clickDaoImpl")
public class ClickDaoImpl implements ClickDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public ClickDaoImpl() {
		System.out.println(this.getClass());

	}

	public void insertUrl(Click click) {
		sqlSession.insert("ClickMapper.insertUrl", click);
	}

	public Click getUrl(int id) {

		return sqlSession.selectOne("ClickMapper.getUrl",id);

	}
}