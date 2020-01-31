package com.ksy.service.room.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Room;
import com.ksy.service.room.RoomDao;

@Repository("roomDaoImpl")
public class RoomDaoImpl implements RoomDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public RoomDaoImpl() {
		System.out.println(this.getClass());
	}
	public void addRoom(Room room) throws Exception{
		sqlSession.insert("RoomMapper.addRoom", room);
	}
	
	public Room getRoom(String roomId) throws Exception{
		return sqlSession.selectOne("RoomMapper.getRoom", roomId);
	}
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);

	}
	
//	public String makeCurrentPageSql(String sql, Search search) {
//		return sqlSession.selectOne(sql, search);
//	}


}
