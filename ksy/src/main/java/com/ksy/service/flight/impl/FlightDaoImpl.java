package com.ksy.service.flight.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Flight;
import com.ksy.service.flight.FlightDao;

@Repository("flightDaoImpl")
public class FlightDaoImpl implements FlightDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public FlightDaoImpl() {
		System.out.println(this.getClass());
	}
	public void addFlight(Flight flight ) throws Exception{
		sqlSession.insert("FlightMapper.addFlight", flight);
	}
	
	public Flight getFlight(String flightId) throws Exception{
		return sqlSession.selectOne("FlightMapper.getFlight", flightId);
	}
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);

	}
	
//	public String makeCurrentPageSql(String sql, Search search) {
//		return sqlSession.selectOne(sql, search);
//	}


}
