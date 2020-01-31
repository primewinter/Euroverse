package com.ksy.service.order.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Order;
import com.ksy.service.order.OrderDao;

@Repository("orderDaoImpl")
public class OrderDaoImpl implements OrderDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public OrderDaoImpl() {
		System.out.println(this.getClass());
	}
	public void addFlightOrder(Order order) throws Exception{
		sqlSession.insert("OrderMapper.addFlightOrder", order);
	}
	public void addRoomOrder(Order order) throws Exception {
		sqlSession.insert("OrderMapper.addRoomOrder", order);
	}
	
	public Order getFlightOrder(String orderId) throws Exception{
		return sqlSession.selectOne("OrderMapper.getFlightOrder", orderId);
	}
	public Order getRoomOrder(String orderId) throws Exception{
		return sqlSession.selectOne("OrderMapper.getRoomOrder", orderId);
	}
		
	public List<Order> getOrderList(Search search) throws Exception {
		return sqlSession.selectList("OrderMapper.getOrderList", search);

	}
		
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);

	}
	
//	public String makeCurrentPageSql(String sql, Search search) {
//		return sqlSession.selectOne(sql, search);
//	}


}
