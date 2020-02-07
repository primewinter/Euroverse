package com.ksy.service.tripInfo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.TripInfo;
import com.ksy.service.tripInfo.TripInfoDao;

@Repository("tripInfoDaoImpl")
public class TripInfoDaoImpl implements TripInfoDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public TripInfoDaoImpl() {
		System.out.println(this.getClass());

	}

	public void insertUrl(TripInfo tripInfo) {
		sqlSession.insert("TripInfoMapper.insertUrl", tripInfo);
	}

	public TripInfo getUrl(int id) {

		return sqlSession.selectOne("TripInfoMapper.getUrl", id);

	}
}