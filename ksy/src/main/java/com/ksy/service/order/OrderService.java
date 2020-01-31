package com.ksy.service.order;

import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.Order;


public interface OrderService {
	
	public void addFlightOrder(Order order) throws Exception;
	
	public void addRoomOrder(Order order) throws Exception;
	
	public Order getFlightOrder(String orderId) throws Exception;
	
	public Order getRoomOrder(String orderId) throws Exception;
	
	public Map<String,Object> getOrderList(Search search) throws Exception;
	
	
}