package com.ksy.service.order;

import java.util.List;

import com.ksy.common.Search;
import com.ksy.service.domain.Order;


public interface OrderDao {


		public void addFlightOrder(Order order) throws Exception;
		
		public void addRoomOrder(Order order) throws Exception;
		
		public Order getFlightOrder(String orderId) throws Exception;
		
		public Order getRoomOrder(String orderId) throws Exception;
		
		public List<Order> getOrderList(Search search) throws Exception;
		
			
		public int getTotalCount(Search search) throws Exception ;
		
		//public String makeCurrentPageSql(String sql, Search search) ;

}
